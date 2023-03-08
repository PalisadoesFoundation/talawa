// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/create_event_view_model.dart';

/// MapScreen returns a widget that has mutable state _MapScreenState.
class MapScreen extends StatefulWidget {
  const MapScreen(this.model, this.latitude, this.longitude, {Key? key})
      : super(key: key);

  final CreateEventViewModel? model;
  final double latitude;
  final double longitude;

  @override
  _MapScreenState createState() => _MapScreenState();
}

/// _MapScreenState returns a widget that renders map screen. The parameters needed are latitude and longitude.
class _MapScreenState extends State<MapScreen> {
  late GoogleMapController googleMapController;

  @override
  void initState() {
    super.initState();
    markers.add(
      Marker(
        markerId: const MarkerId('pinned'),
        position: LatLng(widget.latitude, widget.longitude),
      ),
    );
  }

  Set<Marker> markers = {};
  String address = '';
  double? latitude;
  double? longitude;

  @override
  Widget build(BuildContext context) {
    final model = widget.model;
    return Scaffold(
      // header of the widget
      appBar: AppBar(
        // title
        title: const Text("User current location"),
        centerTitle: true,
        actions: [
          model != null
              ? IconButton(
                  icon: const Icon(Icons.done),
                  onPressed: () async {
                    model.eventLocationTextController.text = address;
                    model.latitude = latitude;
                    model.longitude = longitude;
                    navigationService.pop();
                  },
                )
              : Container(),
        ],
      ),
      // GoogleMap is widget imported from google_maps_flutter that is a
      // Flutter plugin that provides a Google Maps widget.
      body: GoogleMap(
        // initial position with the reference of latitute and longitude passed.
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.latitude, widget.longitude),
          zoom: 14,
        ),
        markers: markers,
        zoomControlsEnabled: false,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          googleMapController = controller;
        },
        onTap: (LatLng latLng) async {
          if (model != null) {
            final placemarkList = await placemarkFromCoordinates(
              latLng.latitude,
              latLng.longitude,
            );
            final placemark = placemarkList[0];
            final name = placemark.name == null ? '' : '${placemark.name}, ';
            final subLocality = placemark.subLocality == null
                ? ''
                : '${placemark.subLocality}, ';
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
              markers.add(
                Marker(
                  markerId: const MarkerId('pinned'),
                  position: latLng,
                ),
              );
            });
          }
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

    // Check if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    // if location services are not enabled
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    // check for the permission.
    permission = await Geolocator.checkPermission();

    // if permission denied
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    // if permission denied for permanently
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    // if the permission is enabled.
    final Position position = await Geolocator.getCurrentPosition();

    // return the position.
    return position;
  }
}
