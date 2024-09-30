/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/dashboard_endpoint.dart' as _i2;
import '../endpoints/devicelog_endpoint.dart' as _i3;
import '../endpoints/example_endpoint.dart' as _i4;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i5;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'dashboard': _i2.DashboardEndpoint()
        ..initialize(
          server,
          'dashboard',
          null,
        ),
      'devicelog': _i3.DevicelogEndpoint()
        ..initialize(
          server,
          'devicelog',
          null,
        ),
      'example': _i4.ExampleEndpoint()
        ..initialize(
          server,
          'example',
          null,
        ),
    };
    connectors['dashboard'] = _i1.EndpointConnector(
      name: 'dashboard',
      endpoint: endpoints['dashboard']!,
      methodConnectors: {
        'getDashboards': _i1.MethodConnector(
          name: 'getDashboards',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['dashboard'] as _i2.DashboardEndpoint)
                  .getDashboards(session),
        )
      },
    );
    connectors['devicelog'] = _i1.EndpointConnector(
      name: 'devicelog',
      endpoint: endpoints['devicelog']!,
      methodConnectors: {
        'addDeivceLog': _i1.MethodConnector(
          name: 'addDeivceLog',
          params: {
            'uuid': _i1.ParameterDescription(
              name: 'uuid',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'message': _i1.ParameterDescription(
              name: 'message',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['devicelog'] as _i3.DevicelogEndpoint).addDeivceLog(
            session,
            params['uuid'],
            params['message'],
          ),
        ),
        'getDeviceLog': _i1.MethodConnector(
          name: 'getDeviceLog',
          params: {
            'deviceId': _i1.ParameterDescription(
              name: 'deviceId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'total': _i1.ParameterDescription(
              name: 'total',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'desc': _i1.ParameterDescription(
              name: 'desc',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['devicelog'] as _i3.DevicelogEndpoint).getDeviceLog(
            session,
            params['deviceId'],
            params['total'],
            params['desc'],
          ),
        ),
        'streamInfinitDeviceLog': _i1.MethodStreamConnector(
          name: 'streamInfinitDeviceLog',
          params: {
            'deviceId': _i1.ParameterDescription(
              name: 'deviceId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'total': _i1.ParameterDescription(
              name: 'total',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'desc': _i1.ParameterDescription(
              name: 'desc',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['devicelog'] as _i3.DevicelogEndpoint)
                  .streamInfinitDeviceLog(
            session,
            params['deviceId'],
            params['total'],
            params['desc'],
          ),
        ),
        'streamDeviceLog': _i1.MethodStreamConnector(
          name: 'streamDeviceLog',
          params: {
            'deviceId': _i1.ParameterDescription(
              name: 'deviceId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'total': _i1.ParameterDescription(
              name: 'total',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'desc': _i1.ParameterDescription(
              name: 'desc',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['devicelog'] as _i3.DevicelogEndpoint).streamDeviceLog(
            session,
            params['deviceId'],
            params['total'],
            params['desc'],
          ),
        ),
        'streamDeviceLogDataPoints': _i1.MethodStreamConnector(
          name: 'streamDeviceLogDataPoints',
          params: {
            'deviceId': _i1.ParameterDescription(
              name: 'deviceId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'total': _i1.ParameterDescription(
              name: 'total',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'desc': _i1.ParameterDescription(
              name: 'desc',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['devicelog'] as _i3.DevicelogEndpoint)
                  .streamDeviceLogDataPoints(
            session,
            params['deviceId'],
            params['total'],
            params['desc'],
          ),
        ),
        'deviceLogMessage': _i1.MethodStreamConnector(
          name: 'deviceLogMessage',
          params: {
            'deviceId': _i1.ParameterDescription(
              name: 'deviceId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'total': _i1.ParameterDescription(
              name: 'total',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'desc': _i1.ParameterDescription(
              name: 'desc',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['devicelog'] as _i3.DevicelogEndpoint)
                  .deviceLogMessage(
            session,
            params['deviceId'],
            params['total'],
            params['desc'],
          ),
        ),
      },
    );
    connectors['example'] = _i1.EndpointConnector(
      name: 'example',
      endpoint: endpoints['example']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['example'] as _i4.ExampleEndpoint).hello(
            session,
            params['name'],
          ),
        ),
        'countdown': _i1.MethodStreamConnector(
          name: 'countdown',
          params: {},
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['example'] as _i4.ExampleEndpoint).countdown(session),
        ),
      },
    );
    modules['serverpod_auth'] = _i5.Endpoints()..initializeEndpoints(server);
  }
}
