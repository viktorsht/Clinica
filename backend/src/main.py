from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from src.routers import router_usuarios, router_funcionarios, router_medicos, router_atendimento

app = FastAPI()

origins = [
    'http://127.0.0.1:8000',
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(router_usuarios.router, prefix='/api')
app.include_router(router_funcionarios.router, prefix='/api')
app.include_router(router_medicos.router, prefix='/api')
app.include_router(router_atendimento.router, prefix='/api')

@app.get('/')
def init_api():
    return {'data' : 'API ok!'}