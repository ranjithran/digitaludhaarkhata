import 'package:digitaludhaarkhata/models/widgets/Details.dart';
import 'package:digitaludhaarkhata/models/widgets/HeaderWidget.dart';
import 'package:flutter/material.dart';

class CustomerBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 0,
              child: Container(
                child: HeaderWidget(),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Details(),
              ),
            )
          ],
        ),
      
    );
  }
}
