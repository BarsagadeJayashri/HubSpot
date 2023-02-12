public class AddJson2Apex {
     public List<Results> results;
    
    public class Results{
        public string id;
        public Properties properties;
        public string createdAt;
        public string updatedAt;
        public Boolean archived;
    }
    public class Properties{
        public string createddate;
        public string email;
        public string firstname;
        public string hs_object_id;
        public string lastmodifieddate;
        public string lastname;
        
        
    }
    public static AddJson2Apex parse(String json){
        return (AddJson2Apex)System.JSON.deserialize( json, AddJson2Apex.class);
    }



}