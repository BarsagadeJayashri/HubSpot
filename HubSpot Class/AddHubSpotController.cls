public class AddHubSpotController {
    public AddHubSpotController(ApexPages.StandardSetController controller) {}
    public static void getAddHubSpotContacts()
    {
        String authorizationHeader = 'Bearer ' + 'pat-eu1-7f4fb93e-2439-4d2f-947e-70073e24853c';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.hubapi.com/crm/v3/objects/contacts');
        //request.setEndpoint('https://api.hubapi.com/contacts/v1/lists/all/contacts/all');
        request.setMethod('GET');
        request.setHeader('Content-Type','application/JSON');
        request.setHeader('Authorization', authorizationHeader);
        
        HttpResponse response = http.send(request);
        String body = response.getBody();
        System.debug(body);
        
        AddJson2Apex hubSpotFormatted = AddJson2Apex.parse(body);
        System.debug('JSON Formatted' +hubspotFormatted);
        
        List<Contact> contactList = new List<Contact>();
        //`Map<String,Contact> conMyMap =  new Map<String,Contact>();
        
        for(AddJson2Apex.Results hubSpotContact :  hubSpotFormatted.results){
            Contact newContact = new Contact();
            newContact.FirstName = hubSpotContact.properties.firstname;
            newContact.LastName = hubSpotContact.properties.lastname;
            newContact.Hub_Id__c = string.valueOf(hubSpotContact.Id);
            newContact.Email = hubSpotContact.properties.email;
            
            contactList.add(newContact);
        }
        Schema.SObjectField f = Contact.Fields.Hub_Id__c;
        Database.UpsertResult [] cr = Database.upsert(contactList, f, false);
        
        /* if(contactList.size()>0){
           insert contactList;
          }*/
        
    }
}