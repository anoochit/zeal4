// ignore_for_file: unused_local_variable

import 'package:serverpod/serverpod.dart';
import 'src/generated/protocol.dart';
import 'src/generated/endpoints.dart';
import 'src/web/routes/root.dart';
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
  );

  // If you are using any future calls, they need to be registered here.
  // pod.registerFutureCall(ExampleFutureCall(), 'exampleFutureCall');

  // add auth config
  auth.AuthConfig.set(auth.AuthConfig(
    sendValidationEmail: (session, email, validationCode) async {
      print('Validation code: $validationCode');
      session.log('Code for $email is $validationCode');
      return true;
    },
    sendPasswordResetEmail: (session, userInfo, validationCode) async {
      print('Validation code: $validationCode');
      session.log('Code for ${userInfo.userName} is $validationCode');
      return true;
    },
  ));

  // Setup a default page at the web root.
  pod.webServer.addRoute(RouteRoot(), '/');
  pod.webServer.addRoute(RouteRoot(), '/index.html');
  // Serve all files in the /static directory.
  pod.webServer.addRoute(
    RouteStaticDirectory(serverDirectory: 'static', basePath: '/'),
    '/*',
  );

  // init sample data
  // initSampleData(pod);

  // Start the server.
  await pod.start();
}

Future<void> initSampleData(Serverpod pod) async {
  final session = await pod.createSession();

  late Device device;
  late Dashboard dashboard;

  // add sample device
  final totalDevice = await Device.db.count(session);
  if (totalDevice == 0) {
    final row = Device(
      uuid: 'mock_device',
      name: 'mock_device',
      description: 'mock_device',
      fields: [
        'cpu_usage',
        'mem_usage',
        'mem_total',
        'timestamp',
      ],
    );
    device = await Device.db.insertRow(session, row);

    // add sample dashboard
    final totalDashboard = await Dashboard.db.count(session);
    if (totalDashboard == 0) {
      final row = Dashboard(name: 'Sample', description: 'Sample dashboard');
      dashboard = await Dashboard.db.insertRow(session, row);
    }

    //add sample widgets
    final widgetTotal = await DashboardWidget.db.count(session);

    if (widgetTotal == 0) {
      final rows = [
        // text widget
        DashboardWidget(
          name: 'CPU Usage',
          description: 'CPU Usage',
          deviceId: 1,
          fields: ['cpu_usage'],
          units: ['%'],
          labels: ['CPU Usage'],
          dashboardId: 1,
          type: WidgetType.text,
          width: 2,
          height: 1,
          order: 1,
          enable: true,
        ),

        // text widget
        DashboardWidget(
          name: 'Mem Usage',
          description: 'Mem Usage',
          deviceId: 1,
          fields: ['mem_usage'],
          units: ['MB'],
          labels: ['Mem Usage'],
          dashboardId: 1,
          type: WidgetType.text,
          width: 2,
          height: 1,
          order: 2,
          enable: true,
        ),

        // text widget
        DashboardWidget(
          name: 'Mem Total',
          description: 'Mem Total',
          deviceId: 1,
          fields: ['mem_total'],
          units: ['MB'],
          labels: ['Mem Total'],
          dashboardId: 1,
          type: WidgetType.text,
          width: 2,
          height: 1,
          order: 2,
          enable: true,
        ),

        // bar chart
        DashboardWidget(
          name: 'CPU Usage',
          description: 'CPU Usage',
          deviceId: 1,
          fields: ['cpu_usage'],
          units: ['%'],
          labels: ['CPU Usage'],
          dashboardId: 1,
          type: WidgetType.bar,
          width: 6,
          height: 1,
          order: 3,
          enable: true,
        ),
        // bar chart
        DashboardWidget(
          name: 'Mem Usage',
          description: 'Mem Usage',
          deviceId: 1,
          fields: ['mem_usage', 'mem_total'],
          units: ['MB', 'MB'],
          labels: ['Mem Usage', 'Mem Total'],
          dashboardId: 1,
          type: WidgetType.bar,
          width: 6,
          height: 1,
          order: 4,
          enable: true,
        ),
        // table
        DashboardWidget(
          name: 'Mock device data table',
          description: 'Mock device data table',
          deviceId: 1,
          fields: ['timestamp', 'cpu_usage', 'mem_usage', 'mem_total'],
          units: ['timestamp', '%', 'MB', 'MB'],
          labels: ['Datetime', 'CPU Usage', 'Mem Usage', 'Mem Total'],
          dashboardId: 1,
          type: WidgetType.table,
          width: 12,
          height: 2,
          order: 5,
          enable: true,
        ),
      ];

      await DashboardWidget.db.insert(session, rows);
    }
  }
}
