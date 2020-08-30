import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart';
import './UI/home.dart';
import './Server/server.dart';

class DrawerItem {
  String title;
  IconData icon;
  bool enabled;
  DrawerItem(this.title, this.icon, {this.enabled = true});
}

var servaddress = '127.0.0.1';
var servport = 3456;
bool running = false;

main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(new ServerApplication());
}

class ServerApplication extends StatefulWidget {
  @override
  _ServerApplicationState createState() => _ServerApplicationState();
}

class _ServerApplicationState extends State<ServerApplication> {
  @override
  void initState() {
    super.initState();
    initialize(changerunning);
  }

  void changerunning(bool st) {
    print("Callhed");
    setState(() {
      running = st;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Media Streamer',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomePage(),
    );
  }
}
