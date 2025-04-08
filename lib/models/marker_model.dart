import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkerModel {
  // final Marker marker;
  // VoidCallback? onTa
  final MarkerId markerId;
  final void Function()? onTap;
  final LatLng? position;
  final String title;
  final String price;
  final String about;
  final String hostedBy;
  MarkerModel(
      {
      // required this.marker,
      required this.markerId,
      required this.title,
      required this.price,
      required this.about,
      this.onTap,
      this.position,
      required this.hostedBy});
}
