import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app/models/data.dart';

class DataList extends StatefulWidget {
  @override
  _DataListState createState() => _DataListState();
}

class _DataListState extends State<DataList> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<List<Data>>(context) ?? [];
    data.forEach((d) {
      print(d.name);
      print(d.cart);
      print(d.liked);
    });
  }
}
