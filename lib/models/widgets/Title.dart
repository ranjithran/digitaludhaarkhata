import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class TitleMain extends StatelessWidget {
  final String title;

  const TitleMain({Key key,@required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(60),
          letterSpacing: 2,
          fontWeight: FontWeight.w800,
        ),
      ).tr(context:context),
    );
  }
}
