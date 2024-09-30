import 'dart:developer';

import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:zeal4_client/zeal4_client.dart';

// Sets up a singleton client object that can be used to talk to the server from
// anywhere in our app. The client is generated from your server code.
// The client is set up to connect to a Serverpod running on a local server on
// the default port. You will need to modify this to connect to staging or
// production servers.

// var client = Client('http://$localhost:8080/')
//   ..connectivityMonitor = FlutterConnectivityMonitor();

late SessionManager sessionManager;
late Client client;

// initial serverpod client
Future<void> initServerPodClient() async {
  log('Serverpod init');

  // serverpod client
  client = Client(
    'http://$localhost:8080/',
    authenticationKeyManager: FlutterAuthenticationKeyManager(),
  )..connectivityMonitor = FlutterConnectivityMonitor();

  // serverpod session manager
  sessionManager = SessionManager(caller: client.modules.auth);

  // session manager listener
  log('Session mananger listenser');
  sessionManager.addListener(() {
    if (sessionManager.isSignedIn) {
      log('user already signed in ');
    } else {
      log('user signed out ');
    }
  });

  // session manager init
  await sessionManager.initialize();
}
