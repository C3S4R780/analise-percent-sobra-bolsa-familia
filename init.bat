@ECHO off

IF EXIST .venv (call :init) ELSE (call :install)

:init
    ECHO Inicializando projeto...
    CALL .venv\Scripts\activate.bat
    jupyter notebook main.ipynb
    EXIT /B 0

:install
    ECHO Criando venv...
    python -m venv .venv

    ECHO Ativando venv...
    CALL .venv\Scripts\activate.bat

    ECHO Instalando dependencias do projeto...
    pip install -r requirements.txt --no-cache-dir
    CLS

    CALL :init

    EXIT /B 0
