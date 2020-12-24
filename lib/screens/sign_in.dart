import 'package:flutter/material.dart';
import 'package:ecommerce_app/services/auth.dart';
import 'package:ecommerce_app/screens/loading.dart';
import 'package:ecommerce_app/shared/constants.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.blue[100],
            appBar: AppBar(
              backgroundColor: Colors.blue[400],
              elevation: 0.0,
              title: Text('Sign in'),
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 120.0,
                      ),
                      Center(
                        child: Stack(
                          children: [
                            Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Icon(
                              Icons.shopping_basket,
                              size: 100.0,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Email'),
                        validator: (val) =>
                            val.isEmpty ? 'Enter an email' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Password'),
                        validator: (val) => val.length < 8
                            ? 'Enter a password 8+ characters long'
                            : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            color: Color(0xFF00A9F8),
                            child: Text('Sign in'),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                setState(() => loading = true);
                                dynamic result =
                                    await _auth.signInWithEmailAndPassword(
                                        email, password);
                                if (result == null) {
                                  setState(() {
                                    error = 'Error signing in';
                                    loading = false;
                                  });
                                }
                              }
                            },
                          ),
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            color: Color(0xFF00A9F8),
                            child: Text('Register'),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                setState(() => loading = true);
                                dynamic result =
                                    await _auth.registerWithEmailAndPassword(
                                        email, password);
                                if (result == null) {
                                  setState(() {
                                    error = 'Please supply a valid email';
                                    loading = true;
                                  });
                                }
                              }
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        error,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
