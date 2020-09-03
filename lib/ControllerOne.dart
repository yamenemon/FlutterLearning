import 'package:flutter/material.dart';

class ControllerOneClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: Container(
          padding: EdgeInsets.all(20), // CONTENTS WILL TAKE 20 PIXEL SPACE IN ALL SIDE BEFORE SUBVIEW IN THE CONTAINER =====> IMPORTANT !!!
          margin: EdgeInsets.all(10), //CONTAINER ITSELF WILL TAKE 10 PIXEL SPACE IN ALL SIDE BEFORE SUBVIEW IN THE SCAFFOLD =====> IMPORTANT !!!
          color: Colors.yellow,
          child: Column(
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Top",
                    style:
                        TextStyle(backgroundColor: Colors.white, fontSize: 36,fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
