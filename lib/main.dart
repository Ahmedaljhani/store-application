import 'package:first_class/posts_screen.dart';
import 'package:first_class/product_screen.dart';
import 'package:first_class/productdetiles_screen.dart';
import 'package:first_class/profile_screen.dart';
import 'package:first_class/provider/category_provider.dart';
import 'package:first_class/provider/productEc_provider.dart';
import 'package:first_class/provider/productMan_provider.dart';
import 'package:first_class/provider/productcat_provider.dart';
import 'package:first_class/provider/productdet_provider.dart';
import 'package:first_class/provider/productjew_provider.dart';
import 'package:first_class/provider/products_provider.dart';
import 'package:first_class/provider/productsdatabase_provider.dart';
import 'package:first_class/store_screen.dart';
import 'package:first_class/wall_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

import 'category_screen.dart';
import 'login_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => ProductsProvider()),
        ChangeNotifierProvider(create: (_) => ProductCatProvider()),
        ChangeNotifierProvider(create: (_) => ProductDetProvider()),
        ChangeNotifierProvider(create: (_) => ProductJewProvider()),
        ChangeNotifierProvider(create: (_) => ProductEcProvider()),
        ChangeNotifierProvider(create: (_) => ProductManProvider()),
        ChangeNotifierProvider(create: (_) => ProductsDataBBaseProvider())
      ],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue),
        home: AnimatedSplashScreen(
          backgroundColor: Colors.blue,
          duration: 1000,
          splash: Icons.shopping_cart_outlined,
          splashIconSize: 100,
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.rightToLeftWithFade,
          nextScreen: LoginTest(),
          // splashTransition: SplashTransition.rotationTransition,
          // pageTransitionType: PageTransitionType.scale,
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Store App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    StoreScreen(),
    CategoryScreen(),
    WallScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: TextStyle(
          color: Colors.white,
        ),
        unselectedLabelStyle: TextStyle(color: Colors.red),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(
              Icons.category,
              color: Colors.white,
            ),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            label: 'Cart',
          ),
          const BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
