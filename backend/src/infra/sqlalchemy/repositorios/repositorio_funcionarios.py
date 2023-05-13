from sqlalchemy import select, delete, update
from sqlalchemy.orm import Session
from src.schemas import schemas
from src.infra.sqlalchemy.models import models

class RepositorioFuncionario():

    def __init__(self, db: Session):
        self.db = db

    def criar(self, funcionario: schemas.Funcionario):
        db_funcionario = models.Funcionario(
            nome=funcionario.nome,
            cpf=funcionario.cpf,
            cargo=funcionario.cargo,
            email=funcionario.email,
            telefone=funcionario.telefone,
            senha=funcionario.senha
        )
        self.db.add(db_funcionario)
        self.db.commit()
        self.db.refresh(db_funcionario)
        return db_funcionario

    def listar(self):
        funcionarios = self.db.query(models.Funcionario).all()
        return funcionarios

    def listar_usuario(self, user_id: int):
        stmt = select(models.Funcionario).where(models.Funcionario.id == user_id)
        user = self.db.execute(stmt)
        return user.scalar()
    
    def verificar_telefone(self, telefone: str):
        stmt = select(models.Funcionario).where(models.Funcionario.telefone == telefone)
        user = self.db.execute(stmt)
        return user.scalar()
    
    def verificar_email(self, email: str):
        stmt = select(models.Funcionario).where(models.Funcionario.email == email)
        user = self.db.execute(stmt)
        return user.scalar()
    
    def atualizar(self, id: int,  funcionario: schemas.Funcionario):
        stmt = update(models.Funcionario).where(models.Funcionario.id == id).values(
            nome = funcionario.nome,
            telefone=funcionario.telefone, 
        )
        self.db.execute(stmt)
        self.db.commit()
        return self.listar_usuario(id)


    def remover(self, user_id: int):
        stmt = delete(models.Funcionario).where(models.Funcionario.id == user_id)
        self.db.execute(stmt)
        self.db.commit()