public class YandexEdaOfferController {

    public Offer__c offer{get;set;}
    public Boolean value { get; set;}
    public Boolean valueForYes { get; set;}

    public String RestNameStr {get;set;}
    public String AccountFullNameStr {get;set;}
    public String CityStr {get;set;}
    public String IndexStr {get;set;}
    public String StreetStr {get;set;}
    public String ApartmentsStr {get;set;}
    public String OGRNStr {get;set;}
    public String INNStr {get;set;}
    public String KPPStr {get;set;}
    public String NDSStr {get;set;}
    public String BankNameStr {get;set;}
    public String BankBIKStr {get;set;}
    public String CorAccStr {get;set;}
    public String CheckingAccStr {get;set;}
    public String Accounting_PhoneStr {get;set;}
    public String AccountingEmailStr {get;set;}
    public String WebsiteStr {get;set;}
    public String BillingIndexStr {get;set;}
    public String BillingCityStr {get;set;}
    public String BillingAddressStr {get;set;}
    public String SignerNameStr {get;set;}
    public String SignerPositionStr {get;set;}
    public Boolean hasChanged{get;set;}

    public YandexEdaOfferController() {
         Account acc = [SELECT OfferName__c FROM Account WHERE Id =: ApexPages.currentPage().getParameters().get('id')];
                 System.debug('account id=' + acc.Id);

            offer = [
                    SELECT RestName__c, AccountFullName__c, City__c, Index__c, Street__c,
                            Apartments__c, OGRN__c, INN__c, KPP__c, NDS__c, BankName__c,
                            CheckingAcc__c, BankBIK__c, CorAcc__c, Accounting_Phone__c,
                            AccountingEmail__c, Website__c, BillingIndex__c,
                            BillingCity__c, BillingAddress__c, SignerName__c,
                            SignerPosition__c, Changed__c
                    FROM Offer__c
                    WHERE id = :acc.OfferName__c
            ];

        RestNameStr = offer.RestName__c;
        AccountFullNameStr = offer.AccountFullName__c;
        CityStr = offer.City__c;
        IndexStr = offer.Index__c;
        StreetStr = offer.Street__c;
        ApartmentsStr = offer.Apartments__c;
        OGRNStr = offer.OGRN__c;
        INNStr = offer.INN__c;
        KPPStr = offer.KPP__c;
        NDSStr = offer.NDS__c;
        BankNameStr = offer.BankName__c;
        BankBIKStr = offer.BankBIK__c;
        CorAccStr = offer.CorAcc__c;
        CheckingAccStr = offer.CheckingAcc__c;
        Accounting_PhoneStr = offer.Accounting_Phone__c;
        AccountingEmailStr = offer.AccountingEmail__c;
        WebsiteStr = offer.Website__c;
        BillingIndexStr = offer.BillingIndex__c;
        BillingCityStr = offer.BillingCity__c;
        BillingAddressStr = offer.BillingAddress__c;
        SignerNameStr = offer.SignerName__c;
        SignerPositionStr = offer.SignerPosition__c;
        hasChanged = offer.Changed__c;

    }

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

    public PageReference save() {
        offer.AccountFullName__c = AccountFullNameStr;
        offer.RestName__c = RestNameStr;
        offer.City__c = CityStr;
        offer.Index__c = IndexStr;
        offer.Street__c = StreetStr;
        offer.Apartments__c = ApartmentsStr;
        offer.OGRN__c = OGRNStr;
        offer.INN__c = INNStr;
        offer.KPP__c = KPPStr;
        offer.NDS__c = NDSStr;
        offer.BankName__c = BankNameStr;
        offer.BankBIK__c = BankBIKStr;
        offer.CorAcc__c = CorAccStr;
        offer.CheckingAcc__c = CheckingAccStr;
        offer.Accounting_Phone__c = Accounting_PhoneStr;
        offer.AccountingEmail__c = AccountingEmailStr;
        offer.Website__c = WebsiteStr;
        offer.Index__c = BillingIndexStr;
        offer.BillingCity__c = BillingCityStr;
        offer.BillingAddress__c = BillingAddressStr;
        offer.SignerName__c = SignerNameStr;
        offer.SignerPosition__c = SignerPositionStr;
        offer.Changed__c = true;
        try{
            update offer;
            PageReference thank = new PageReference('/ThankYou');
            thank.setRedirect(true);
            return thank;
        } catch (Exception e){
            PageReference error = new PageReference('/Exception');
            ApexPages.addMessages(e);
            error.setRedirect(true);
            return error;
        }
        }

}