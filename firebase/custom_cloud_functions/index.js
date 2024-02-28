const admin = require("firebase-admin/app");
admin.initializeApp();

const onDeleteOfLeadFunction = require("./on_delete_of_lead_function.js");
exports.onDeleteOfLeadFunction = onDeleteOfLeadFunction.onDeleteOfLeadFunction;
