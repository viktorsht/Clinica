from sqlalchemy import Column, Integer, String, ForeignKey, DATE
from src.infra.sqlalchemy.config.database import Base

class Cliente(Base):
    __tablename__ = 'clientes'

    id = Column(Integer, primary_key=True, autoincrement=True)
    nome = Column(String(50))
    cpf = Column(String(11))
    email = Column(String(100))
    telefone = Column(String(20))
    endereco = Column(String(100))

class Funcionario(Base):
    __tablename__ = 'funcionarios'

    id = Column(Integer, primary_key=True, autoincrement=True)
    nome = Column(String(50))
    cpf = Column(String(11))
    cargo = Column(String(100))
    email = Column(String(100))
    telefone = Column(String(20))
    senha = Column(String(200))

class Medico(Base):
    __tablename__ = 'medicos'

    id = Column(Integer, primary_key=True, autoincrement=True)
    nome = Column(String(50))
    email = Column(String(100))
    telefone = Column(String(20))
    cpf = Column(String(11))
    crm = Column(String(11))
    especialidade = Column(String(100))

class Atendimento(Base):
    __tablename__ = 'atendimentos'

    id = Column(Integer, primary_key=True, autoincrement=True)
    medico_id = Column(Integer, ForeignKey('medicos.id' , name='medico_id')) 
    cliente_id = Column(Integer, ForeignKey('clientes.id' , name='cliente_id')) 
    horario = Column(DATE)
