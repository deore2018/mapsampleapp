import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samplemap/network_connectivity/connectivity_status.dart';

class Check_connection extends StatefulWidget {
  @override
  _Check_connectionState createState() => _Check_connectionState();
}

class _Check_connectionState extends State<Check_connection> {
  @override
  Widget build(BuildContext context) {
    // Get the stream value
    var connectionStatus = Provider.of<ConnectivityStatus>(context);

    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[


              connectionStatus == ConnectivityStatus.Offline ? FlatButton(
                child: Text('Not Connected To Network'),
                color: Colors.red[600],
                onPressed: () {},
              ): FlatButton(
                child: Text('Go To Next'),
                color: Colors.red[600],
                onPressed: () {},
              ),
            ]),
      ),
    );
  }
}