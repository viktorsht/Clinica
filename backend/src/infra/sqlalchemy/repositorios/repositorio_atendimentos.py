from datetime import datetime
from sqlalchemy import select, delete, update
from sqlalchemy.orm import Session
from src.schemas import schemas
from src.infra.sqlalchemy.models import models

class RepositorioAtendimento():

    def __init__(self, db: Session):
        self.db = db

    def criar(self, atendimento: schemas.Atendimento):
        db_atendimento = models.Atendimento(
            medico_id=atendimento.medico_id,
            cliente_id=atendimento.cliente_id,
            horario=atendimento.horario
        )
        self.db.add(db_atendimento)
        self.db.commit()
        self.db.refresh(db_atendimento)
        return db_atendimento

    def listar(self):
        atendimentos = self.db.query(models.Atendimento).all()
        return atendimentos
    
    def verificar_atendimento(self, atendimento: schemas.Atendimento):
        stmt = select(models.Atendimento).where(
            models.Atendimento.horario == atendimento.horario,
            models.Atendimento.cliente_id == atendimento.cliente_id,
            models.Atendimento.medico_id == atendimento.medico_id,
        )
        user = self.db.execute(stmt)
        return user.scalar()
    
    def listar_atendimentos_hoje(self):
        hoje = datetime.now().date()
        stmt = select(models.Atendimento).where(models.Atendimento.horario == hoje)
        atendimentos = self.db.execute(stmt).fetchall()
        return atendimentos
    
    def listar_atendimento(self, idAtendimento: int):
        stmt = select(models.Atendimento).where(models.Atendimento.id == idAtendimento)
        atendimento = self.db.execute(stmt)
        return atendimento.scalar()
    
    def atualizar(self, id: int,  atendimento: schemas.Atendimento):
        stmt = update(models.Atendimento).where(models.Atendimento.id == id).values(
            cliente_id=atendimento.cliente_id,
            medico_id=atendimento.medico_id, 
            horario=atendimento.horario
        )
        self.db.execute(stmt)
        self.db.commit()
        return self.listar_atendimento(id)

    def remover(self, id: int):
        atendimento = self.listar_atendimento(id)
        stmt = delete(models.Atendimento).where(models.Atendimento.id == id)
        self.db.execute(stmt)
        self.db.commit()
        return atendimento