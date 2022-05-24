
*** Settings ***
# Recursos comuns
# WEB
Library            ../libs/UtilsLib.py
Library            SeleniumLibrary
Library            String
Library            FakerLibrary                                                     locale=pt_BR
Library            FakerLibrary                                                     locale=en_US
# API
Library            RequestsLibrary
Library            Collections
Library            ${EXECDIR}/automacao_api/compartilhado/recursos/parametros.py
Library            JSONLibrary

*** Variable ***
# Faker
${bigPassword}     FakerLibrary.Random Number                                       digits=55
${firstName}       FakerLibrary.firstName
${lastName}        FakerLibrary.lastName
${phone}           FakerLibrary.Phone Number
${email}           FakerLibrary.Email
${address}         FakerLibrary.Address

# Xpath
localizando por indice -> ${variavel}        (//h1[text()="Transações"])[1]
localizando por texto -> ${variavel}         //div[text()="Gerenciamento"]
localizando por classe -> ${variavel}        //div[@class="swal2-popup swal2-modal swal2-show"]
localizando por indice, classe e texto -> (//div[@class="text-center label label-live-order ng-binding ng-scope"])[1][text()="Executada"]

*** Keywords ***
# Metodos
Click and Scroll Item
    [Arguments]                      ${identifier}
    Wait Until Element Is Visible    ${identifier}                                       30
    ${position}                      Get Vertical Position                               ${identifier}
    Execute Javascript               window.scrollTo(0, window.scrollY + ${position})
    Click Element                    ${identifier}

Scroll Item
    [Arguments]                      ${identifier}
    Wait Until Element Is Visible    ${identifier}                                       30
    ${position}                      Get Vertical Position                               ${identifier}
    Execute Javascript               window.scrollTo(${position},0)

Set Window Size    1920                                                             1080

Close website
    ${datacurrent}                   Get Current Date
    Capture Page Screenshot          ${datacurrent}-test-evidence-.png
    Delete All Cookies
    Close window

FOR                              ${index}                                IN RANGE                    1
    ${checkElement}=                 Run Keyword and Return Status           Wait Until Page Contains    Allow
    LOG                              ${checkElement}
    IF                               ${checkElement} == True
    Click Text                       Allow
    Wait Until Page Contains         Seu serviço foi agendado com sucesso
    ELSE
    Wait Until Page Contains         Seu serviço foi agendado com sucesso
    END
    END

FOR                 ${index}                         IN RANGE                            5
    ${checkElement}=    Run Keyword and Return Status    Wait Until Page Contains Element    ${editPets}
    LOG                 ${checkElement}
    IF                  ${checkElement} == True
    Click Element       ${editPets}
    Click Element       ${deletePets}
    Sleep               1
    Click Element       ${confirmPetExclusion}
    Sleep               2
    ELSE
    Page Should Contain Text                Você ainda não tem pet cadastrado
    END
    END