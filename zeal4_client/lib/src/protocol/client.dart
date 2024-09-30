/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:zeal4_client/src/protocol/dashboard.dart' as _i3;
import 'package:zeal4_client/src/protocol/device_log.dart' as _i4;
import 'package:zeal4_client/src/protocol/snapshot_devicelog.dart' as _i5;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i6;
import 'protocol.dart' as _i7;

/// {@category Endpoint}
class EndpointDashboard extends _i1.EndpointRef {
  EndpointDashboard(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'dashboard';

  _i2.Future<List<_i3.Dashboard>> getDashboards(int userId) =>
      caller.callServerEndpoint<List<_i3.Dashboard>>(
        'dashboard',
        'getDashboards',
        {'userId': userId},
      );
}

/// {@category Endpoint}
class EndpointDevicelog extends _i1.EndpointRef {
  EndpointDevicelog(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'devicelog';

  _i2.Future<_i4.DeviceLog?> addDeivceLog(
    String uuid,
    String message,
  ) =>
      caller.callServerEndpoint<_i4.DeviceLog?>(
        'devicelog',
        'addDeivceLog',
        {
          'uuid': uuid,
          'message': message,
        },
      );

  _i2.Stream<_i5.SnapshotDeviceLog> streamInfinitDeviceLog(
    int deviceId,
    int total,
    bool desc,
  ) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i5.SnapshotDeviceLog>,
          _i5.SnapshotDeviceLog>(
        'devicelog',
        'streamInfinitDeviceLog',
        {
          'deviceId': deviceId,
          'total': total,
          'desc': desc,
        },
        {},
      );

  _i2.Stream<_i5.SnapshotDeviceLog> streamDeviceLog(
    int deviceId,
    int total,
    bool desc,
  ) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i5.SnapshotDeviceLog>,
          _i5.SnapshotDeviceLog>(
        'devicelog',
        'streamDeviceLog',
        {
          'deviceId': deviceId,
          'total': total,
          'desc': desc,
        },
        {},
      );

  _i2.Stream<_i4.DeviceLog> streamDeviceLogDataPoints(
    int deviceId,
    int total,
    bool desc,
  ) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i4.DeviceLog>,
          _i4.DeviceLog>(
        'devicelog',
        'streamDeviceLogDataPoints',
        {
          'deviceId': deviceId,
          'total': total,
          'desc': desc,
        },
        {},
      );

  _i2.Future<List<_i4.DeviceLog>> getDeviceLog(
    int deviceId,
    int total,
    bool desc,
  ) =>
      caller.callServerEndpoint<List<_i4.DeviceLog>>(
        'devicelog',
        'getDeviceLog',
        {
          'deviceId': deviceId,
          'total': total,
          'desc': desc,
        },
      );

  _i2.Stream<dynamic> deviceLogMessage(
    int deviceId,
    int total,
    bool desc,
  ) =>
      caller.callStreamingServerEndpoint<_i2.Stream<dynamic>, dynamic>(
        'devicelog',
        'deviceLogMessage',
        {
          'deviceId': deviceId,
          'total': total,
          'desc': desc,
        },
        {},
      );
}

/// {@category Endpoint}
class EndpointExample extends _i1.EndpointRef {
  EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );

  _i2.Stream<int> countdown() =>
      caller.callStreamingServerEndpoint<_i2.Stream<int>, int>(
        'example',
        'countdown',
        {},
        {},
      );
}

/// {@category Endpoint}
class EndpointUser extends _i1.EndpointRef {
  EndpointUser(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'user';

  _i2.Future<_i6.UserInfo?> updateToUserScope() =>
      caller.callServerEndpoint<_i6.UserInfo?>(
        'user',
        'updateToUserScope',
        {},
      );
}

class _Modules {
  _Modules(Client client) {
    auth = _i6.Caller(client);
  }

  late final _i6.Caller auth;
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i7.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    dashboard = EndpointDashboard(this);
    devicelog = EndpointDevicelog(this);
    example = EndpointExample(this);
    user = EndpointUser(this);
    modules = _Modules(this);
  }

  late final EndpointDashboard dashboard;

  late final EndpointDevicelog devicelog;

  late final EndpointExample example;

  late final EndpointUser user;

  late final _Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'dashboard': dashboard,
        'devicelog': devicelog,
        'example': example,
        'user': user,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
