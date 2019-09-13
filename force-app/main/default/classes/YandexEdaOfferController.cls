public class YandexEdaOfferController {


    public Offer__c offer{get;set;}

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
 /*   private final Account acct;
    public YandexEdaOfferController() {
        offer = [
                SELECT id,RestName__c,
                        AccountFullName__c,
                        OGRN__c,
                        INN__c, KPP__c,
                        NDS__c,
                        BankName__c,
                        CheckingAcc__c,
                        BankBIK__c,
                        CorAcc__c,
                        Accounting_Phone__c,
                        AccountingEmail__c,
                        Website__c,
                        SignerName__c,
                        SignerPosition__c
                FROM Offer__c
                WHERE id =:ApexPages.currentPage().getParameters().get('id')
        ];
    }

    public PageReference save() {
        try {
            insert offer;
            PageReference p = new PageReference('/' + offer.Id);
            p.setRedirect(true);
            return p;
        } catch (Exception e) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error, 'Account could not be saved'));
            return null;
        }

    }*/
}