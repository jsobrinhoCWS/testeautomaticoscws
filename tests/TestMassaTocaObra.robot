*** Settings ***
Resource            ../resource/ResourceMassa.robot
Test Setup          Abrir navegador
# Test Teardown       Fechar navegador

### SETUP ele roda keyword antes da Suite ou antes de um teste
### TEARDOWN ele roda keyword depois de uma Suite ou um teste

*** Test Case ***
Cenário 01: Pedido de compra Logado
    Dado que estou na página home do site
    Quando informo os dados do login
    Então sistema direciona para página do canal da loja

#
# Cenário 02: Pedido de compra Não Logado
#     Dado que estou na página home do site
#     Quando selecionar um produto
#     Então direciona o cliente para a página de ficha de produto

*** Keywords ***
Dado que estou na página home do site
    Acessar a página home do site

Quando informo os dados do login
    Informe campo Email
    Informe campo Senha
    Seleciona botão "Fazer login"

Então sistema direciona para página do canal da loja
    Verifica página de ficha do produto
