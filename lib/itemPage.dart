import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'data.dart';

class ItemPage extends StatefulWidget {
  final Model model;

  ItemPage({this.model});

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    final _alreadySaved = saved.contains(widget.model);
    final _alreadyInCart = cart.contains(widget.model);

    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Hero(
                  tag: widget.model.imageUrl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image(
                      image: AssetImage(widget.model.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      iconSize: 30.0,
                      color: Colors.black,
                      onPressed: () => Navigator.pop(context),
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.add_shopping_cart),
                          iconSize: 30.0,
                          color: Colors.black,
                          onPressed: () {
                            setState(() {
                              if (_alreadyInCart) {
                                cart.remove(widget.model);
                              } else {
                                cart.add(widget.model);
                              }
                            });
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            _alreadySaved
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: _alreadySaved ? Colors.red : null,
                          ),
                          iconSize: 30.0,
                          color: Colors.black,
                          onPressed: () {
                            setState(() {
                              if (_alreadySaved) {
                                saved.remove(widget.model);
                              } else {
                                saved.add(widget.model);
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Hero(
                  tag: widget.model.name,
                  child: Material(
                    color: Colors.transparent,
                    child: Text(
                      widget.model.name,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Hero(
                  tag: widget.model.price,
                  child: Material(
                    color: Colors.transparent,
                    child: Text(
                      '\$${widget.model.price.toString()}',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
