import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
