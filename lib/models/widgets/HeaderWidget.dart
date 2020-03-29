import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(70),
      child: Row(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "ENTRIES",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(30),
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w400),
                ).tr(context: context),
              )),
          Expanded(
              child: Container(
            alignment: Alignment.centerRight,
            child: Text(
              "YOU GAVE",
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(30),
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w400),
            ).tr(context:context),
          )),
          Expanded(
              child: Container(
                  padding: EdgeInsets.only(right: 10),
                  alignment: Alignment.centerRight,
                  child: Text(
                    "YOU GOT",
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(30),
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w400),
                  ).tr(context:context))),
        ],
      ),
    );
  }
}
