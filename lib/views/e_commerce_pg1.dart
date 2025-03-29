import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class ECommercePg1 extends StatefulWidget {
  const ECommercePg1({super.key});

  @override
  State createState() => _ECommercePg1State();
}

class _ECommercePg1State extends State {
  int pageIndex = 0;
  List<Map<String, dynamic>> allProducts = [
    {
      'name': 'Amazing T-Shirt',
      'price': '\u{20AC} ${12}',
      'description':
          'The perfect T-shirt for when you want to feel comfortable but still stylish.Made of 100% cotton fabric in four colours. Perfect for the warmest days.'
    },
    {
      'name': 'Fabulous Pants',
      'price': '\u{20AC} ${15}',
      'description':
          'Stylish and comfortable, perfect for any occasion. Made from premium fabric for a sleek look.'
    },
    {
      'name': 'Fantastic Jacket',
      'price': '\u{20AC} ${17}',
      'description':
          'A modern jacket with a perfect fit, great for layering. Lightweight yet warm.'
    },
    {
      'name': 'Spectacular Dress',
      'price': '\u{20AC} ${12}',
      'description':
          'A versatile and elegant dress that complements any style. Flows beautifully with every step.'
    },
    {
      'name': 'Elegant Shoes',
      'price': '\u{20AC} ${18}',
      'description':
          'Chic and comfortable footwear designed for all-day wear. Enhances any outfit effortlessly.'
    },
    {
      'name': 'Classic Crop Top',
      'price': '\u{20AC} ${20}',
      'description':
          'A trendy and breathable crop top, ideal for casual and stylish looks. Perfect for warm days.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
          elevation: 0,
          //  onDestinationSelected: (){},
          //  selectedIndex: _selectedInd,
          backgroundColor: Colors.white,
          indicatorColor: Colors.white,
          destinations: <Widget>[
            NavigationDestination(
              icon: SvgPicture.asset(
                "assets/Icon.svg",
                colorFilter:
                    const ColorFilter.mode(Color(0xFFD4D6DD), BlendMode.srcIn),
              ),
              selectedIcon: SvgPicture.asset(
                "assets/Icon.svg",
                colorFilter:
                    const ColorFilter.mode(Color(0xFF006FFD), BlendMode.srcIn),
              ),
              label: 'Chats',
            ),
            NavigationDestination(
                icon: SvgPicture.asset(
                  "assets/friends.svg",
                  colorFilter: const ColorFilter.mode(
                      Color(0xFFD4D6DD), BlendMode.srcIn),
                ),
                selectedIcon: SvgPicture.asset(
                  "assets/friends.svg",
                  colorFilter: const ColorFilter.mode(
                      Color(0xFF006FFD), BlendMode.srcIn),
                ),
                label: 'Friends'),
            NavigationDestination(
                icon: SvgPicture.asset(
                  "assets/settings.svg",
                  colorFilter: const ColorFilter.mode(
                      Color(0xFFD4D6DD), BlendMode.srcIn),
                ),
                selectedIcon: SvgPicture.asset(
                  "assets/settings.svg",
                  colorFilter: const ColorFilter.mode(
                      Color(0xFF006FFD), BlendMode.srcIn),
                ),
                label: 'Settings')
          ]),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search_outlined,
          ),
        ),
        actionsPadding: const EdgeInsets.all(10),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: const Icon(Icons.favorite_border_outlined),
          ),
          // const Gap(16),
          SvgPicture.asset(
            "assets/shopping_bag_outlined.svg",
            colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
            height: 24,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
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
                  height: 214,
                  viewportFraction: 1,
                  initialPage: 1,
                ),
                items: [
                  Image.asset("assets/ecom_carousel.png"),
                  Image.asset("assets/ecom_carousel.png"),
                  Image.asset("assets/ecom_carousel.png"),
                  Image.asset("assets/ecom_carousel.png"),
                  Image.asset("assets/ecom_carousel.png"),
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
          const Gap(24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Perfect for you",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextButton(
                child: const Text(
                  "See more",
                  style: TextStyle(
                    color: Color(0xFF006FFD),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
          const Gap(20),
          SizedBox(
            height: 189,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: allProducts.map(
                (e) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    clipBehavior: Clip.antiAlias,
                    width: 200,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF8F9FE),
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.asset(
                          "assets/image.png",
                          height: 120,
                          fit: BoxFit.fill,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e['name'],
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      height: 12 / 16,
                                    ),
                              ),
                              const Gap(4),
                              Text(
                                e['price'],
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      height: 1,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ).toList(),
            ),
          ),
          const Gap(40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "For this summer",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextButton(
                child: const Text(
                  "See more",
                  style: TextStyle(
                    color: Color(0xFF006FFD),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(
            height: 189,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: allProducts.map((e) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  clipBehavior: Clip.antiAlias,
                  width: 200,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF8F9FE),
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset(
                        "assets/image.png",
                        height: 120,
                        fit: BoxFit.fill,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e['name'],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(height: 12 / 16),
                            ),
                            const Gap(4),
                            Text(
                              e['price'],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    height: 1,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
