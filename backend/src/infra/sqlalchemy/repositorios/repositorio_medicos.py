from sqlalchemy import select
from sqlalchemy.orm import Session
from src.schemas import schemas
from src.infra.sqlalchemy.models import models

class RepositorioMedico():

    def __init__(self, db: Session):
        self.db = db

    def criar(self, medico: schemas.Medico):
        db_medico = models.Medico(
            nome=medico.nome,
            email=medico.email,
            telefone=medico.telefone,
            cpf=medico.cpf,
            crm=medico.crm,
            especialidade=medico.especialidade
        )
        self.db.add(db_medico)
        self.db.commit()
        self.db.refresh(db_medico)
        return db_medico

    def listar(self):
        medicos = self.db.query(models.Medico).all()
        return medicos

    def listar_medico(self, id_medico: int):
        stmt = select(models.Medico).where(models.Medico.id == id_medico)
        user = self.db.execute(stmt)
        return user.scalar()
    
    def listar_usuario_nome(self, nome: str):
        stmt = select(models.Medico).where(models.Medico.nome == nome)
        user = self.db.execute(stmt)
        return user.scalar()