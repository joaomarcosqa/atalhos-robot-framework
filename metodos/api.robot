#metodo de pegar token e guarda-lo para depois envia-lo na nova requisição
*** Keywords ***
Pegar parâmetro retornado

    [Arguments]       ${PATH}            
    ${PARAMETER}      Get Value From Json   ${RESPONSE.json()}  ${PATH}
    ${PARAMETER}      Convert To String     ${PARAMETER} 
    ${PARAMETER}      Strip String          ${PARAMETER}   	    characters=[ ]
    Set Global Variable    ${PARAMETER}
    
essa é uma keyword que criei pra pegar o parametro de qq request
dai é só vc chamar ela e passar o path
no argumento

dai vc utiliza a variavel ${PARAMETER} e passa no header da sua requisição pra passar o token