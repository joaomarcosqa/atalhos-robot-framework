*** Settings ***
Library                                   AppiumLibrary
Library                                   FakerLibrary                                                                                                   locale=pt_BR

*** Variable ***
# Faker
${bigPassword}                            FakerLibrary.Random Number                                                                                     digits=55
${firstName}                              FakerLibrary.firstName
${lastName}                               FakerLibrary.lastName
${phone}                                  FakerLibrary.Phone Number
${email}                                  FakerLibrary.Email
${address}                                FakerLibrary.Address

# Xpath
localizando por texto ->                  //android.widget.Button[contains(@text,"PRÓXIMO")]
localizando por id ->                     //android.widget.Button[contains(@resource-id,"PRÓXIMO")]
localizando por mais de um elemento ->    //android.widget.RadioButton[@resource-id='com.trinks.m:id/cadastro_radio_masculino' and @text="Masculino"]

*** Keywords ***
# Metodos
Rolar a pagina para baixo ->              Swipe                                                                                                          400             1500     0        100      1500

Rolar a pagina para baixo ->              Swipe by percent                                                                                               50.18           46.87    50.18    18.22

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