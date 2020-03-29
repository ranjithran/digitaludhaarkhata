import 'package:digitaludhaarkhata/Services/Locator.dart';
import 'package:digitaludhaarkhata/Services/NavigationServices.dart';
import 'package:digitaludhaarkhata/models/Data/CustomerData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:digitaludhaarkhata/routes/routename.dart' as routeNames;

class DetailsCard extends StatelessWidget {
  final String datetime;
  final int gave;
  final int got;
  final int id;
  const DetailsCard({Key key, this.datetime, this.gave, this.got, this.id})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => locator<NavigationService>().navigateToWithArguments(
          routeNames.details,
          new CustomerEntriesDeatils(
              datetime, gave==0 ? got : gave)),
      child: Card(
        child: Container(
          height: ScreenUtil().setHeight(120),
          child: Row(
            children: <Widget>[
              Expanded(
                  flex: 0,
                  child: Container(
                      padding: EdgeInsets.only(left: 10),
                      alignment: Alignment.center,
                      child: Text(datetime))),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.only(left: 50),
                      color: Colors.redAccent.shade100.withOpacity(0.4),
                      padding: EdgeInsets.only(right: 10),
                      alignment: Alignment.centerRight,
                      child: Text("$gave",style: TextStyle(
                            fontSize: ScreenUtil().setSp(40),
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.4),))),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.only(left: 50),
                      color: Colors.greenAccent.shade100.withOpacity(0.4),
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: 10),
                      child: Text(
                        "$got",
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(40),
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.4),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
