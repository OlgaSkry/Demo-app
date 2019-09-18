/**
 * Created by user on 17.09.2019.
 */

({
  doInit: function(component, event, helper) {
    let action = component.get("c.getContact");
    action.setParams({
      "ID" : component.get("v.recordId")
    });

    action.setCallback(this, function(response) {
      if (response.getState() === "SUCCESS") {
        let getContact = response.getReturnValue();
        component.set("v.tableRows", getContact);
      }
    });
    $A.enqueueAction(action);
  }
});