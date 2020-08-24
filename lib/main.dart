import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:practice_flutter/ControllerOne.dart';
import 'package:practice_flutter/ControllerThree.dart';
import 'package:practice_flutter/ControllerTwo.dart';
import 'package:practice_flutter/data.dart';
import 'package:practice_flutter/tabClassOne.dart';
import 'package:practice_flutter/tabClassTwo.dart';
import 'package:provider/provider.dart';
import 'package:practice_flutter/Receive.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Data(),
    child: MyMainApp()
  )
  );
}

class MyMainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ImagePickerExample());
  }
}

class ImagePickerExample extends StatefulWidget {
  @override
  _ImagePickerExampleState createState() => _ImagePickerExampleState();
}

class _ImagePickerExampleState extends State<ImagePickerExample> {

  File selectedImage;

  final picker = ImagePicker();

  Future getImageUsingPicker(int buttonTag) async {
    var imageType = ImageSource.camera;
    if (buttonTag == 2){
      imageType = ImageSource.gallery;
    }
    final pickedFile = await picker.getImage(source: imageType);

    setState(() {
      selectedImage = File(pickedFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Photo Selection"),
      ),
      body: Column(
        children: [
          Divider(color: Colors.white,height: 10,),
          Container(
            height: MediaQuery.of(context).size.height /2,
            width: double.infinity,
            color: Colors.blue,
            child: selectedImage == null ? Center(child: Text("No Image Selected", style: TextStyle(fontSize: 15,color: Colors.redAccent))) : Image.file(selectedImage),
          ),
          Divider(color: Colors.white,height: 50,),
          Divider(color: Colors.white,height: 50,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(onPressed: (){
                getImageUsingPicker(1);
              },child: Icon(Icons.camera),),
              SizedBox(width: 20,),
              FloatingActionButton(onPressed: (){
                getImageUsingPicker(2);
              },child: Icon(Icons.photo_library),)

            ],
          ),
        ],
      ),
    );
  }
}










class StateManagementProvider extends StatefulWidget {
  @override
  _StateManagementProviderState createState() => _StateManagementProviderState();
}

class _StateManagementProviderState extends State<StateManagementProvider> {

  @override
  Widget build(BuildContext context) {
    final providerData =  Provider.of<Data>(context);
//    final provideData = Provider.of(context);
    int rootClassValue = 100;
    return SafeArea(child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(providerData.value.toString(),style: TextStyle(fontSize: 50),),
            RaisedButton(
              onPressed: (){
                providerData.increment();
              },
            ),
            RaisedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Receive()));
              },
            )
          ],
        ),
      ),
    ));
  }
}

class TopTabbarController extends StatefulWidget {
  @override
  _TopTabbarControllerState createState() => _TopTabbarControllerState();
}

class _TopTabbarControllerState extends State<TopTabbarController> {
  var tabIndex = 0;

  final pages = [
    ControllerOneClass(),
    ControllerTwoClass(),
    ControllerThreeClass(),
    ControllerTwoClass(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            showUnselectedLabels: true,
            currentIndex: tabIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                backgroundColor: Colors.redAccent,
                label: "Add",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.ac_unit),
                label: "Call",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_a_photo),
                label: "Fuck",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.build),
                label: "Suck",
              ),
            ],
            onTap: (index) {
              setState(() {
                tabIndex = index;
              });
            },
          ),
          body: pages[tabIndex],
        ),
    );
  }
}



class TabbarExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomHomePage(),
    );
  }
}

class BottomHomePage extends StatefulWidget {
  @override
  _BottomHomePageState createState() => _BottomHomePageState();
}

class _BottomHomePageState extends State<BottomHomePage> {
  var tabIndex = 0;

  final pages = [
    ControllerThreeClass(),
    ControllerTwoClass(),
    ControllerThreeClass(),
    ControllerTwoClass(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Tab bar Example"),
            centerTitle: true,
            leading: Icon(Icons.add),
            elevation: 10,
            actions: [
              IconButton(
                icon: Icon(Icons.add_a_photo),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.ac_unit),
                onPressed: () {},
              )
            ],
          ),
        backgroundColor: Colors.purple,
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          selectedFontSize: 20,
          currentIndex: tabIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              backgroundColor: Colors.redAccent,
              label: "Add",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit),
              label: "Call",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_a_photo),
              label: "Fuck",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.build),
              label: "Suck",
            ),
          ],
          onTap: (index) {
            setState(() {
              tabIndex = index;
            });
          },
        ),
        body: pages[tabIndex],
      ),
    ));
  }
}

class HeroWidgetExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width / 2,
          color: Colors.cyan,
          child: CircleAvatar(
            radius: 50,
            child: GestureDetector(
              child: Hero(
                tag: "Add",
                child: Icon(
                  Icons.add_alarm,
                  size: 30,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ControllerThreeClass()));
              },
            ),
          ),
        ),
      ),
    );
  }
}

class PageViewExample extends StatefulWidget {
  @override
  _PageViewExampleState createState() => _PageViewExampleState();
}

class _PageViewExampleState extends State<PageViewExample> {
  PageController _controller = PageController(
    initialPage: 2,
  );
  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PageView(
          controller: _controller,
          scrollDirection: Axis.vertical,
          children: [
            ControllerOneClass(),
            ControllerTwoClass(),
            ControllerThreeClass(),
          ],
        ),
      ),
    );
  }
}

class ExpandedWidgetExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.cyan,
                )),
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.green,
                )),
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.redAccent,
                )),
          ],
        ),
      ),
    );
  }
}

class CardGridExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var containerHeight = MediaQuery.of(context).size.height / 3;
    var containerWidth = MediaQuery.of(context).size.width / 3;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        /*
        body: Center(
          child: Card(
            elevation: 10,
            shadowColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Container(
              height: 200,
              width: 200,
            )
          ),
        ),
        */
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: GridView.count(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: [
              Container(
                color: Colors.redAccent,
                height: containerHeight,
                width: containerWidth,
              ),
              Container(
                color: Colors.redAccent,
                height: containerHeight,
                width: containerWidth,
              ),
              Container(
                color: Colors.redAccent,
                height: containerHeight,
                width: containerWidth,
              ),
              Container(
                color: Colors.redAccent,
                height: containerHeight,
                width: containerWidth,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LiquidSwipeContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var containerHeight = MediaQuery.of(context).size.height / 2;
    var containerWidth = MediaQuery.of(context).size.width / 2;

    final pages = [
      Container(
        color: Colors.redAccent,
        height: containerHeight,
        width: containerWidth,
      ),
      Container(
        color: Colors.yellow,
        height: containerHeight,
        width: containerWidth,
      ),
      Container(
        color: Colors.cyan,
        height: containerHeight,
        width: containerWidth,
      ),
      Container(
        color: Colors.pink,
        height: containerHeight,
        width: containerWidth,
      ),
    ];
    return MaterialApp(
      home: Scaffold(
        body: LiquidSwipe(
          pages: pages,
        ),
      ),
    );
  }
}

class LiquidSwipeExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var containerHeight = MediaQuery.of(context).size.height / 2;
    var containerWidth = MediaQuery.of(context).size.width / 2;

    final pages = [
      Container(
        color: Colors.redAccent,
        height: containerHeight,
        width: containerWidth,
      ),
      Container(
        color: Colors.yellow,
        height: containerHeight,
        width: containerWidth,
      ),
      Container(
        color: Colors.cyan,
        height: containerHeight,
        width: containerWidth,
      ),
      Container(
        color: Colors.pink,
        height: containerHeight,
        width: containerWidth,
      ),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width / 2,
            color: Colors.cyan,
            child: LiquidSwipe(
              pages: pages,
            ),
//            LiquidSwipe(pages: pages),
          ),
        ),
      ),
    );
  }
}

class LstViewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView(
          children: [
            ListTile(
              selected: true,
              selectedTileColor: Colors.brown,
              tileColor: Colors.black,
              title: Text("First Title Cell"),
              subtitle: Text("First Title Description"),
              leading: CircleAvatar(
                child: Icon(Icons.message),
                backgroundColor: Colors.pink,
              ),
              trailing: CircleAvatar(
                child: Icon(Icons.cake),
              ),
            ),
            ListTile(
              title: Text("First Title Cell"),
              subtitle: Text("First Title Description"),
              leading: CircleAvatar(
                child: Icon(Icons.message),
              ),
              trailing: CircleAvatar(
                child: Icon(Icons.cake),
              ),
            ),
            ListTile(
              title: Text("First Title Cell"),
              subtitle: Text("First Title Description"),
              leading: CircleAvatar(
                child: Icon(Icons.message),
              ),
              trailing: CircleAvatar(
                child: Icon(Icons.cake),
              ),
            ),
            ListTile(
              title: Text("First Title Cell"),
              subtitle: Text("First Title Description"),
              leading: CircleAvatar(
                child: Icon(Icons.message),
              ),
              trailing: CircleAvatar(
                child: Icon(Icons.cake),
              ),
            ),
            ListTile(
              title: Text("First Title Cell"),
              subtitle: Text("First Title Description"),
              leading: CircleAvatar(
                child: Icon(Icons.message),
              ),
              trailing: CircleAvatar(
                child: Icon(Icons.cake),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MediaQueryExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var containerHeight = MediaQuery.of(context).size.height / 3;
    var containerWidth = MediaQuery.of(context).size.width / 2;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            height: containerHeight,
            width: containerWidth,
            color: Colors.pink,
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Row Container"),
            centerTitle: true,
            leading: Icon(Icons.add),
            actions: [
              IconButton(
                icon: Icon(Icons.add_a_photo),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.ac_unit),
                onPressed: () {},
              )
            ],
          ),
          body: ListView(
            children: [
              Column(
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    color: Colors.red,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 200,
                    width: 200,
                    color: Colors.pink,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 200,
                    width: 200,
                    color: Colors.yellow,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SafeAreaWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Text(
              "Taking Scaffold in another widget name safe area.thats why content under status bar"),
        ),
      ),
    );
  }
}

class ContainerExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Container(
            height: 200,
            width: 200,
//            decoration: BoxDecoration(color: Colors.amber),
            color: Colors.red,
            child: Text(
              "I love body",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
