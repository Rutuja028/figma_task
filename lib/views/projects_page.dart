import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  State createState() => _ProjectsState();
}

class ProjectBottomNavigate {
  final Widget projectBottomPage;
  ProjectBottomNavigate(this.projectBottomPage);
}

class _ProjectsState extends State<Projects> {
  int _selectedInd = 0;
  void _onProjecTapped(int ind) {
    setState(() {
      _selectedInd = ind;

      Navigator.replace(context,
          oldRoute: ModalRoute.of(context)!,
          newRoute: MaterialPageRoute(
              builder: (context) => pageList[ind].projectBottomPage));
    });
  }

  List<ProjectBottomNavigate> pageList = [
    ProjectBottomNavigate(Container()),
    ProjectBottomNavigate(Container()),
    ProjectBottomNavigate(Container()),
    ProjectBottomNavigate(Container()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        elevation: 0,
        onDestinationSelected: _onProjecTapped,
        selectedIndex: _selectedInd,
        backgroundColor: Colors.white,
        indicatorColor: Colors.white,
        destinations: <Widget>[
          NavigationDestination(
            icon: SvgPicture.asset(
              "assets/explore.svg",
              colorFilter:
                  const ColorFilter.mode(Color(0xFFD4D6DD), BlendMode.srcIn),
            ),
            selectedIcon: SvgPicture.asset(
              "assets/explore.svg",
              colorFilter:
                  const ColorFilter.mode(Color(0xFF006FFD), BlendMode.srcIn),
            ),
            label: 'Explore',
          ),
          NavigationDestination(
              icon: SvgPicture.asset(
                "assets/projects.svg",
                colorFilter:
                    const ColorFilter.mode(Color(0xFFD4D6DD), BlendMode.srcIn),
              ),
              selectedIcon: SvgPicture.asset(
                "assets/projects.svg",
                colorFilter:
                    const ColorFilter.mode(Color(0xFF006FFD), BlendMode.srcIn),
              ),
              label: 'Projects'),
          NavigationDestination(
              icon: SvgPicture.asset(
                "assets/inbpx.svg",
                colorFilter:
                    const ColorFilter.mode(Color(0xFFD4D6DD), BlendMode.srcIn),
              ),
              selectedIcon: SvgPicture.asset(
                "assets/inbox.svg",
                colorFilter:
                    const ColorFilter.mode(Color(0xFF006FFD), BlendMode.srcIn),
              ),
              label: 'Inbox'),
          NavigationDestination(
              icon: SvgPicture.asset(
                "assets/friends.svg",
                colorFilter:
                    const ColorFilter.mode(Color(0xFFD4D6DD), BlendMode.srcIn),
              ),
              selectedIcon: SvgPicture.asset(
                "assets/friends.svg",
                colorFilter:
                    const ColorFilter.mode(Color(0xFF006FFD), BlendMode.srcIn),
              ),
              label: 'Profile')
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Projects",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search_outlined,
              color: Color(0xFF006FFD),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          TabBarView(
            children: const <Widget>[
              Center(
                child: Text("It's cloudy here"),
              ),
              Center(
                child: Text("It's rainy here"),
              ),
              Center(
                child: Text("It's sunny here"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
