Salesforce-Integration-with-HubSpot:
This repository provides a solution of integration Salesforce with HubSpot. This solution to import the HubSpot Contacts into the Salesforce  Contacts. 


Pre-requisites:

1.	Before using this solution, you need to have an API key from HubSpot application. https://developers.hubspot.com
2.	A Salesforce account with access to the Contact object.


Features:

The solution is designed for the following processes:

1.	Create Contact in HubSpot Application.
2.  Create a new Apex class in Salesforce and copy the contents of the AddHubSpotController.cls file in the repository to the class and edit the endpoint url and api       key. And also copy the code AddJson2Apex.cls to get the response.
3.  Create a new Visualforce page in Salesforce and Copy the content of AddHubSpotVfPage.page file to the page.
2.	In salesforce application import the contact by click on the custom button and then import the contact from HubSpot to the Salesforce.


