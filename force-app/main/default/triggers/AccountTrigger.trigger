/**
 * Created by OLga Skrynnikova on 20.09.2019.
 */

trigger AccountTrigger on Account (before delete) {
    if (Trigger.isDelete & Trigger.isBefore) {
        OfferDeleteHandler.OfferToDeletemethod(trigger.old);
    }
}