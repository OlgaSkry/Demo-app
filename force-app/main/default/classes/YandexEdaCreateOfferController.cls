/**
 * Created by OLga Skrynnikova on 17.09.2019.
 */

public with sharing class YandexEdaCreateOfferController {
    @AuraEnabled
    public static List<Contact> getContact(String ID){
        return [SELECT ID, Name, Account.Name, Email FROM Contact WHERE AccountId =: ID LIMIT 1];
    }


}