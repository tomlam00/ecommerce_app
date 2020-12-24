import 'package:ecommerce_app/screens/itemPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ecommerce_app/models/model.dart';
import 'package:provider/provider.dart';

class ItemListView extends StatefulWidget {
  @override
  _ItemListViewState createState() => _ItemListViewState();
}

class _ItemListViewState extends State<ItemListView> {
  @override
  Widget build(BuildContext context) {
    final items = Provider.of<List<ModelData>>(context);
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.only(
          top: 0,
        ),
        itemCount: items == null ? 0 : items.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ItemPage(
                  model: items[index],
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
                          tag: items[index].name,
                          child: Material(
                            color: Colors.transparent,
                            child: Text(
                              items[index].name,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        Hero(
                          tag: items[index].price,
                          child: Material(
                            color: Colors.transparent,
                            child: Text(
                              '\$${items[index].price.toString()}',
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
                    tag: items[index].imageUrl,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image(
                        width: 110,
                        image: AssetImage(
                          items[index].imageUrl,
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
}
