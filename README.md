# Clinica Médica

A Clinica Médica é uma solução WEB para o gerenciamento de atendimentos em uma clinica. O projeto foi construindo utilizando o banco de dados postgres, FastAPI e Flutter WEB. 

## Requisitos Necessários.

  Esta seção consta os requisitos necessários para execução do sistema. Julgando-se necessário que seja instalado de primeira mão o [Python](https://www.python.org/downloads/), o [Postgres](https://www.postgresql.org/) e o [Flutter](https://flutter.dev/).

### BACKEND
  
  Para utilizar o backend da aplicação é necessário a instalar o [FastAPI](https://fastapi.tiangolo.com/pt/) e algumas bibliotecas importantes ao projeto através do [Pip](https://pypi.org/project/pip/), o instador padrão do Python.
  
  
  - FastAPI: 

      ~~~linux
      pip install fastapi
      ~~~
      
  - Uvicorn: 

      ~~~linux
      pip install uvicorn
      ~~~
  
  - sqlalchemy: 

      ~~~linux
      pip install sqlalchemy
      ~~~
        
  - passlib: 

      ~~~linux
      pip install passlib
      ~~~  
  - python-jose: 

      ~~~linux
      pip install python-jose
      ~~~
  - psycopg2: 

      ~~~linux
      pip install psycopg2
      ~~~


## __Execução do sistema__.

### __Backend__

- Executar API: Dentro da pasta do /backend faça:

    ~~~linux
    python3 -m uvicorn src.main:app --reload --host 0.0.0.0
    ~~~

### __Banco de dados__
É válido que você não tenha o banco de dados utilizado nesta aplicação para executar seus teste, então:

- No arquivo *backend/src/infra/sqlalchemy/config/config_db.py* está as configurações do banco de dados. Configure os dados necessários para que ele acesse o seu postgres.

- No arquivo *backend/src/infra/sqlalchemy/config/database.py* é necessário descomentar a função de criação do banco de dados, a função *criar_bd*.


### FRONTEND

Edite o arquivo *api.dart* que está em */lib/api/api.dart*

- Coloque o IP da máquina que está executando a API na variável __myIP__.

    ~~~linux
    myIP = 'Coloque o IP da API':8000
    ~~~
