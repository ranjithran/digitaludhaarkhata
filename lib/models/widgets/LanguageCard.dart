import 'package:digitaludhaarkhata/Services/Locator.dart';
import 'package:digitaludhaarkhata/Services/NavigationServices.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:digitaludhaarkhata/routes/routename.dart' as routeNames;

class LanguageCard extends StatelessWidget {
  final String languagename;
  final IconData icon;
  final int language;
  const LanguageCard(
      {Key key, @required this.languagename, this.icon, this.language})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        EasyLocalization.of(context).locale =
            EasyLocalization.of(context).supportedLocales[language];
        locator<NavigationService>().navigateTo(routeNames.signup);
      },
      child: Container(
        height: ScreenUtil().setHeight(160),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Card(
                  elevation: 2,
                  color: Colors.white10.withAlpha(700),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  child: Icon(icon, size: ScreenUtil().setSp(100))),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                languagename,
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(50),
                    fontWeight: FontWeight.w700),
              ).tr(context: context),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(right: 30),
                child: Icon(Icons.done),
              ),
            )
          ],
        ),
      ),
    );
  }
}
