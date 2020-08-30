import '../main.dart';
import 'package:flutter/material.dart';
import '../UI/accountpage.dart';
import '../UI/serverstate.dart';
import '../Server/server.dart';

const List<Color> blueGradients = [
  Color(0xFF0448AF),
  Color(0xFF1672FE),
  Color(0xFFA5C8FD),
];

class DrawerItem {
  String title;
  IconData icon;
  bool enabled;
  DrawerItem(this.title, this.icon, {this.enabled = true});
}

class HomePage extends StatefulWidget {
  final drawerItems = [
    DrawerItem("Home", Icons.home),
    DrawerItem("Manage Accounts", Icons.supervisor_account),
    DrawerItem("Server Settings", Icons.settings, enabled: false)
  ];

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return ServerStatusPage();
      case 1:
        return AccountsPage();
      case 3:
      default:
        return Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  void toggleserver() async {
    print("pressed$running");
    if (running) {
      stopserver();
      setState(() {
        running = false;
      });
    } else {
      await initialize(changerunning);
    }
  }

  void changerunning(bool st) {
    setState(() {
      running = st;
    });
  }

  DateTime currentBackPressTime;
  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(new ListTile(
        leading: Icon(d.icon),
        title: Text(d.title),
        enabled: d.enabled,
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i),
      ));
    }
/*
    return Scaffold(
        body: SingleChildScrollView(child: ConstrainedBox(
          constraints: BoxConstraints(),
          child: _getDrawerItemWidget(_selectedDrawerIndex),
        ),)
    );
    */
    return Scaffold(
      appBar: AppBar(
        title: Text("Media Streaming Server"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleserver(),
      ),
      drawer: Drawer(
        child: ListView(children: drawerOptions),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}
