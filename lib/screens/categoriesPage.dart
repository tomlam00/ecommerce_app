import 'package:ecommerce_app/screens/commonWidget.dart';
import 'package:flutter/material.dart';
import 'categoriesGrid.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app/services/database.dart';
import 'package:ecommerce_app/models/model.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<ModelData>>.value(
      value: DatabaseService().models,
      child: Column(
        children: <Widget>[
          topBar('Categories'),
          Expanded(
            child: CategoriesGrid(),
          ),
        ],
      ),
    );
  }
}
