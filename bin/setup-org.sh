Create org with superuser (admin)
BearerT/Service=befta.org.1@gmail.com/rd_professional_api
POST localhost:8090/refdata/external/v1/organisations
{
  "name": "SolicitorOrg1",
  "status": "ACTIVE",
  "statusMessage": "SRA1234562134",
  "sraId": "string",
  "sraRegulated": "false",
  "companyNumber": "W99999W",
  "companyUrl": "www.null.com",
  "superUser": {
    "firstName": "Befta",
    "lastName": "Org1Admin",
    "email": "befta.org.1@gmail.com"
  },
  "paymentAccount": [
    "PBA1234567"
  ],
  "contactInformation": [
    {
      "uprn": "string",
      "addressLine1": "addressLine1",
      "addressLine2": "addressLine2",
      "addressLine3": "addressLine3",
      "townCity": "Town",
      "county": "County",
      "country": "Country",
      "postCode": "HA1 4ET",
      "dxAddress": [
        {
          "dxNumber": "dxNumber",
          "dxExchange": "dxExchange"
        }
      ]
    }
  ],
  "orgType": "SOLICITOR_ORG"
}
-> PC2FIZK

Update org to make active
BearerT/Service=local-prd-admin@gmail.com/rd_professional_api
PUT localhost:8090/refdata/internal/v1/organisations/PC2FIZK
{
  "name": "SolicitorOrg1",
  "status": "ACTIVE",
  "statusMessage": "SRA1234562134",
  "sraId": "string",
  "sraRegulated": "false",
  "companyNumber": "W99999W",
  "companyUrl": "www.null.com",
  "superUser": {
    "firstName": "Befta",
    "lastName": "Org1Admin",
    "email": "befta.org.1@gmail.com"
  },
  "paymentAccount": [
    "PBA1234567"
  ],
  "contactInformation": [
    {
      "uprn": "string",
      "addressLine1": "addressLine1",
      "addressLine2": "addressLine2",
      "addressLine3": "addressLine3",
      "townCity": "Town",
      "county": "County",
      "country": "Country",
      "postCode": "HA1 4ET",
      "dxAddress": [
        {
          "dxNumber": "dxNumber",
          "dxExchange": "dxExchange"
        }
      ]
    }
  ],
  "orgType": "SOLICITOR_ORG"
}


Add user to org
BearerT/Service=local-prd-admin@gmail.com/rd_professional_api
POST localhost:8090/refdata/internal/v1/organisations/PC2FIZK/users/
{
  "firstName": "Befta",
  "lastName": "org1Caseworker2",
  "email": "befta.caseworker.2@gmail.com",
  "roles": [
    "caseworker","caseworker-befta_jurisdiction_1"
  ],
  "resendInvite": false
}
-> 05e5a512-1707-495b-90ad-c1796509c67a
