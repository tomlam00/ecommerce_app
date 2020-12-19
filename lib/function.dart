import 'package:ecommerce_app/itemPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'itemPage.dart';

Expanded createListView(List list) {
  return Expanded(
    child: ListView.builder(
      padding: EdgeInsets.only(
        top: 0,
      ),
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ItemPage(
                model: list[index],
              ),
            ),
          ),
          child: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Hero(
                        tag: list[index].name,
                        child: Material(
                          color: Colors.transparent,
                          child: Text(
                            list[index].name,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Hero(
                        tag: list[index].price,
                        child: Material(
                          color: Colors.transparent,
                          child: Text(
                            '\$${list[index].price.toString()}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 20.0,
                top: 25.0,
                bottom: 15.0,
                child: Hero(
                  tag: list[index].imageUrl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image(
                      width: 110,
                      image: AssetImage(
                        list[index].imageUrl,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}

Route createRoute(Widget widget) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => widget,
    transitionDuration: Duration(milliseconds: 1000),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 2.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Container topBar(String title) {
  return Container(
    alignment: Alignment.centerLeft,
    padding: EdgeInsets.fromLTRB(20.0, 50.0, 0.0, 20.0),
    child: Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: 30,
      ),
    ),
  );
}
