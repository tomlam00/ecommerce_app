import 'package:ecommerce_app/function.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'data.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        topBar('Categories'),
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.only(
              top: 0,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: models.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () {
                    print('Tapped ${models[index].name}');
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Stack(
                      children: <Widget>[
                        Hero(
                          tag: models[index].imageUrl,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image(
                              height: 180.0,
                              width: 180.0,
                              image: AssetImage(models[index].imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 20,
                          left: 20,
                          child: Text(
                            models[index].name,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              backgroundColor:
                                  Color.fromRGBO(255, 255, 255, 90),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
