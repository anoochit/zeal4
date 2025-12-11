// ignore_for_file: unused_local_variable
import 'dart:io';

import 'package:serverpod/serverpod.dart';
import 'send_mail.dart';
import 'src/generated/protocol.dart';
import 'src/generated/endpoints.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as auth;

// This is the starting point of your Serverpod server. In most cases, you will
// only need to make additions to this file if you add future calls,  are
// configuring Relic (Serverpod's web-server), or need custom setup work.

void run(List<String> args) async {
  // Initialize Serverpod and connect it with your generated code.
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
    authenticationHandler: auth.authenticationHandler,
  );

  // If you are using any future calls, they need to be registered here.
  // pod.registerFutureCall(ExampleFutureCall(), 'exampleFutureCall');

  // add auth config
  auth.AuthConfig.set(
    auth.AuthConfig(
      sendValidationEmail: (session, email, validationCode) async {
        print('Validation code: $validationCode');
        session.log('Code for $email is $validationCode');

        // send mail
        final subject = 'Verfify your account';
        final body = 'Hi,\nYour validation code = $validationCode';

        return await sendMail(session, email, subject, body);
      },
      sendPasswordResetEmail: (session, userInfo, validationCode) async {
        print('Validation code: $validationCode');
        session.log('Code for ${userInfo.userName} is $validationCode');

        // send mail
        final subject = 'Reset your account';
        final body = 'Hi,\nYour validation code = $validationCode';

        return await sendMail(session, userInfo.email!, subject, body);
      },
    ),
  );

  // Setup a default page at the web root.
  // pod.webServer.addRoute(RouteRoot(), '/');
  // pod.webServer.addRoute(RouteRoot(), '/index.html');

  // Serve all files in the web/static relative directory under /.
  // final root = Directory(Uri(path: 'web/static').toFilePath());
  // pod.webServer.addRoute(StaticRoute.directory(root), '/**');

  // Use FlutterRoute to serve your Flutter web build
  final flutterAppDir = Directory('web/app');

  if (!flutterAppDir.existsSync()) {
    print('Warning: Flutter web app not found at ${flutterAppDir.path}');
    print('Build your Flutter app and copy it to web/app/');
  } else {
    pod.webServer.addRoute(FlutterRoute(flutterAppDir), '/**');
  }

  // init sample data
  // initSampleData(pod);

  // Start the server.
  await pod.start();
}
