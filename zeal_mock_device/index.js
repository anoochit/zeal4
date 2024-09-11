const os = require("node-os-utils");
const mqtt = require("mqtt");

//var mqtt_host = '192.168.1.42'
const mqtt_host = "localhost";
const mqtt_port = 1883;

const deviceId = "mock_device";

// init logger
const winston = require("winston");
const { mem } = require("node-os-utils");
const logger = winston.createLogger({
  level: "info",
  format: winston.format.simple(),
  defaultMeta: { service: "user-service" },
  transports: [
    new winston.transports.File({
      filename: "log/error_pub.log",
      level: "error",
    }),
    new winston.transports.File({ filename: "log/combined_pub.log" }),
  ],
});

var client = mqtt.connect({ port: mqtt_port, host: mqtt_host });

client.on("connect", () => {
  console.log("MQTT Broker connected");
  logger.info("MQTT Broker connected");

  // publish sample data, remove this function on production
  setInterval(async () => {
    var cpu = os.cpu;
    var mem = os.mem;

    var cpu_usage = await cpu.usage();
    var mem_usage = await mem.used();

    var timestamp = Math.floor(+new Date() / 1000).toString();

    // build message
    var message =
      '{"cpu_usage":' +
      cpu_usage.toString() +
      ', "mem_usage":' +
      mem_usage["usedMemMb"].toString() +
      ', "mem_total":' +
      mem_usage["totalMemMb"].toString() +
      ', "timestamp":' +
      timestamp +
      "}";

    // log
    console.log(message);
    logger.info(message);

    // publish every 1 min
    client.publish("/device/" + deviceId + "/msg", message);
  }, 5000);
});

client.on("error", (error) => {
  console.log(error.toString());
  logger.error(error.toString());
});
