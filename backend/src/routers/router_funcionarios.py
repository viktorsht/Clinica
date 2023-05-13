from fastapi import APIRouter, Depends, status
from typing import List
from sqlalchemy.orm import Session
from src.infra.sqlalchemy.repositorios.repositorio_funcionarios import RepositorioFuncionario
from src.schemas import schemas
from src.infra.sqlalchemy.config.database import get_db

router = APIRouter()

@router.post('/funcionarios', status_code=status.HTTP_201_CREATED, response_model=schemas.Funcionario)
def cadastrar_funcionario(funcionario: schemas.Funcionario, session: Session = Depends(get_db)):
    funcionario = RepositorioFuncionario(session).criar(funcionario)
    return funcionario

@router.get('/funcionarios', response_model=List[schemas.Funcionario])
def listar_funcionarios(session: Session = Depends(get_db)):
    funcionarios = RepositorioFuncionario(session).listar()
    return funcionarios