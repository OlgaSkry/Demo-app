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
        component.set("v.data", getContact);
        var rows = response.getReturnValue();
        for (var i = 0; i < rows.length; i++) {
          var row = rows[i];
          if (row.Account) row.AccountName = row.Account.Name;
        }
        component.set('v.data', rows);
      }
    });

    component.set('v.columns', [
      {label: 'Контакт', fieldName: 'Name', type: 'text'},
      {label: 'Ресторан', fieldName: 'AccountName', type: 'text' },
      {label: 'Email', fieldName: 'Email', type: 'text'}
      ]);

    $A.enqueueAction(action);
  },

  updateSelectedText: function (cmp, event) {
    var selectedRows = event.getParam('selectedRows');
    cmp.set('v.currContactId', selectedRows[0].Id);
  },

  createOfferJS: function(component, event, helper) {
     let action = component.get("c.createOffer");
    action.setParams({
      "accID" : component.get("v.recordId")
    });
    action.setCallback(this, function(response){
      if (response.getReturnValue()) {
        component.set("v.createConfirm", true);
        component.set("v.createError", false);
      }
      else {
        component.set("v.createError", true);
        component.set("v.createConfirm", false);
      }

      event.getSource().set("v.disabled", true);
    });

    let email = component.get("c.sendMail");
    email.setParams({
      "ID" : component.get("v.currContactId"),
      "accID" : component.get("v.recordId")
    });

    $A.enqueueAction(action);
  },

  cancelClick : function(component, event, helper) {
    $A.get("e.force:closeQuickAction").fire();
  }

});