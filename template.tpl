___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Email Validator by Metricaz",
  "description": "Variável booleana para verificar se o email é válido.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "emailVariable",
    "displayName": "Selecione a variável",
    "simpleValueType": true,
    "help": "Selecione a variável que contém o email a ser validado."
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const email = data.emailVariable;

if (typeof email !== 'string') {
  return false;
}

const trimmed = email.trim();

if (
  trimmed.length > 5 &&
  trimmed.indexOf(' ') === -1 &&
  trimmed.indexOf('@') > 0 &&
  trimmed.lastIndexOf('.') > trimmed.indexOf('@') + 1 &&
  trimmed.indexOf('@') === trimmed.lastIndexOf('@')
) {
  return true;
}
return false;


___TESTS___

scenarios:
- name: Email false
  code: |2-
      // Mocked field values
    const mockData = {
      emailVariable: "gustavo.melo@"
    };

    // Call runCode to run the template's code.
    let variableResult = runCode(mockData);

    // Verify that the variable returns a result.
    assertThat(variableResult).isEqualTo(false);
- name: Email true
  code: |2-
      // Mocked field values
    const mockData = {
      emailVariable: "gustavo.melo@metricaz.com"
    };

    // Call runCode to run the template's code.
    let variableResult = runCode(mockData);

    // Verify that the variable returns a result.
    assertThat(variableResult).isEqualTo(true);


___NOTES___

Created on 18/08/2025, 16:12:15


