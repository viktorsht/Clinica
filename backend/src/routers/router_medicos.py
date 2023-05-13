from fastapi import APIRouter, Depends, status
from typing import List
from sqlalchemy.orm import Session
from src.infra.sqlalchemy.repositorios.repositorio_medicos import RepositorioMedico
from src.schemas import schemas
from src.infra.sqlalchemy.config.database import get_db

router = APIRouter()

@router.post('/medicos', status_code=status.HTTP_201_CREATED, response_model=schemas.Medico)
def cadastrar_medico(medico: schemas.Medico, session: Session = Depends(get_db)):
    medico = RepositorioMedico(session).criar(medico)
    return medico

@router.get('/medicos', response_model=List[schemas.Medico])
def listar_medicos(session: Session = Depends(get_db)):
    medicos = RepositorioMedico(session).listar()
    return medicos