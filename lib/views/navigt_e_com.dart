import 'package:figma_task/views/e_commerce_pg1.dart';
import 'package:figma_task/views/your_bag_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EcomBottomNavBar extends StatefulWidget {
  const EcomBottomNavBar({super.key});

  @override
  State<EcomBottomNavBar> createState() => _EcomBottomNavBarState();
}

class _EcomBottomNavBarState extends State<EcomBottomNavBar> {
  List<Widget> pageList = [
    const ECommercePg1(),
    const Center(child: Text(" Categories Page")),
    const Center(child: Text(" Store Page")),
    const Center(child: Text(" Profile Page")),
  ];

  int _selectedInd = 0;
  void _onChatTapped(int ind) {
    setState(
      () {
        _selectedInd = ind;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        elevation: 0,
        onDestinationSelected: _onChatTapped,
        selectedIndex: _selectedInd,
        backgroundColor: Colors.white,
        indicatorColor: Colors.white,
        destinations: <Widget>[
          const NavigationDestination(
            icon: Icon(
              Icons.explore,
              color: Color(0xFFD4D6DD),
            ),
            selectedIcon: Icon(
              Icons.explore,
              color: Color(0xFF006FFD),
            ),
            label: 'Explore',
          ),
          const NavigationDestination(
            icon: Icon(
              Icons.category,
              color: Color(0xFFD4D6DD),
            ),
            selectedIcon: Icon(
              Icons.category,
              color: Color(0xFF006FFD),
            ),
            label: 'Categories',
          ),
          const NavigationDestination(
            icon: Icon(
              Icons.store,
              color: Color(0xFFD4D6DD),
            ),
            selectedIcon: Icon(
              Icons.store,
              color: Color(0xFF006FFD),
            ),
            label: 'Stores',
          ),
          NavigationDestination(
            icon: SvgPicture.asset(
              "assets/friends.svg",
              colorFilter: const ColorFilter.mode(
                Color(0xFFD4D6DD),
                BlendMode.srcIn,
              ),
            ),
            selectedIcon: SvgPicture.asset(
              "assets/friends.svg",
              colorFilter: const ColorFilter.mode(
                Color(0xFF006FFD),
                BlendMode.srcIn,
              ),
            ),
            label: 'Profile',
          ),
        ],
      ),
      appBar: AppBar(
        surfaceTintColor: Colors.white,
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
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const YourBag(),
                ),
              );
            },
            child: SvgPicture.asset(
              "assets/shopping_bag_outlined.svg",
              colorFilter:
                  const ColorFilter.mode(Colors.black, BlendMode.srcIn),
              height: 24,
            ),
          ),
        ],
      ),
      body: pageList[_selectedInd],
    );
  }
}
