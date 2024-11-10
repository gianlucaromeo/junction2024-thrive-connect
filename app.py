from fastapi import FastAPI
from pydantic import BaseModel
from transformers import pipeline

# Initialize the FastAPI app and the sentiment analyzer
app = FastAPI()
sentiment_analyzer = pipeline("sentiment-analysis")

# Define a Pydantic model to handle the input data
class TextRequest(BaseModel):
    text: str

# Define the function that categorizes keywords into positive or negative
def categorize_keywords(text):
    keywords = ["good environment", "team", "mental health", "well-being", "meditation", "puzzles", "not enough time", "drawback","hate playing football"]
    categorized_keywords = {"positive": [], "negative": []}

    # Analyze the sentiment of each keyword
    for keyword in keywords:
        sentiment = sentiment_analyzer(keyword)[0]
        if sentiment['label'] == 'POSITIVE':
            categorized_keywords["positive"].append(keyword)
        else:
            categorized_keywords["negative"].append(keyword)
    
    return categorized_keywords

# Define the API endpoint for keyword categorization
@app.post("/categorize_keywords")
async def categorize_keywords_api(request: TextRequest):
    categorized_keywords = categorize_keywords(request.text)
    return categorized_keywords
