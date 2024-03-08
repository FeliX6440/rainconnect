const admin = require("firebase-admin/app");
admin.initializeApp();

const onDeleteOfLeadFunction = require("./on_delete_of_lead_function.js");
exports.onDeleteOfLeadFunction = onDeleteOfLeadFunction.onDeleteOfLeadFunction;
const sendMailOnAccountCreation = require("./send_mail_on_account_creation.js");
exports.sendMailOnAccountCreation =
  sendMailOnAccountCreation.sendMailOnAccountCreation;
