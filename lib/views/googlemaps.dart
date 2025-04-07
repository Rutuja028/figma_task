import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:figma_task/models/marker_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  int pageIndex = 0;
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(18.53049527920011, 73.82897971465682),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(18.53049527920011, 73.82897971465682),
    tilt: 59.440717697143555,
    zoom: 21.151926040649414,
  );

  void _showModalBottomSheet(MarkerModel element) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      onPageChanged: (ind, _) {
                        setState(() {
                          pageIndex = ind;
                        });
                      },
                      height: 180,
                      viewportFraction: 1,
                      initialPage: 1,
                    ),
                    items: [
                      Image.asset(
                        "assets/ecom_carousel.png",
                        fit: BoxFit.fitHeight,
                      ),
                      Image.asset(
                        "assets/ecom_carousel.png",
                        fit: BoxFit.fitHeight,
                      ),
                      Image.asset(
                        "assets/ecom_carousel.png",
                        fit: BoxFit.fitHeight,
                      ),
                      Image.asset(
                        "assets/ecom_carousel.png",
                        fit: BoxFit.fitHeight,
                      ),
                      Image.asset(
                        "assets/ecom_carousel.png",
                        fit: BoxFit.fitHeight,
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 15,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        5,
                        (int ind) => Container(
                          height: 8,
                          margin: const EdgeInsets.only(right: 5),
                          width: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: pageIndex == ind
                                ? const Color(0xFF006FFD)
                                : const Color(0xFFC5C6CC),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Great Apartment",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                      ),
                    ),
                    const Gap(4),
                    const Text(
                      "€ 150.00 ",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                        color: Color(0xFF71727A),
                      ),
                    ),
                    const Gap(24),
                    const Text(
                      "About",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 10,
                        color: Color(0xFF8F9098),
                      ),
                    ),
                    const Gap(8),
                    const Text(
                      "Perfect flat for 4 people. Peaceful and good location, close to bus stops and many restaurants. ",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 12,
                        color: Color(0xFF71727A),
                      ),
                    ),
                    const Gap(24),
                    const Text(
                      "Hosted by",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 10,
                      ),
                    ),
                    const Gap(8),
                    Row(
                      children: [
                        Image.asset(
                          "assets/bottomSheetProfile.png",
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < list.length; i++) {
      list[i].marker.onTap = () {
        _showModalBottomSheet(list[i]);
      };
    }
  }

  List<MarkerModel> list = [
    MarkerModel(
      title: 'Great Apartment',
      price: '€ 150.00 ',
      hostedBy: 'Karen Roe',
      about:
          'Perfect flat for 4 people. Peaceful and good location, close to bus stops and many restaurants. ',
      marker:  Marker(
        markerId: MarkerId('place1'),
        onTap: (){},
        position: LatLng(
          18.530060649254924,
          73.83224781444254,
        ),
      ),
    ),
    MarkerModel(
      title: 'Great Apartment',
      price: '€ 150.00 ',
      hostedBy: 'Karen Roe',
      about:
          'Perfect flat for 4 people. Peaceful and good location, close to bus stops and many restaurants. ',
      marker:  Marker(
        // onTap: () => _showModalBottomSheet(),
        markerId: MarkerId('place2'),
        position: LatLng(
          18.53256743026    73.82923014724803,
        ),
      ),
    ),
    MarkerModel(
      title: 'Huge Apartment',
      price: '€ 160.00 ',
      hostedBy: 'Karen Roe',
      about:
          'Perfect flat for 4 people. Peaceful and good location, close to bus stops and many restaurants. ',
      marker:  Marker(
        // onTap: () => _showModalBottomSheet(),
        markerId: MarkerId('place3'),
        position: LatLng(
          18.539619925718593,
          73.82797358889854,
        ),
      ),
    ),
    MarkerModel(
      title: 'Lavish Apartment',
      price: '€ 130.00 ',
      hostedBy: 'Karen Roe',
      about:
          'Perfect flat for 4 people. Peaceful and good location, close to bus stops and many restaurants. ',
      marker:  Marker(
        // onTap: () => _showModalBottomSheet(),
        markerId: MarkerId('place4'),
        position: LatLng(
          18.51834290652452,
          73.83394893954366,
        ),
      ),
    ),
    MarkerModel(
      title: 'My Apartment',
      price: '€ 250.00 ',
      hostedBy: 'Karen Roe',
      about:
          'Perfect flat for 4 people. Peaceful and good location, close to bus stops and many restaurants. ',
      marker:  Marker(
        // onTap: () => _showModalBottomSheet(),
        markerId: MarkerId('place5'),
        position: LatLng(
          18.521871696491363,
          73.82172312699228,
        ),
      ),
    ),
    MarkerModel(
      title: 'Your Apartment',
      price: '€ 180.00 ',
      hostedBy: 'Karen Roe',
      about:
          'Perfect flat for 4 people. Peaceful and good location, close to bus stops and many restaurants. ',
      marker:  Marker(
        // onTap: () => _showModalBottomSheet(),
        markerId: MarkerId('place2'),
        position: LatLng(
          18.530060649254924,
          73.83224781444254,
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              GoogleMap(
                markers: list
                    .map((e) {
                      e.onTap = () {
                        _showModalBottomSheet(e);
                      };
                      return e.marker;
                    })
                    .toList()
                    .toSet(),
                mapType: MapType.normal,
                liteModeEnabled: true,
                // markers: ,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: _goToTheStrelema,
          label: const Text('To the lake!'),
          icon: const Icon(Icons.directions_boat),
        ),
      ),
    );
  }

  Future<void> _goToTheStrelema() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
