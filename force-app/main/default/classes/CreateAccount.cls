/**
 * Created by user on 30.08.2019.
 */

public with sharing class CreateAccount {
    public static List<Account> insertAccount(Integer param){
        Account[] accts = new List<Account>();
        for(Integer i=0;i<param;i++) {
            Account a = new Account(Name='NewAcc'+ i);
            accts.add(a);
        }
        try {
            insert accts;
        }
        catch(DmlException e) {
            System.debug('The following exception has occurred: ' + e.getMessage());
        }
        return accts;
    }
}