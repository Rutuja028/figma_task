import 'package:flutter/material.dart';

import 'package:figma_task/views/feedback_page.dart';
import '../components/elevated_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

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
        indicatorShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
                "assets/inbox.svg",
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
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(39),
          child: Container(
            width: 343,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFF8F9FE),
              borderRadius: BorderRadius.circular(16),
            ),
            child: TabBar(
              indicator: const BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
                color: Colors.white,
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              dividerHeight: 39,
              splashBorderRadius: BorderRadius.circular(12),
              dividerColor: const Color(0xFFF8F9FE),
              controller: _myTabController,
              tabs: const [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "To do",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "In progress",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "Finished",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
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
            icon: const Icon(
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/project_image.png", height: 100, width: 100),
            const Gap(32),
            const Center(
              child: Text(
                "Nothing here. For now.",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const Gap(8),
            const Center(
              child: Text(
                "This is where you’ll find your\nfinished projects.",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF71727A),
                ),
              ),
            ),
            const Gap(32),
            PrimaryButton(
              buttonText: 'Start a project',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProjFeedback(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
