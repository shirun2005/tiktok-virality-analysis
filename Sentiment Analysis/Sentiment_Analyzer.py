import pandas as pd
from textblob import TextBlob
from nltk.sentiment.vader import SentimentIntensityAnalyzer
import nltk, re

# Download once if not already
nltk.download('vader_lexicon')

# Load your dataset
df = pd.read_csv("/Users/palmyh/TikTok_Virality_Project1/Data_TikTok/tiktok_final_report.csv")

# Initialize VADER
sia = SentimentIntensityAnalyzer()

# ----------------------------------------------------------
# 1️⃣ Emoji & Slang Mapping (TikTok-specific)
# ----------------------------------------------------------
emoji_map = {
    "😂": "positive", "🤣": "positive", "😭": "positive", "💀": "positive",
    "🔥": "positive", "❤️": "positive", "😍": "positive", "😩": "neutral",
    "😡": "negative", "🤢": "negative", "💔": "negative"
}

def emoji_sentiment(text):
    for e, val in emoji_map.items():
        if e in text:
            return val
    return None

# ----------------------------------------------------------
# 2️⃣ Combined Sentiment Calculation
# ----------------------------------------------------------
def hybrid_sentiment(text):
    text = str(text).lower()
    
    # A. Emoji rule first (dominant for short captions)
    emoji_label = emoji_sentiment(text)
    if emoji_label:
        return emoji_label
    
    # B. VADER compound score
    vader_score = sia.polarity_scores(text)['compound']
    
    # C. TextBlob score
    tb_score = TextBlob(text).sentiment.polarity
    
    # D. Weighted hybrid score (70% VADER + 30% TextBlob)
    hybrid_score = (0.7 * vader_score) + (0.3 * tb_score)
    
    # E. Classify based on thresholds
    if hybrid_score > 0.1:
        return "positive"
    elif hybrid_score < -0.1:
        return "negative"
    else:
        return "neutral"

# Apply the function
df["hybrid_sentiment"] = df["description"].apply(hybrid_sentiment)

# Save the new file
df.to_csv("/Users/palmyh/TikTok_Virality_Project1/Sentiment Analysis/tiktok_with_hybrid_sentiment.csv", index=False)

print("✅ Hybrid sentiment labels added successfully!")
print(df["hybrid_sentiment"].value_counts())
