import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State createState() => _ProjectsState();
}

class ProjectBottomNavigate {
  final Widget projectBottomPage;
  ProjectBottomNavigate(this.projectBottomPage);
}

class _ProjectsState extends State<Projects>
    with SingleTickerProviderStateMixin {
  late TabController _myTabController;
  int _selectedInd = 0;

  @override
  void initState() {
    super.initState();
    _myTabController = TabController(length: 3, vsync: this);
  }

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
        bottom: TabBar(
          controller: _myTabController,
          tabs: const [
            Text("To do"),
            Text("In progress"),
            Text("Finished"),
          ],
        ),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset("project_image.png"),
            const Center(
              child: Text(
                "Nothing here. For now.",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const Center(
              child: Text(
                "This is where you’ll find your finished projects.",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF71727A),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _ProjectsState newMethod() => this;
}
