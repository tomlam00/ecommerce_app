import 'package:ecommerce_app/main.dart';
import 'package:ecommerce_app/screens/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/user.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    if (user == null) {
      return Authenticate();
    } else {
      return MainPage();
    }
  }
}
