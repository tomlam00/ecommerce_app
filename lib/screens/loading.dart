import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFA8E3FF),
      child: Center(
        child: SpinKitFadingCube(
          color: Color(0xFF00A9F8),
          size: 50.0,
        ),
      ),
    );
  }
}
