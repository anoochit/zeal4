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
import 'package:zeal4_client/src/protocol/device_log.dart' as _i3;
import 'protocol.dart' as _i4;

/// {@category Endpoint}
class EndpointDevicelog extends _i1.EndpointRef {
  EndpointDevicelog(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'devicelog';

  _i2.Future<_i3.DeviceLog?> addDeivceLog(
    String uuid,
    String message,
  ) =>
      caller.callServerEndpoint<_i3.DeviceLog?>(
        'devicelog',
        'addDeivceLog',
        {
          'uuid': uuid,
          'message': message,
        },
      );

  _i2.Stream<List<_i3.DeviceLog>> getDeivceLog(
    int deviceId,
    int total,
    bool desc,
  ) =>
      caller.callStreamingServerEndpoint<_i2.Stream<List<_i3.DeviceLog>>,
          List<_i3.DeviceLog>>(
        'devicelog',
        'getDeivceLog',
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
          _i4.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    devicelog = EndpointDevicelog(this);
    example = EndpointExample(this);
  }

  late final EndpointDevicelog devicelog;

  late final EndpointExample example;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'devicelog': devicelog,
        'example': example,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
