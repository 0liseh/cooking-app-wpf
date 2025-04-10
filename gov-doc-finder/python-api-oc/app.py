from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import RedirectResponse
from api.models.search_engine_models import QueryRequest

# Create Fast API app
app = FastAPI()

# CORS for React
app.add_middleware(
    CORSMiddleware,
    allow_origins=["localhost:3000", "localhost:8000"],  # Replace with React URL in production
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Endpoints
@app.get("/", include_in_schema=False)
async def root():
    return RedirectResponse(url="/docs")

@app.post("/search")
async def search_documents(request: QueryRequest):
    return {"results": request.query}
