/**
 * Created by OLga Skrynnikova on 23.09.2019.
 */

public with sharing class ScheduleYandexEdaOfferBatch implements Schedulable{

    public void execute(SchedulableContext param1) {
        ScheduleYandexEdaOfferBatch m = new ScheduleYandexEdaOfferBatch();
        String sch = '0 0 2 1/1 * ? *';
        String jobID = system.schedule('Yandex Eda Offer Job', sch, m);
        YandexEdaOfferBatch batch = new YandexEdaOfferBatch();
        Database.executeBatch(batch, 1);

    }

}
