/**
 * Created by OLga Skrynnikova on 23.09.2019.
 */

public with sharing class YandexEdaOfferBatch implements Database.Batchable<SObject>
{

    public Database.QueryLocator start(Database.BatchableContext bc) {
        Datetime filterDate = System.now().addDays(-2);
//        String offer = 'SELECT Id, LastModifiedDate, LastModifiedById' +
//                        'FROM Offer__c ' +
//                        'WHERE LastModifiedDate <=: filterDate';
        return Database.getQueryLocator([SELECT Id, LastModifiedDate, LastModifiedById
                FROM Offer__c
                WHERE LastModifiedDate <=: filterDate]);
    }
    public void execute(Database.BatchableContext bc, List<Offer__c> offer) {
        for (Offer__c o: offer) {
            Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
            String[] toAddresses = new String[] {o.LastModifiedById};
            system.debug('OWNER ID' + toAddresses);
            message.setToAddresses(toAddresses);
            message.subject = 'ALARM';
            message.setHtmlBody('You have not seen Offer for 2 days.<br/>');
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

    public void finish(Database.BatchableContext bc) {
    }

}