import 'package:ecommerce_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ecommerce_app/screens/homePage.dart';
import 'package:ecommerce_app/screens/categoriesPage.dart';
import 'package:ecommerce_app/screens/cartPage.dart';
import 'package:ecommerce_app/screens/likedPage.dart';
import 'package:ecommerce_app/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app/models/user.dart';
import 'package:ecommerce_app/screens/personalPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        home: Wrapper(),
      ),
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
        length: 5,
        child: Scaffold(
          body: TabBarView(
            children: <Widget>[
              HomePage(),
              CategoriesPage(),
              CartPage(),
              LikedPage(),
              PersonalPage()
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
                Tab(
                    icon: Icon(Icons.person, color: Color(0xFF00A9F8)),
                    text: 'Personal')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
