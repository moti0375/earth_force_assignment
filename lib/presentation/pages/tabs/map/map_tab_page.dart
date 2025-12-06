import 'dart:async';

import 'package:earth_force_assignment/core/data/model/location.dart';
import 'package:earth_force_assignment/di/locator_config.dart';
import 'package:earth_force_assignment/presentation/pages/tabs/map/map_tab_store.dart';
import 'package:earth_force_assignment/presentation/pages/tabs/map/poi_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';


class MapTabPage extends StatefulWidget {
  final MapTabStore store;
  const MapTabPage({required this.store, super.key});

  @override
  State<MapTabPage> createState() => _MapTabPageState();

  static Widget create() {
    return Provider<MapTabStore>(
      create: (_) => getIt<MapTabStore>(),
      child: Consumer<MapTabStore>(
          builder: (context, store, child) => MapTabPage(
            store: store,
          )),
    );
  }
}

class _MapTabPageState extends State<MapTabPage> {

  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
  Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController _googleMapController;
  ReactionDisposer? mobxDispose;
  double currentZoom = 15;

  @override
  void initState() {
    super.initState();
    _initializeMap();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    mobxDispose ??= reaction((_) => widget.store.location,
            (Location? value) => value != null ? _moveMapToPosition(LatLng(value.latitude, value.longitude), currentZoom) : null);
  }

  @override
  void dispose() {
    mobxDispose?.call();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          child: GoogleMap(
            onTap: _onMapClicked,
            mapType: MapType.normal,
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            initialCameraPosition: CameraPosition(
                target: const LatLng(0, 0),
                zoom: currentZoom),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              _googleMapController = controller;
            },
            markers: widget.store.markers.toSet(),
            onCameraMove: _onCameraMoved,
          ),
        ),
      ),
    );
  }

  void _onMapClicked(LatLng latLng) async {
    await _showPoiInputDialog(context, latLng).then((poiInput) {
      if(poiInput != null){
        print("_onMapClicked: poiInput is $poiInput");
        widget.store.onMapClicked(poiInput);
      } else {
        print("_onMapClicked: poiInput is null");
      }
    });
  }

  void _onCameraMoved(CameraPosition position) {
    setState(() {
      currentZoom = position.zoom;
    });
  }

  void _initializeMap() async {
    Position? locationData = await _getCurrentPosition();
    if (locationData != null) {
      widget.store.initializeMap(LatLng(locationData.latitude, locationData.longitude));
      _moveMapToPosition(
          LatLng(locationData.latitude, locationData.longitude), currentZoom);
    }
  }

  Future<Position?> _getCurrentPosition() async {
    final position = await _geolocatorPlatform.getCurrentPosition();
    return position;
  }

  void _moveMapToPosition(LatLng position, zoom) {
    CameraPosition camPosition = CameraPosition(target: position, zoom: zoom);
    _googleMapController
        .moveCamera(CameraUpdate.newCameraPosition(camPosition));
  }

  Future<PoiInput?> _showPoiInputDialog(BuildContext context, LatLng latLng) async {
    final textController = TextEditingController();
    final picker = ImagePicker();
    String? pickedImage;

    return showDialog<PoiInput>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add POI"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: textController,
                decoration: const InputDecoration(
                  labelText: "Description",
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.image),
                    onPressed: () async {
                      final file = await picker.pickImage(
                        source: ImageSource.camera,
                      );
                      if (file != null) {
                        pickedImage = file.path;
                      }
                    },
                  ),
                  const Text("Attach Image"),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(null),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                final desc = textController.text.trim();
                if (desc.isEmpty) return;
                Navigator.of(context).pop(
                  PoiInput(
                    position: latLng,
                    description: desc,
                    imagePath: pickedImage,
                  ),
                );
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

}
