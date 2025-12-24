INSTALL sqlite;
LOAD sqlite;

-- Step 1: Load the raw CSV into a temporary table
CREATE TABLE tiktok_analysis AS
SELECT *
FROM read_csv_auto('/Users/palmyh/TikTok_Virality_Project1/Engagement_Efficiency_Analysis/tiktok_merged_data_deduplicated.csv');

-- Step 2: Create the cleaned version using COALESCE to merge columns
CREATE OR REPLACE TABLE tiktok_data_set AS
SELECT
    video_id,
    author,
    description,
    likes,
    comments,
    shares,
    COALESCE(plays, views) AS plays,  -- keep plays as primary
    hashtags,
    music,
    COALESCE(create_time, posted_time) AS create_time,  -- unify timestamps
    fetch_time,
    video_url
FROM tiktok_analysis;

-- Verify data imported
SELECT COUNT(*) AS num_rows FROM tiktok_data_set;
SELECT * FROM tiktok_data_set LIMIT 5;

--Exploratory Analysis: Engagement Efficiency Rate 



/* Creating seperate table so it wont mix into the org data */
CREATE OR REPLACE TABLE tiktok_metrics AS
SELECT *
FROM tiktok_data_set;

/* PART ONE: Adding Analytical Coloumns

/* a) Engagement Efficiency Analysis*/
ALTER TABLE tiktok_metrics ADD COLUMN engagement_rate DOUBLE;
UPDATE tiktok_metrics
SET engagement_rate = (likes + comments + shares) / NULLIF(plays, 0);



/* b) b) Interaction Depth Index
This shows how diverse the engagement is — e.g., does the video just get likes, 
or does it drive comments & shares too? */

ALTER TABLE tiktok_metrics ADD COLUMN interaction_depth DOUBLE;
UPDATE tiktok_metrics
SET interaction_depth = 
    CASE 
        WHEN (likes + comments + shares) = 0 THEN 0
        ELSE (comments + shares) / (likes + comments + shares)
    END;


/*c) Engagement ROI (standardized per 1,000 plays)*/
ALTER TABLE tiktok_metrics ADD COLUMN engagement_roi DOUBLE;
UPDATE tiktok_metrics
SET engagement_roi = ((likes + comments + shares) / NULLIF(plays, 0)) * 1000;


/* 📊 STEP 2 — Explore Core Metrics

Now we’ll start exploring the data patterns.

a) Basic Statistics: The typical and variation levels of engagement.*/
SELECT 
    ROUND(AVG(engagement_rate), 4) AS avg_efficiency,
    ROUND(MEDIAN(engagement_rate), 4) AS median_efficiency,
    ROUND(STDDEV(engagement_rate), 4) AS std_efficiency
FROM tiktok_metrics;

/* b) Efficiency Ranking (Top 10%): Identifying top-performing videos by engagement rate.*/
SELECT video_id, author, description, likes, comments, shares, plays, engagement_rate
FROM tiktok_metrics
WHERE engagement_rate >= (
    SELECT PERCENTILE_CONT(0.9) WITHIN GROUP (ORDER BY engagement_rate)
    FROM tiktok_metrics
)
ORDER BY engagement_rate DESC
LIMIT 20;

/* c) Hashtag Efficiency*/
SELECT hashtags, 
       ROUND(AVG(engagement_rate), 4) AS avg_efficiency, 
       COUNT(*) AS count
FROM tiktok_metrics
WHERE hashtags IS NOT NULL
GROUP BY hashtags
HAVING COUNT(*) > 3
ORDER BY avg_efficiency DESC
LIMIT 15;

/*d) Sound Efficiency*/
SELECT music, 
       ROUND(AVG(engagement_rate), 4) AS avg_efficiency, 
       COUNT(*) AS count
FROM tiktok_metrics
WHERE music IS NOT NULL
GROUP BY music
HAVING COUNT(*) > 3
ORDER BY avg_efficiency DESC
LIMIT 15;

/*Temporal Pattern Analysis*/
SELECT STRFTIME('%Y-%m-%d', create_time) AS date,
       ROUND(AVG(engagement_rate), 4) AS avg_eff
FROM tiktok_metrics
GROUP BY date
ORDER BY date;


/* IP Export to PowerBI */
COPY (
    SELECT *
    FROM tiktok_metrics
)
TO '/Users/palmyh/TikTok_Virality_Project1/Engagement_Efficiency_Analysis/tiktok_final_report.csv'
(HEADER, DELIMITER ',');