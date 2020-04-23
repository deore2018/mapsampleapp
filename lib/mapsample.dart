import 'package:flutter/material.dart';
import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  bool _open = false;
  PersistentBottomSheetController _controller;
  GlobalKey<ScaffoldState> _key = GlobalKey();

  static double latitude; //= double.parse(ConstantValueClass.studentlatitude);
  static double
      longitude; //= double.parse(ConstantValueClass.studentlongitude);
  GoogleMapController mapController;
  Set<Marker> markers = Set();
  PersistentBottomSheetController _controllernew;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(18.5246036,73.7929269),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(18.5246036,73.7929269),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  List<String> details = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    details = ["Satara,Sangli,Nashik,Pune"];
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            myLocationEnabled: true,
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
            },
          ),
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          _newTaskModalBottomSheet(context);
        },
        child: new Icon(Icons.add),
      ),
    );
  }

  void _newTaskModalBottomSheet(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.location_city),
                    title: new Text('Nashik'),
                    onTap: () {
                      Navigator.pop(context);
                      mapController.animateCamera(
                        CameraUpdate.newCameraPosition(
                          CameraPosition(
                              bearing: 192.8334901395799,
                              tilt: 59.440717697143555,
                              target: LatLng(19.9909493, 73.7334404),
                              zoom: 10.0),
                        ),
                      );
                    }),
                new ListTile(
                  leading: new Icon(Icons.location_city),
                  title: new Text('Nagpur'),
                  onTap: () {
                    Navigator.pop(context);
                    mapController.animateCamera(
                      CameraUpdate.newCameraPosition(
                        CameraPosition(
                            bearing: 192.8334901395799,
                            tilt: 59.440717697143555,
                            target: LatLng(21.1610714,79.0024697),
                            zoom: 10.0),
                      ),
                    );
                  },
                ),
                new ListTile(
                  leading: new Icon(Icons.location_city),
                  title: new Text('Satara'),
                  onTap: () {
                    Navigator.pop(context);
                    mapController.animateCamera(
                      CameraUpdate.newCameraPosition(
                        CameraPosition(
                            bearing: 192.8334901395799,
                            tilt: 59.440717697143555,
                            target: LatLng(17.6745342,73.9832418),
                            zoom: 10.0),
                      ),
                    );
                  },
                ),
                new ListTile(
                  leading: new Icon(Icons.location_city),
                  title: new Text('New Delhi'),
                  onTap: () {
                    Navigator.pop(context);
                    mapController.animateCamera(
                      CameraUpdate.newCameraPosition(
                        CameraPosition(
                            bearing: 192.8334901395799,
                            tilt: 59.440717697143555,
                            target: LatLng(28.5272803,77.0688995),
                            zoom: 10.0),
                      ),
                    );
                  },
                ),
                new ListTile(
                  leading: new Icon(Icons.location_city),
                  title: new Text('Hyderabad'),
                  onTap: () {
                    Navigator.pop(context);
                    mapController.animateCamera(
                      CameraUpdate.newCameraPosition(
                        CameraPosition(
                            bearing: 192.8334901395799,
                            tilt: 59.440717697143555,
                            target: LatLng(17.4122998,78.267959),
                            zoom: 10.0),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        });
  }

  _goToTheLake() async {
    mapController.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
