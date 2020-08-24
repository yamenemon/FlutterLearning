import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:practice_flutter/data.dart';

class Receive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final providerData =  Provider.of<Data>(context);



    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Center(
        child: Column(
          children: [
            Text(providerData.value.toString(), style: TextStyle(fontSize: 70),),
            Text(providerData.value.toString(), style: TextStyle(fontSize: 70),),
          ],
        ),

      ),
    );
  }
}
