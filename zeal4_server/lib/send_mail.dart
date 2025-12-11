import 'package:mailer/mailer.dart' as mailer;
import 'package:mailer/smtp_server/gmail.dart';
import 'package:serverpod/server.dart';

Future<bool> sendMail(
  Session session,
  String email,
  String subject,
  String body,
) async {
  // Retrieve the credentials
  final gmailAccount = session.serverpod.getPassword('gmailAccount')!;
  final gmailAppPassword = session.serverpod.getPassword('gmailAppPassword')!;

  // Create a SMTP client for Gmail.
  final smtpServer = gmail(gmailAccount, gmailAppPassword);

  // Create an email message with the validation code.
  final message = mailer.Message()
    ..from = mailer.Address(gmailAccount)
    ..recipients.add(email)
    ..subject = subject
    ..html = body;

  // Send the email message.
  try {
    await mailer.send(message, smtpServer);
    return true;
  } catch (_) {
    // Return false if the email could not be sent.
    return false;
  }
}
