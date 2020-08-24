import 'package:flutter/material.dart';
import 'package:practice_flutter/tabClassOne.dart';
import 'package:practice_flutter/tabClassTwo.dart';

class ControllerThreeClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [Colors.purple, Colors.black,],
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
            )),
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.camera),
              ),
              Tab(
                icon: Icon(Icons.message),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TabOne(),
            TabTwo(),
          ],
        ),
      ),
    );
  }
}
