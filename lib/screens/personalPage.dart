import 'package:flutter/material.dart';
import 'package:ecommerce_app/services/auth.dart';
import 'commonWidget.dart';

class PersonalPage extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        topBar('Personal'),
        Expanded(
          child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Color(0xFF00A9F8),
                onPressed: () async {
                  await _auth.signOut();
                },
                child: Text('Logout'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
