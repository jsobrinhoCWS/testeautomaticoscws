*** Settings ***
Library             SeleniumLibrary

*** Variables ***
${BROWSER}          chrome
${URL}              https://www.sandbox.canaldaloja.com.br/auth/signIn
${LINK}             xpath=//*[@id="wrapper"]/header/nav[1]//div/div[2]/a[1]
${IMG-LOGO}         https://www.sandbox.canaldaloja.com.br/static/dkAjOuYU5fJUq5aL9TMXhAyRSaekrEsUohP0PXDKi7p.png
${CAMPO-EMAIL}      xpath=//*[@id="username"]
${CAMPO-SENHA}      xpath=//*[@id="password"]
${EMAIL}            tocaobrasg@gmail.com
${SENHA}            cerveja
${BOTAO-LOGIN}      xpath=//*[@id="login"]/form/p/input
${MENU-PRODUTO}     xpath=//*[@id="primary"]/ul/li[7]/a/span[2]

*** Keywords ***
### Setup e TEARDOWN
Abrir navegador
   Open Browser    about:blank   ${BROWSER}
   Maximize Browser Window

Fechar navegador
   Close Browser

### Ações
Acessar a página home do site
    Go to              ${URL}
    Set Selenium Implicit Wait       15 seconds
    Wait Until Element Is Visible   xpath=//*[@id="content"]/div[1]/img
    Title Should Be    Faça seu login no maior shopping peças | Canal da Loja

Informe campo Email
    Click Element      ${CAMPO-EMAIL}
    Input Text         ${CAMPO-EMAIL}  ${EMAIL}

Informe campo Senha
    Click Element      ${CAMPO-SENHA}
    Input Text         ${CAMPO-SENHA}  ${SENHA}

Seleciona botão "Fazer login"
    Click Element      ${BOTAO-LOGIN}

Verifica página de ficha do produto
    Set Selenium Implicit Wait       15 seconds
    Wait Until Element Is Visible    ${TEXT-PRODUTO}
    Page Should Contain Element      ${ADD-CARRINHO}
