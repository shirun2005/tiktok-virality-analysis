# Decoding Virality: TikTok Engagement Efficiency (2025)
An analytical deep dive into how sentiment and structure drive engagement efficiency across 6,000+ TikTok videos — built using **SQL**, **Python**, and **Tableau**.

### 1. Engagement Efficiency & Funnel Metrics
![Engagement Dashboard Preview](Dashboard%20Preview/TikTok%20Engagement%20Dashboard%20(2025).png)

### 2. Sentiment Analysis: How Emotion Drives Virality
![Sentiment Dashboard Preview](Dashboard%20Preview/TikTok%20Sentiment%20Dashboard%20(2025).png)


---

## 📊 Overview
This project investigates the underlying mechanisms of virality on TikTok through a multidimensional analysis of over 6,000 videos collected via RapidAPI. Rather than relying on raw engagement counts, the study introduces a behavioral performance framework centered on engagement efficiency, the rate at which exposure (plays) is converted into active interactions (likes, comments, shares).

Using DuckDB for data modeling, Python’s VADER sentiment analysis for linguistic interpretation, and Tableau for advanced visualization, the project decodes the interplay between emotional tone, content structure, and audience retention dynamics. By quantifying the relationship between sentiment polarity, trend stability, and interaction depth, this analysis reveals the structural tendencies behind sustainable engagement versus short-lived virality.

### Key Analytical Dimensions:

**Engagement Conversion Funnel:** Measuring how efficiently viewers transition from exposure to interaction.

**Interaction Depth Index:** Evaluating the diversity and intensity of audience response beyond passive approval.

**Sentiment–Virality Correlation:** Assessing how emotional tone influences engagement sustainability and volatility.

**Hashtag–Sound Dynamics:** Identifying content archetypes that drive algorithmic amplification.

Together, these analyses contribute to a framework for understanding not just what goes viral, but why certain content sustains engagement in algorithmic ecosystems.

---

## 🧰 Tools & Techniques
| Tool | Purpose |
|------|----------|
| **Python (VADER)** | Sentiment classification, text preprocessing, and polarity scoring |
| **SQL (DuckDB)** | Data aggregation, metric computation, and ETL modeling |
| **Tableau** | Interactive visualization, trend analysis, and KPI benchmarking |

---

## 🗂️ Project Structure
The repository is organized into two analytical modules — **Engagement Efficiency Analysis** and **Sentiment Analysis** , connected through a unified DuckDB database for lightweight querying and Tableau visualization.


---

## 📈 Key Insights
### 🧩 Engagement Efficiency  
- Engagement on TikTok is **high-volume but shallow** , only **9.14%** of viewers move beyond likes to share or comment.  
- The **Engagement Funnel (Plays → Likes → Shares → Comments)** shows a sharp decline: **10.9%**, **1.2%**, and **0.1%**, revealing the behavioral gap between attention and action.  
- Efficiency peaks around **0.08–0.18 engagement rate**, then plateaus,once attention becomes emotion-driven, retention depends on *connection*, not exposure.  
- Videos with **sports-, event-, or entertainment-related hashtags** and **original or trend-aligned audio** demonstrate higher engagement consistency.  

> 💡 **Insight:** Sustainable engagement depends more on emotional resonance and interaction design than on algorithmic reach.

---

### 💬 Sentiment & Virality  
- **Neutral and positive tones** correlate with higher engagement and virality, while negative sentiment underperforms.  
- Emotional **relatability** — humor, motivation, and nostalgia  consistently drives deeper engagement.  
- Viral keywords like *“fyp,” “funny,” “graduation,” “relatable”* highlight how community-centered emotions outperform sensationalism.  

> 💡 **Insight:** TikTok’s algorithm rewards emotionally balanced, relatable content that sustains viewer interaction over time.

---

### 🧠 Takeaway  
Virality on TikTok is not random , it’s **engineered through emotional equilibrium**.  
Content that balances **curiosity-driven discovery** (reach) with **emotion-driven depth** (connection) achieves the highest engagement efficiency across all metrics.

## 📚 Dataset
Dataset sourced via **RapidAPI**, publicly available on Kaggle:  
[TikTok 2025 Dataset](https://www.kaggle.com/datasets/haziqhalifi/tiktok-2025-dataset)

---

## 🖥️ Dashboard Preview
Explore the interactive Tableau dashboard:  
👉 *[Tableau Public – TikTok Engagement Virality Analysis](https://public.tableau.com/app/profile/sirinya.hirunviriya/viz/DecodingViralityTikTokEngagementSentimentDashboard2025/Dashboard1)*

---

## 👩🏻‍💻 Author
**[Sirinya Hirunviriya]**  
University of Washington Informatics | Visualization & Storytelling | Python + SQL + Tableau  
📧 shirun@uw.edu | 
