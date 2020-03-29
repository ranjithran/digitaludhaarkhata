import 'package:digitaludhaarkhata/models/widgets/Title.dart';
import 'package:digitaludhaarkhata/models/widgets/icontexticon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_share_me/flutter_share_me.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:easy_localization/easy_localization.dart';

class DetailsView extends StatelessWidget {
  final String datetime;
  final int money;

  const DetailsView({Key key, this.datetime, this.money}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          color: Colors.white10,
          height: ScreenUtil().setHeight(500),
          child: Column(
            children: <Widget>[
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  FlutterShareMe()
                      .shareToWhatsApp(base64Image: "ran", msg: datetime + " " + money.toString());
                },
                child: IconTextIcon(
                  icon: MdiIcons.whatsapp,
                  label: "Share On WhatsApp",
                ),
              )),
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  FlutterShareMe()
                      .shareToSystem(msg: datetime + " " + money.toString());
                },
                child: IconTextIcon(
                  icon: MdiIcons.share,
                  label: "Share",
                ),
              )),
              Expanded(
                child: InkWell(
                  onTap: (){
                    
                  },
                                  child: Card(
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.redAccent,
                      child: Text(
                        "DELETE TRANSACTION",
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(45),
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            letterSpacing: 1.9),
                      ).tr(context: context),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          // title: TitleMain(title: money),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Card(
                elevation: 5,
                child: Container(
                  alignment: Alignment.center,
                  height: ScreenUtil().setHeight(400),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextField(
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: ScreenUtil().setSp(70),
                              letterSpacing: 1.2),
                          // autocorrect: true,
                          readOnly: true,
                          decoration: InputDecoration(
                            hintText: '$money',
                            hintStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w900,
                                fontSize: ScreenUtil().setSp(70),
                                letterSpacing: 1.2),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          )),
                      Text(
                        "Added On {}",
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(40),
                            fontWeight: FontWeight.w500),
                      ).tr(args: [datetime], context: context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
