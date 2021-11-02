import 'package:app/models/place_item_res.dart';
import 'package:app/screens/ggmap/ride_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPicker extends StatefulWidget {
  @override
  _MapPickerState createState() => _MapPickerState();
}

class _MapPickerState extends State<MapPicker> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  // var _tripDistance = 0;
  // final Map<String, Marker> _markers = <String, Marker>{};
  Set<Marker> markers = {};

  GoogleMapController? _mapController;

  @override
  Widget build(BuildContext context) {
    print("build UI");
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            GoogleMap(
              //  markers: Set.of(markers.values),
              // markers: markers,
              onMapCreated: (GoogleMapController controller) {
                _mapController = controller;
              },
              initialCameraPosition: CameraPosition(
                target: LatLng(10.7915178, 106.7271422),
                zoom: 14.4746,
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                    title: Text(
                      "Chọn vị trí của bạn",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: RidePicker(onPlaceSelected),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onPlaceSelected(PlaceItemRes place, bool fromAddress) {
    _addMarker(place);
  }

  void _addMarker(PlaceItemRes place) async {
    Marker maker = Marker(
      markerId: MarkerId('(${place.lat}, ${place.lng})'),
      position: LatLng(place.lat, place.lng),
      infoWindow: InfoWindow(
        title: place.address,
      ),
    );
    markers.add(maker);
  }
}
