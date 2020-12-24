import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app/models/model.dart';

class CategoriesGrid extends StatefulWidget {
  @override
  _CategoriesGridState createState() => _CategoriesGridState();
}

class _CategoriesGridState extends State<CategoriesGrid> {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<List<ModelData>>(context);
    if (categories != null) {
      categories.sort((a, b) => a.mid.compareTo(b.mid));
    }

    return GridView.builder(
      padding: EdgeInsets.only(
        top: 0,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: categories == null ? 0 : categories.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.all(10),
          child: GestureDetector(
            onTap: () {
              print('Tapped ${categories[index].name}');
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Stack(
                children: <Widget>[
                  Hero(
                    tag: categories[index].imageUrl,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image(
                        height: 180.0,
                        width: 180.0,
                        image: AssetImage(categories[index].imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Text(
                      categories[index].name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        backgroundColor: Color.fromRGBO(255, 255, 255, 90),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
