import 'package:flutter/material.dart';
import 'data.dart';
import 'function.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        topBar('Cart'),
        createListView(cart),
      ],
    );
  }
}
