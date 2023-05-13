from datetime import date
from pydantic import BaseModel
from typing import List, Optional

class Cliente(BaseModel):
    id: Optional[int] = None
    nome: str
    cpf: str
    email: str
    telefone: str
    endereco: str
    class Config:
        orm_mode = True

class Funcionario(BaseModel):
    id: Optional[int] = None
    nome: str
    cpf: str
    cargo: str
    email: str
    telefone: str
    senha: str
    class Config:
        orm_mode = True

class FuncionarioLogado(BaseModel):
    id: Optional[int] = None
    nome: str
    cpf: str
    cargo: str
    email: str
    telefone: str
    class Config:
        orm_mode = True

class Login(BaseModel):
    email: str
    senha: str

class LoginSucess(BaseModel):
    funcionario: FuncionarioLogado
    token: str

class Medico(BaseModel):
    id: Optional[int] = None
    nome: str
    email: str
    telefone: str
    cpf: str
    crm: str
    especialidade: str
    class Config:
        orm_mode = True

class Atendimento(BaseModel):
    id: Optional[int] = None
    medico_id: int
    cliente_id: int
    horario: date
    class Config:
        orm_mode = True

class AtendimentoFront(BaseModel):
    id: Optional[int] = None
    medico: Medico
    cliente: Cliente
    horario: date
    class Config:
        orm_mode = True