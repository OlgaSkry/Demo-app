public class YandexEdaOfferController {


    public Offer__c offer{get;set;}
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