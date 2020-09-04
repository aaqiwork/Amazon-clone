import 'package:amazon/UI/product_list.dart';
import 'package:amazon/UI/tab_drawer.dart';
import 'package:amazon/UI/top_bar.dart';
import 'package:amazon/models/global.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Map<int, Color> color = {
    50: Color.fromRGBO(136, 14, 79, .1),
    100: Color.fromRGBO(136, 14, 79, .2),
    200: Color.fromRGBO(136, 14, 79, .3),
    300: Color.fromRGBO(136, 14, 79, .4),
    400: Color.fromRGBO(136, 14, 79, .5),
    500: Color.fromRGBO(136, 14, 79, .6),
    600: Color.fromRGBO(136, 14, 79, .7),
    700: Color.fromRGBO(136, 14, 79, .8),
    800: Color.fromRGBO(136, 14, 79, .9),
    900: Color.fromRGBO(136, 14, 79, 1),
  };
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFFFFFFFF, color),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(child: DrawerTab()),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                //alignment: Alignment.center,
                child: Row(
                  children: <Widget>[
                    Container(
                      
                      width: 100,
                      child: Image(
                          image:
                              AssetImage('lib/assets/amazon-logo-white.png')),
                    ),
                  ],
                ),
              ),
              
              Container(
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.shopping_cart, color: Colors.black),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.search, color: Colors.black),
                      onPressed: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        body: Container(
            constraints: BoxConstraints.expand(),
            color: Colors.grey,
            child: Column(
              children: <Widget>[
                //TopBar(),
               
                Container(
                  height: MediaQuery.of(context).size.height-80,
                  child: ProductList(),
                )
              ],
            )));
  }
}
