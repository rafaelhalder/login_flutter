import 'package:flutter/material.dart';
import 'package:login_flutter/shared_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Dashboard"),
        actions: [
          GestureDetector(
            onTap: () {
              SharedService.logout().then(
                (_) => Navigator.of(context).pushReplacementNamed('/login'),
              );
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Text(
                    "Logout",
                    style: TextStyle(fontSize: 18),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      body: Text("Text"),
    );
  }
}
