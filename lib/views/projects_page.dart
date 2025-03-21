import 'package:flutter/material.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  State createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
