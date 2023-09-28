*** Settings ***
Documentation        Arquivo com as configurações basica entre as suite de teste

Library        RequestsLibrary
Library        Collections
Library        factories/user.py

Resource             env.resource
Resource             service/login.resource

*** Keywords ***
