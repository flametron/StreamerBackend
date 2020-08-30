import 'package:angel_framework/angel_framework.dart';
import 'package:angel_framework/http.dart';
import '../main.dart';
//import 'package:angel_production/angel_production.dart';

var server;
Angel app;
var http;

void initialize(callback) async {
  app = Angel();
  app.get('/', (req, resp) {
    resp.write(" Welcome Nigga");
  });
  http = AngelHttp(app);

  server = await http.startServer(servaddress, servport);
  var url = 'http://${server.address.address}:${server.port}';
  print('Listening at $url');
  callback(true);
  servaddress = server.address.address;
}

void stopserver() async {
  server = await http.close();

  print('Closed server at $servaddress:$servport');
}
