import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Colors.blue, Colors.blue, Colors.black],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        )),
      ),
      SafeArea(
        child: Container(
          width: 200.0,
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              DrawerHeader(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage: NetworkImage(
                        "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg"),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Eren Jager",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ],
              )),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      onTap: () {},
                      leading: Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Home",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Settings",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Log out",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      TweenAnimationBuilder(
        tween: Tween<double>(begin: 0,  end: value), 
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
        builder: (_,double val, __){
          return(
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..setEntry(0, 3, 200*val)
              ..rotateY((pi/6)* val),
              child: Scaffold(
                appBar: AppBar(
                  title: Text("RAAAAAAAAAAAAAA"),
                ),
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Swipe"),
                      ElevatedButton(
                        onPressed: (){},
                        child: Text("Press me")
                        )
                    ],
                  ),
                ),
              ),)
            );
          }
        ),
        GestureDetector(
          onHorizontalDragUpdate: (e){
            if(e.delta.dx > 0){
              setState(() {
                value = 1;
              });
            }else{
              setState(() {
                value = 0;
              });
            }
          },
         /* onTap: (){
            setState((){
              value == 0 ? value = 1 : value = 0;
            });
          },*/
        )
    ]));
  }
}
