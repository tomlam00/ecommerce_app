import 'package:flutter/material.dart';
import 'function.dart';
import 'data.dart';

class LikedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        topBar('Liked'),
        createListView(saved),
      ],
    );
  }
}
