import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'homePage.dart';
import 'categoriesPage.dart';
import 'cartPage.dart';
import 'likedPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            children: <Widget>[
              HomePage(),
              CategoriesPage(),
              CartPage(),
              LikedPage(),
            ],
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: Color(0xFFA8E3FF),
            ),
            height: 65,
            child: TabBar(
              labelColor: Color(0xFF00A9F8),
              tabs: [
                Tab(
                    icon: Icon(Icons.home, color: Color(0xFF00A9F8)),
                    text: 'Home'),
                Tab(
                    icon: Icon(Icons.apps, color: Color(0xFF00A9F8)),
                    text: 'Categories'),
                Tab(
                    icon: Icon(Icons.shopping_cart, color: Color(0xFF00A9F8)),
                    text: 'Cart'),
                Tab(
                    icon: Icon(Icons.favorite, color: Color(0xFF00A9F8)),
                    text: 'Liked'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
