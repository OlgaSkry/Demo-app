/**
 * Created by OLga Skrynnikova on 17.09.2019.
 */

public with sharing class YandexEdaCreateOfferController {

    @AuraEnabled
    public static List<Contact> getContact(String ID){
        return [SELECT ID, Name, Account.Name, Email FROM Contact WHERE AccountId =: ID];
    }

    @AuraEnabled
    public static Boolean createOffer(String accID){
        Account acc = [SELECT ID, OfferName__c FROM Account WHERE ID =: accID];
        if (acc.OfferName__c == null) {
            Offer__c offer = new Offer__c();
            insert offer;
            acc.OfferName__c = offer.Id;
            update acc;
        } else return false;
        return true;
    }

    @AuraEnabled
    public static void sendMail(String ID, String accID) {
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {ID};
        message.setToAddresses(toAddresses);
        message.subject = 'Opt Out Test Message';
        message.setHtmlBody('Hello, My Friend. It is a pleasure to work with you.<br/>' +
                'URL for you Offer: https://sandbox-wallah-developer-edition.cs89.force.com/newpartner/YandexEdaOffer?&id=' +
                accID);
        Messaging.SingleEmailMessage[] messages =
                new List<Messaging.SingleEmailMessage> {message};
        Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
        if (results[0].success) {
            System.debug('The email was sent successfully.');
        } else {
            System.debug('The email failed to send: '
                    + results[0].errors[0].message);
        }
    }

}