/**
 * Created by OLga Skrynnikova on 20.09.2019.
 */

public with sharing class OfferDeleteHandler {

    public static void OfferToDeletemethod(List<Account> accs){
        List <Offer__c> offs = new List <Offer__c>();
        for (Account a : accs) {
            Offer__c offToDelete = [SELECT Id FROM Offer__c WHERE Id =: a.OfferName__c];
            offs.add(offToDelete);
        }
        try {
            delete offs;
            delete accs;
        } catch(Exception e) {
            System.debug('The following exception has occurred: ' + e.getMessage());
        }

    }
}