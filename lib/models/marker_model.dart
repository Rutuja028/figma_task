import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkerModel {
  final Marker marker;
  VoidCallback? onTap;
  final String title;
  final String price;
  final String about;
  final String hostedBy;
  MarkerModel(
      {required this.marker,
      required this.title,
      required this.price,
      required this.about,
      required this.hostedBy});
}
