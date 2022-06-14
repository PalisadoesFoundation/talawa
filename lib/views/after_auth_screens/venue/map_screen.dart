import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/create_event_view_model.dart';

class MapScreen extends StatefulWidget {
  const MapScreen(this.model, {Key? key}) : super(key: key);

  final CreateEventViewModel model;

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController googleMapController;

  static const CameraPosition initialCameraPosition = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 10,
  );

  Set<Marker> markers = {};
  String address = '';
  double? latitude;
  double? longitude;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User current location"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.done),
            onPressed: () async {
              widget.model.eventLocationTextController.text = address;
              widget.model.latitude = latitude;
              widget.model.longitude = longitude;
              navigationService.pop();
            },
          ),
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: initialCameraPosition,
        markers: markers,
        zoomControlsEnabled: false,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          googleMapController = controller;
        },
        onTap: (LatLng latLng) async {
          final placemarkList =
              await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
          final placemark = placemarkList[0];
          final name = placemark.name == null ? '' : '${placemark.name}, ';
          final subLocality =
              placemark.subLocality == null ? '' : '${placemark.subLocality}, ';
          final locality =
              placemark.locality == null ? '' : '${placemark.locality}, ';
          final administrativeArea = placemark.administrativeArea == null
              ? ''
              : '${placemark.administrativeArea}, ';
          final country =
              placemark.country == null ? '' : '${placemark.country}';
          address =
              name + subLocality + locality + administrativeArea + country;
          latitude = latLng.latitude;
          longitude = latLng.longitude;
          setState(() {
            markers.clear();
            markers.add(Marker(
              markerId: const MarkerId('pinned'),
              position: latLng,
            ));
          });
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final Position position = await _determinePosition();

          googleMapController.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: LatLng(position.latitude, position.longitude),
                zoom: 14,
              ),
            ),
          );

          setState(() {
            markers.clear();
            markers.add(
              Marker(
                markerId: const MarkerId('currentLocation'),
                position: LatLng(position.latitude, position.longitude),
              ),
            );
          });
        },
        label: const Text('Current Location'),
        icon: const Icon(Icons.my_location),
      ),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    final Position position = await Geolocator.getCurrentPosition();

    return position;
  }
}
