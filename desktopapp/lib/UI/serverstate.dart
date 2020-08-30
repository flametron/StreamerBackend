import 'package:flutter/material.dart';
import '../main.dart';

class ServerStatusPage extends StatefulWidget {
  @override
  _ServerStatusPageState createState() => _ServerStatusPageState();
}

class _ServerStatusPageState extends State<ServerStatusPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("$servaddress:$servport\n$running"),
      ),
    );
  }
}
