from datetime import datetime
from fastapi import APIRouter, Depends, HTTPException, status
from typing import List
from sqlalchemy.orm import Session
from src.infra.sqlalchemy.repositorios.repositorio_atendimentos import RepositorioAtendimento
from src.infra.sqlalchemy.repositorios.repositorio_clientes import RepositorioCliente
from src.infra.sqlalchemy.repositorios.repositorio_medicos import RepositorioMedico
from src.schemas import schemas
from src.infra.sqlalchemy.config.database import get_db

router = APIRouter()

@router.post('/atendimentos', status_code=status.HTTP_201_CREATED, response_model=schemas.AtendimentoFront)
def cadastrar_atendimento(atendimento: schemas.Atendimento, session: Session = Depends(get_db)):
    atendimento_encontrado = RepositorioAtendimento(session).verificar_atendimento(atendimento)
    if atendimento_encontrado:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail="Este atendimento já existe")
    criado = RepositorioAtendimento(session).criar(atendimento)

    cliente = RepositorioCliente(session).listar_cliente(criado.cliente_id)
    medico = RepositorioMedico(session).listar_medico(criado.medico_id)
    
    atendimento_criado = schemas.AtendimentoFront(
        id=criado.id, 
        cliente=cliente, 
        medico=medico, 
        horario=criado.horario 
    )
    return atendimento_criado

@router.get('/atendimentos', response_model=List[schemas.AtendimentoFront])
def listar_atendimentos(session: Session = Depends(get_db)):
    list = []
    atendimentos = RepositorioAtendimento(session).listar()
    for e in atendimentos:
        cliente = RepositorioCliente(session).listar_cliente(e.cliente_id)
        medico = RepositorioMedico(session).listar_medico(e.medico_id)
        atendimento = schemas.AtendimentoFront(
            id=e.id, 
            cliente=cliente, 
            medico=medico, 
            horario=e.horario 
        )
        list.append(atendimento)
    return list

@router.get('/atendimentos/hoje', response_model=List[schemas.AtendimentoFront])
def atendimentos_hoje(session: Session = Depends(get_db)):
    list = []
    atendimentos = RepositorioAtendimento(session).listar()
    if not atendimentos:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Não há atendimentos para hoje!")
    else:
        for e in atendimentos:
            if( e.horario == datetime.now().date()):
                cliente = RepositorioCliente(session).listar_cliente(e.cliente_id)
                medico = RepositorioMedico(session).listar_medico(e.medico_id)
                atendimento = schemas.AtendimentoFront(
                    id=e.id, 
                    cliente=cliente, 
                    medico=medico, 
                    horario=e.horario
                )
                list.append(atendimento)
    return list

@router.put('/atendimentos/{idAtendimento}', status_code=status.HTTP_200_OK)
def atualizar_cliente(idAtendimento: int, atendimento: schemas.Atendimento, db: Session = Depends(get_db)):
    atendimento_encontrado = RepositorioAtendimento(db).atualizar(idAtendimento, atendimento)
    return atendimento_encontrado

@router.delete('/atendimentos/{idAtendimento}', status_code=status.HTTP_200_OK, response_model=schemas.AtendimentoFront)
def remover_cliente(idAtendimento: int, session: Session = Depends(get_db)):
    atendimento = RepositorioAtendimento(session).remover(idAtendimento)
    if atendimento:
        cliente = RepositorioCliente(session).listar_cliente(atendimento.cliente_id)
        medico = RepositorioMedico(session).listar_medico(atendimento.medico_id)
        atendimento_front = schemas.AtendimentoFront(
            id=atendimento.id, 
            cliente=cliente, 
            medico=medico, 
            horario=atendimento.horario
        )
    else: 
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Erro, não encontrado!")
    return atendimento_front