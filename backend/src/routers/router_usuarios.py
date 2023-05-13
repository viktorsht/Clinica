from fastapi import APIRouter, status, Depends, HTTPException
from sqlalchemy.orm import Session
from typing import List
from src.schemas import schemas
from src.infra.sqlalchemy.repositorios.repositorio_clientes import RepositorioCliente
from src.infra.sqlalchemy.repositorios.repositorio_funcionarios import RepositorioFuncionario
from src.infra.sqlalchemy.config.database import get_db
from src.infra.providers import hash_provider, token_provider
from src.utils.utils_auth import obter_usuario_logado

router = APIRouter()

@router.post('/signup', status_code=status.HTTP_201_CREATED, response_model=schemas.Cliente)
def signup(cliente: schemas.Cliente, db: Session = Depends(get_db)):
    cliente_encontrado = RepositorioCliente(db).verificar_telefone(cliente.telefone)
    if cliente_encontrado:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail="Este telefone já está em uso!")
    cliente_cadastrado = RepositorioCliente(db).criar(cliente)
    return cliente_cadastrado

@router.get('/clientes', response_model=List[schemas.Cliente])
def listar_clientes(db: Session = Depends(get_db)):
    clientes = RepositorioCliente(db).listar()
    return clientes

@router.post('/token', status_code=status.HTTP_200_OK, response_model=schemas.LoginSucess)
def login(login_data: schemas.Login, db: Session = Depends(get_db)):
    senha = login_data.senha
    email = login_data.email
    funcionario = RepositorioFuncionario(db).verificar_email(email)
    if not funcionario:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail="Email ou senha incorretos!")
    senha_valida = hash_provider.hash_password_check(senha, funcionario.senha)
    if not senha_valida:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail="Email ou senha incorretos!")
    token  = token_provider.create_access_token({'sub' : funcionario.email})
    return schemas.LoginSucess(funcionario=funcionario, token=token)
    
@router.get('/me', status_code=status.HTTP_200_OK, response_model=schemas.FuncionarioLogado)
def meu_perfil(funcionario: schemas.Funcionario = Depends(obter_usuario_logado)):
    return funcionario