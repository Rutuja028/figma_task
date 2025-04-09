import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:figma_task/components/elevated_button.dart';
import 'package:figma_task/models/marker_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(18.53049527920011, 73.82897971465682),
    zoom: 14.4746,
  );

///////////////FOR FLOATING ACTION BUTTON
  // static const CameraPosition _kLake = CameraPosition(
  //   bearing: 192.8334901395799,
  //   target: LatLng(18.53049527920011, 73.82897971465682),
  //   tilt: 59.440717697143555,
  //   zoom: 21.151926040649414,
  // );

  void _showModalBottomSheet(MarkerModel element) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      scrollControlDisabledMaxHeightRatio: 0.73,
      isDismissible: true,
      context: context,
      showDragHandle: true,
      builder: (context) {
        int pageIndex = 0;

        return StatefulBuilder(
          builder: (context, setState1) => Container(
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
                        padEnds: false,
                        // aspectRatio: 1,
                        onPageChanged: (ind, _) {
                          setState1(() {
                            pageIndex = ind;
                          });
                        },

                        viewportFraction: 1,
                        initialPage: 1,
                      ),
                      items: [
                        Image.asset(
                          "assets/ecom_carousel.png",
                          fit: BoxFit.fill,
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
                    // Positioned(
                    //   top: 5,
                    //   left: 0,
                    //   right: 0,
                    //   child: SvgPicture.asset(
                    //     "assets/bottomsheet_handle.svg",
                    //   ),
                    // ),
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
                  child: Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          element.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                          ),
                        ),
                        const Gap(4),
                        Text(
                          element.price,
                          style: const TextStyle(
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
                        Text(
                          element.about,
                          style: const TextStyle(
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/bottomSheetProfile.png",
                            ),
                            const Gap(4.5),
                            Column(
                              children: [
                                Text(
                                  element.hostedBy,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const Gap(2),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/star_filled.svg",
                                      width: 12,
                                    ),
                                    const Gap(2),
                                    const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "4.5",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFF71727A),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Gap(24),
                        Container(
                          width: double.infinity,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xFF006FFD),
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: Colors.white,
                                foregroundColor: const Color(0xFF006FFD)),
                            child: const Text("See details"),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // @override
  // void initState() {
  //   super.initState();

  //   for (int i = 0; i < list.length; i++) {
  //     list[i].onTap = () {
  //       _showModalBottomSheet(list[i]);
  //     };
  //   }
  // }

  List<MarkerModel> list = [
    MarkerModel(
      title: 'Great Apartment',
      price: '€ 150.00 ',
      hostedBy: 'Karen Roe',
      about:
          'Perfect flat for 4 people. Peaceful and good location, close to bus stops and many restaurants. ',
      markerId: const MarkerId('place1'),
      // onTap: () {},
      position: const LatLng(
        18.530667161804125,
        73.82901820999429,
      ),
    ),
    MarkerModel(
      title: 'Apartment',
      price: '€ 150.00 ',
      hostedBy: 'Rutuja Shinde',
      about: 'good location, many restaurants. ',

      // onTap: () {
      // },
      markerId: const MarkerId('place2'),
      position: const LatLng(
        18.527693242423155,
        73.84321330549294,
      ),
    ),
    MarkerModel(
      title: 'Huge Apartment',
      price: '€ 160.00 ',
      hostedBy: 'Steve Jobs',
      about: 'close to bus stops ',
      // onTap: () {}, //_showModalBottomSheet(),
      markerId: const MarkerId('place3'),
      position: const LatLng(
        18.52195093109692,
        73.82182599287606,
      ),
    ),
    MarkerModel(
      title: 'Lavish Apartment',
      price: '€ 130.00 ',
      hostedBy: 'ABC XYZ',
      about: 'Perfect flat, close to many restaurants. ',
      // onTap: () {}, //_showModalBottomSheet(),
      markerId: const MarkerId('place4'),
      position: const LatLng(
        18.528160505809332,
        73.82378121954946,
      ),
    ),
    MarkerModel(
      title: 'My Apartment',
      price: '€ 250.00 ',
      hostedBy: 'PQR TUV',
      about: 'for 4 people. Peaceful ',
      // onTap: () {}, //_showModalBottomSheet(),
      markerId: const MarkerId('place5'),
      position: const LatLng(
        18.51786394357736,
        73.81276912103588,
      ),
    ),
    MarkerModel(
      title: 'Your Apartment',
      price: '€ 180.00 ',
      hostedBy: 'QWE RTY',
      about: 'Perfect flat and good location . ',
      // onTap: () {}, //_showModalBottomSheet(),
      markerId: const MarkerId('place6'),
      position: const LatLng(
        18.549883513198132,
        73.83902274125121,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Color(0xFF006FFD),
            ),
          ),
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Recife",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                "Mar 12 – Mar 15",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF71727A),
                ),
              ),
            ],
          ),
          actionsPadding: const EdgeInsets.all(8),
          actions: const [
            Text(
              "291 results",
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF71727A),
              ),
            )
          ],
        ),
        body: SafeArea(
          child: Stack(
            children: [
              GoogleMap(
                markers: list
                    .map((e) => Marker(
                          icon: BitmapDescriptor.defaultMarkerWithHue(
                              BitmapDescriptor.hueAzure),
                          markerId: e.markerId,
                          position: e.position!,
                          onTap: () => _showModalBottomSheet(e),
                        ))
                    .toList()
                    .toSet(),
                mapType: MapType.normal,
                liteModeEnabled: true,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ],
          ),
        ),
        // floatingActionButton: FloatingActionButton.extended(
        //   onPressed: _goToTheStrelema,
        //   label: const Text('To The Strelema!'),
        //   icon: const Icon(Icons.directions_boat),
        // ),
      ),
    );
  }

//////////////////FUNCTION FOR FLOATING ACTION BUTTON
//   Future<void> _goToTheStrelema() async {
//     final GoogleMapController controller = await _controller.future;
//     await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
//   }
}
