const functions = require('firebase-functions');
const admin = require('firebase-admin');

// admin.initializeApp();

exports.onDeleteOfLeadFunction = functions.firestore.document('leads/{leadId}').onDelete(async (snap, context) => {
    const leadId = context.params.leadId;
  
    const leadRef = admin.firestore().doc('leads/' + leadId);

    try {
        const componentContentQuerySnapshot = await admin.firestore().collection('component_content').where('lead_ref', '==', leadRef).get();
        
        const batch = admin.firestore().batch();
        componentContentQuerySnapshot.forEach(doc => {
            batch.delete(doc.ref);
        });

        // Commit the batch
        await batch.commit();

        console.log(`Deleted ${componentContentQuerySnapshot.size} component contents for lead ${leadId}`);
    } catch (error) {
        console.error('Error deleting component contents:', error);
    }
});



// exports.onUserDeleted = functions.auth.user().onDelete(async (user) => {
//   let firestore = admin.firestore();
//   let userRef = firestore.doc('users/' + user.uid);
//   await firestore.collection("users").doc(user.uid).delete();
// });