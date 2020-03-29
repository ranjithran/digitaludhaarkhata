
import 'package:digitaludhaarkhata/models/widgets/LanguageCard.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import "package:digitaludhaarkhata/appData/AppData.dart" as lang;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LanguageMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // log(tr("title"), name: this.toString() );
    ScreenUtil.init(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 0,
                child: Container(
                  height: ScreenUtil().setHeight(700),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 20, top: 80),
                        child: Icon(
                          Icons.translate,
                          size: ScreenUtil().setSp(300),
                          color: Colors.black26.withAlpha(100),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "main1",
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(60),
                              fontWeight: FontWeight.w800),
                        ).tr(context: context),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, top: 5),
                        child: Text(
                          "main2",
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(48),
                              fontWeight: FontWeight.w300),
                        ).tr(context: context),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: ListView.builder(
                    itemCount: lang.languages.length,
                    itemBuilder: (context, _index) => Column(
                      children: <Widget>[
                        LanguageCard(
                          language: _index,
                          languagename: lang.languages[_index],
                          icon: MdiIcons.engineOutline,
                        ),
                        Divider()
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
