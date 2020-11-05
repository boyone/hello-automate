*** Settings ***
Library     RequestsLibrary

*** Test Cases ***
Hello World
    Create Session    greeting      http://localhost:8000
    ${resp}=   Get Request    greeting    /hello
    Request Should Be Successful    ${resp}
    ${message}=    Convert To String    ${resp.content}
    Should Contain    ${message}    Hello, World