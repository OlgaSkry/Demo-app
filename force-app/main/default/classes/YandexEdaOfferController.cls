public class YandexEdaOfferController {

    public Offer__c offer{get;set;}

    //ROUND BUTTON
    public List<SelectOption> getTypes(){
        Schema.SObjectType sobject_type = Offer__c.getSObjectType();
        Schema.DescribeSObjectResult sobject_describe = sobject_type.getDescribe();
        Map<String, Schema.SObjectField> fieldMap = sobject_describe.fields.getMap();
        List<Schema.PicklistEntry> picklistEntries = fieldMap.get('nds__c').getDescribe().getPicklistValues();
        List<SelectOption> options = new List<SelectOption>();
        for(Schema.PicklistEntry p : picklistEntries)
            options.add(new SelectOption(p.getLabel(), p.getValue()));
        return options;
    }

    public Boolean value { get; set;}
    public Boolean valueForYes { get; set;}

}