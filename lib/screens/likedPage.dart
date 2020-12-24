import 'package:flutter/material.dart';
import 'package:ecommerce_app/screens/commonWidget.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app/services/database.dart';
import 'package:ecommerce_app/models/model.dart';
import 'itemListView.dart';

class LikedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<ModelData>>.value(
      value: DatabaseService().models,
      child: Column(
        children: <Widget>[
          topBar('Liked'),
          ItemListView(),
        ],
      ),
    );
  }
}
