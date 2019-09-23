/**
 * Created by OLga Skrynnikova on 23.09.2019.
 */
@RestResource(urlMapping='/offerstatus')

global with sharing class MyRestResource {
    @HttpPost
    global static Offer__c doPost(String Id) {
        Offer__c offer = [SELECT Id, Name, Status__c FROM Offer__c WHERE ID =: Id];
        return offer;
    }
}