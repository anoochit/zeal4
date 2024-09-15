import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:zeal4_client/zeal4_client.dart';

const mqttHost = 'localhost';
const serverPodHost = 'http://localhost:8080/';

late MqttServerClient mqtt;
MqttClientConnectionStatus? status;
Client client = Client(
  serverPodHost,
  onFailedCall: (p0, p1, p2) => print('> serverpod : faild call'),
);

// handle subscribe
runETL() async {
  // mqtt client id
  final clientId = 'ClientId-${DateTime.now().microsecondsSinceEpoch}';

  // call hello methods
  final result = await client.example.hello("John");

  // print result after call hello method
  print('> call hello = $result');

  // connect, subscribe and push message to serverpod
  try {
    // connect to mqtt broker
    mqtt = MqttServerClient(
      mqttHost,
      clientId,
      maxConnectionAttempts: 10,
    )..autoReconnect = true;

    // set callback onsubscribed
    mqtt.onSubscribed = onSubscribed;
    // connect to mqtt broker
    status = await mqtt.connect();
    print('> connection status : ${status!.state.name}');
    // if connected then subcscribe
    if (status!.state == MqttConnectionState.connected) {
      // subscribe /device/+/msg ,a single level wildcard
      print('> start subscribe');
      mqtt.subscribe(
        '/device/+/msg',
        MqttQos.atMostOnce,
      );
      // result stream data from mqtt broker
      mqtt.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? data) {
        final recMess = data![0].payload as MqttPublishMessage;
        final topic = data[0].topic;
        final message = MqttPublishPayload.bytesToStringAsString(
          recMess.payload.message,
        );
        // print payload
        print('> topic : $topic\n> payload : $message');

        // get device id from topic /device/+/msg
        RegExp regExp = RegExp(r'/device/([^/]+)/msg');
        Match? match = regExp.firstMatch(topic);

        if (match != null) {
          final uuid = match.group(1)!;
          client.devicelog.addDeivceLog(uuid, message);
        } else {
          print('No match found.');
        }
      });
    }
  } catch (e) {
    print('$e');
  }
}

// on subscribed
void onSubscribed(String topic) {
  print('> subscription confirmed for topic $topic');
}
