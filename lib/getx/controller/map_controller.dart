import 'package:app/getx/controller/store_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'dart:convert' as convert;
import 'dart:math' show cos, sqrt, asin;

import 'package:shared_preferences/shared_preferences.dart';

class Location {
  final double? lat;
  final double? lng;
  Location({this.lat, this.lng});
  factory Location.fromJson(Map<String, dynamic> parsedJson) {
    return Location(lat: parsedJson['lat'], lng: parsedJson['lng']);
  }
}

class MapBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MapController());
  }
}

class MapController extends GetxController {
  // late Marker origin;
  List<Marker> groupMarker = [];
  List<LatLng> groupLatLng = [
    //Số 603 Lê Đức Thọ, P. 16, Q. Gò Vấp, TpHCM
    // const LatLng(10.835081169058773, 106.68136060618755),

    // 568 Đ. Lê Văn Việt, Long Thạnh Mỹ, Quận 9
    const LatLng(10.849722185120427, 106.81179912625585),
    const LatLng(10.798216991868848, 106.74490714160189),

    //const LatLng(10.849722185120427, 106.81179912625585),

    //
    // const LatLng(10.841811133985468, 106.81026715667838),
  ];
  // List<>
  final String key = 'AIzaSyB6qKAdiSFWcLQhlPjnoW9E2h9V5RKT-3g';
  Future<Location> getPlace(String placeId) async {
    var url =
        'https://maps.googleapis.com/maps/api/place/details/json?key=$key&place_id=$placeId';
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var jsonResult = json['result']['geometry']['location'];
    //  as Map<String, dynamic>;
    return Location.fromJson(jsonResult);
  }

  // Future<void> covertAddressToLatLng(String address) async {
  //   try {
  //     var adddress = await Geocoder.local.findAddressesFromQuery(address);
  //     var first = adddress.first;
  //     latLngOrigin =
  //         LatLng(first.coordinates.latitude, first.coordinates.longitude);
  //     update();
  //   } catch (e) {}
  // }
  @override
  void onInit() {
    // calculateDistanceForAllGroup();
    super.onInit();
  }

  List<String> distance = [];
  Future<void> calculateDistanceForAllGroup() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    double lat = prefs.getDouble('lat')!;
    double lng = prefs.getDouble('long')!;
    // if (origin != null) {
    // distace.clear();
    for (int count = 0; count < groupLatLng.length; count++) {
      try {
        // await Geolocator().distanceBetween(
        // 10.841568553647937,
        // 106.7911477952929,
        // groupLatLng[count].latitude,
        // groupLatLng[count].longitude
        // ).then((value) => distance.add(value/1000));
        // await GeolocatorPlatform.instance.distanceBetween(
        double a = Geolocator.distanceBetween(
          groupLatLng[count].latitude,
          groupLatLng[count].longitude,
          // 10.839636563421113,
          // 106.81105877559864,
          lat, lng,
        );

        print('object ddddddd');
        print(a.toDouble());
        print((a / 1000).toStringAsFixed(1));
        distance.add((a / 1000).toStringAsFixed(1));
      } catch (e) {}
      // }
    }
    prefs.setStringList('storrListDistance', distance);
  }

  // late PolylinePoints polylinePoints;
  // Map<PolylineId, Polyline> polylines = {};
  // List<LatLng> polylineCoordinates = [];
  // Set<Marker> markers = {};
  // String _startAddress = '';
  // String _destinationAddress = '';
  // String? _placeDistance;
  // _createPolylines(
  //   double startLatitude,
  //   double startLongitude,
  //   double destinationLatitude,
  //   double destinationLongitude,
  // ) async {
  //   polylinePoints = PolylinePoints();
  //   PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
  //     'AIzaSyB6qKAdiSFWcLQhlPjnoW9E2h9V5RKT-3g', // Google Maps API Key
  //     PointLatLng(startLatitude, startLongitude),
  //     PointLatLng(destinationLatitude, destinationLongitude),
  //     travelMode: TravelMode.transit,
  //   );

  //   if (result.points.isNotEmpty) {
  //     result.points.forEach((PointLatLng point) {
  //       polylineCoordinates.add(LatLng(point.latitude, point.longitude));
  //     });
  //   }

  //   PolylineId id = PolylineId('poly');
  //   Polyline polyline = Polyline(
  //     polylineId: id,
  //     color: Colors.red,
  //     points: polylineCoordinates,
  //     width: 3,
  //   );
  //   polylines[id] = polyline;
  // }

  // Future<bool> calculateDistance() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   double? lat = prefs.getDouble('lat');
  //   double? long = prefs.getDouble('long');

  //   try {
  //     // Retrieving placemarks from addresses
  //     List<Location> startPlacemark =
  //         (await locationFromAddress(_startAddress)).cast<Location>();
  //     List<Location> destinationPlacemark =
  //         (await locationFromAddress(_destinationAddress)).cast<Location>();

  //     // Use the retrieved coordinates of the current position,
  //     // instead of the address if the start position is user's
  //     // current position, as it results in better accuracy.
  //     double startLatitude = lat as double;
  //     // _startAddress == _currentAddress
  //     //     ? _currentPosition.latitude
  //     //     : startPlacemark[0].latitude;

  //     double startLongitude = long as double;
  //     //  _startAddress == _currentAddress
  //     //     ? _currentPosition.longitude
  //     //     : startPlacemark[0].longitude;

  //     // double destinationLatitude = destinationPlacemark[0].latitude;
  //     double destinationLatitude = 10.847541125721458;
  //     // double destinationLongitude = destinationPlacemark[0].longitude;
  //     double destinationLongitude = 106.80940007281545;

  //     String startCoordinatesString = '($startLatitude, $startLongitude)';
  //     String destinationCoordinatesString =
  //         '($destinationLatitude, $destinationLongitude)';

  //     // Start Location Marker
  //     Marker startMarker = Marker(
  //       markerId: MarkerId(startCoordinatesString),
  //       position: LatLng(startLatitude, startLongitude),
  //       infoWindow: InfoWindow(
  //         title: 'Start $startCoordinatesString',
  //         snippet: _startAddress,
  //       ),
  //       icon: BitmapDescriptor.defaultMarker,
  //     );

  //     // Destination Location Marker
  //     Marker destinationMarker = Marker(
  //       markerId: MarkerId(destinationCoordinatesString),
  //       position: LatLng(destinationLatitude, destinationLongitude),
  //       infoWindow: InfoWindow(
  //         title: 'Destination $destinationCoordinatesString',
  //         snippet: _destinationAddress,
  //       ),
  //       icon: BitmapDescriptor.defaultMarker,
  //     );

  //     // Adding the markers to the list
  //     markers.add(startMarker);
  //     markers.add(destinationMarker);

  //     print(
  //       'START COORDINATES: ($startLatitude, $startLongitude)',
  //     );
  //     print(
  //       'DESTINATION COORDINATES: ($destinationLatitude, $destinationLongitude)',
  //     );

  //     // Calculating to check that the position relative
  //     // to the frame, and pan & zoom the camera accordingly.
  //     // double miny = (startLatitude <= destinationLatitude)
  //     //     ? startLatitude
  //     //     : destinationLatitude;
  //     // double minx = (startLongitude <= destinationLongitude)
  //     //     ? startLongitude
  //     //     : destinationLongitude;
  //     // double maxy = (startLatitude <= destinationLatitude)
  //     //     ? destinationLatitude
  //     //     : startLatitude;
  //     // double maxx = (startLongitude <= destinationLongitude)
  //     //     ? destinationLongitude
  //     //     : startLongitude;

  //     // double southWestLatitude = miny;
  //     // double southWestLongitude = minx;

  //     // double northEastLatitude = maxy;
  //     // double northEastLongitude = maxx;

  //     // Accommodate the two locations within the
  //     // camera view of the map
  //     // mapController.animateCamera(
  //     //   CameraUpdate.newLatLngBounds(
  //     //     LatLngBounds(
  //     //       northeast: LatLng(northEastLatitude, northEastLongitude),
  //     //       southwest: LatLng(southWestLatitude, southWestLongitude),
  //     //     ),
  //     //     100.0,
  //     //   ),
  //     // );

  //     // Calculating the distance between the start and the end positions
  //     // with a straight path, without considering any route
  //     // double distanceInMeters = await Geolocator.bearingBetween(
  //     //   startLatitude,
  //     //   startLongitude,
  //     //   destinationLatitude,
  //     //   destinationLongitude,
  //     // );

  //     await _createPolylines(startLatitude, startLongitude, destinationLatitude,
  //         destinationLongitude);

  //     double totalDistance = 0.0;

  //     // Calculating the total distance by adding the distance
  //     // between small segments
  //     for (int i = 0; i < polylineCoordinates.length - 1; i++) {
  //       totalDistance += _coordinateDistance(
  //         polylineCoordinates[i].latitude,
  //         polylineCoordinates[i].longitude,
  //         polylineCoordinates[i + 1].latitude,
  //         polylineCoordinates[i + 1].longitude,
  //       );
  //     }

  //     // setState(() {
  //     _placeDistance = totalDistance.toStringAsFixed(2);
  //     print('DISTANCE: $_placeDistance km');
  //     // });

  //     return true;
  //   } catch (e) {
  //     print(e);
  //   }
  //   return false;
  // }

  // double _coordinateDistance(lat1, lon1, lat2, lon2) {
  //   var p = 0.017453292519943295;
  //   var c = cos;
  //   var a = 0.5 -
  //       c((lat2 - lat1) * p) / 2 +
  //       c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
  //   return 12742 * asin(sqrt(a));
  // }
}
