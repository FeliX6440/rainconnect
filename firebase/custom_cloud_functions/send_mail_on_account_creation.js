const functions = require("firebase-functions");
const admin = require("firebase-admin");
const sgMail = require("@sendgrid/mail");
sgMail.setApiKey(
  "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",
);
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.sendMailOnAccountCreation = functions.auth
  .user()
  .onCreate(async (user) => {
    const email = user.email;
    const displayName = user.displayName || "New User";

    const msg = {
      to: email,
      from: "welcome@rainhackers.com", // Your verified email from SendGrid
      subject: "Welcome to Rainconnect!",
      text: `Hello ${displayName},\nWelcome to Rainconnect! \nWe're thrilled to have you on board and hope we will be able to boost your sales productivity to a new level!.\n\nNeed help or want to share feedback? Our support team is just an email away (welcome@rainhackers.com).\nThank you for choosing Rainconnect. Here's to a successful journey together!\nBest\nThe Rainconnect Team`,
      html: `Hello ${displayName},\nWelcome to Rainconnect! \nWe're thrilled to have you on board and hope we will be able to boost your sales productivity to a new level!.\n\nNeed help or want to share feedback? Our support team is just an email away (welcome@rainhackers.com).\nThank you for choosing Rainconnect. Here's to a successful journey together!\nBest\nThe Rainconnect Team`,
    };

    try {
      await sgMail.send(msg);
      console.log("Welcome email sent to:", email);
    } catch (error) {
      console.error("Error sending welcome email:", error);
    }
  });

// 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

// import * as functions from 'firebase-functions';
// import * as admin from 'firebase-admin';
// import * as sgMail from '@sendgrid/mail';

// admin.initializeApp();
// sgMail.setApiKey('YOUR_SENDGRID_API_KEY');

// export const sendWelcomeEmail = functions.auth.user().onCreate(async (user) => {
//     const email = user.email;
//     const displayName = user.displayName || 'New User';

//     const msg = {
//         to: email,
//         from: 'your@example.com', // Your verified email from SendGrid
//         subject: 'Welcome to Our App!',
//         text: `Hello ${displayName},\nWelcome to our app! We are excited to have you on board.`,
//         html: `<p>Hello ${displayName},<br>Welcome to our app! We are excited to have you on board.</p>`,
//     };

//     try {
//         await sgMail.send(msg);
//         console.log('Welcome email sent to:', email);
//     } catch (error) {
//         console.error('Error sending welcome email:', error);
//     }
// });
