// import 'package:web_socket_channel/web_socket_channel.dart';
// import 'package:web_socket_channel/status.dart' as status;
// var channel = WebSocketChannel.connect(Uri.parse('wss://ws.coinapi.io/v3/'));
//

// import 'package:web_socket_channel/io.dart';
// import 'package:web_socket_channel/status.dart' as status;
// import 'package:web_socket_channel/web_socket_channel.dart';
// late WebSocket ws;
//
// void connectToCoinAPI() async {
//   ws = await WebSocket.connect("wss://ws.coinapi.io/v3/");
//   ws.listen((data) {
//     print(data);
//   });
//   var subscribeData = {
//     "type": "hello",
//     "heartbeat": false,
//     "apikey": "552ABBE5-25DF-4ACA-8C88-62211BDFB19A",
//     "subscribe_data_type": ["trade"],
//   };
//   ws.add(jsonEncode(subscribeData));
// }
//
// ///coinapikey  552ABBE5-25DF-4ACA-8C88-62211BDFB19A
// ///coinmarketcap api key 39b88cac-feeb-4209-84f3-02b50317ba98
//
