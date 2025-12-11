// ignore_for_file: unused_local_variable

import 'package:serverpod/server.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as auth;
import 'src/endpoints/dashboard_endpoint.dart' as scope;
import 'src/generated/protocol.dart';

Future<void> initSampleData(Serverpod pod) async {
  final session = await pod.createSession();

  late Device device;
  late Dashboard dashboard;

  late int userId;

  // add sample user
  final userTotal = await auth.UserInfo.db.count(session);
  if (userTotal == 0) {
    // add sample manager
    await auth.Emails.createUser(
      session,
      'admin',
      'admin@example.com',
      'Hello123!',
    ).then((user) {
      userId = user!.id!;
      auth.Users.updateUserScopes(session, user.id!, {scope.UserScope.admin});
    });
  }

  // add sample device
  final totalDevice = await Device.db.count(session);
  if (totalDevice == 0) {
    final row = Device(
      uuid: 'mock_device',
      name: 'mock_device',
      description: 'mock_device',
      fields: ['cpu_usage', 'mem_usage', 'mem_total', 'timestamp'],
      userInfoId: userId,
    );
    device = await Device.db.insertRow(session, row);

    // add sample dashboard
    final totalDashboard = await Dashboard.db.count(session);
    if (totalDashboard == 0) {
      final row = Dashboard(
        name: 'Sample',
        description: 'Sample dashboard',
        userInfoId: userId,
      );
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
          userInfoId: userId,
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
          userInfoId: userId,
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
          userInfoId: userId,
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
          userInfoId: userId,
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
          userInfoId: userId,
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
          userInfoId: userId,
        ),
      ];

      await DashboardWidget.db.insert(session, rows);
    }
  }
}
