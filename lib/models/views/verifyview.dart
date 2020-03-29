import 'package:digitaludhaarkhata/Core/Auth/PhoneAuth.dart';
import 'package:digitaludhaarkhata/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:virtual_keyboard/virtual_keyboard.dart';
import 'package:easy_localization/easy_localization.dart';

class PhoneSignUp2 extends StatelessWidget {
  final String vID;
  PhoneSignUp2({Key key, this.vID}) : super(key: key);
  final TextEditingController _textEditingController = TextEditingController();
  final String _phonenumber = "+918801205949";

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(1000, 95, 44, 130),
                Color.fromARGB(1000, 85, 131, 232)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              //  stops: [0.2,0.6],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 14),
                height: ScreenUtil().setHeight(300),
                child: Text(
                  "verify",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(70),
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 2),
                ).tr(context: context),
              ),
              Container(
                padding: const EdgeInsets.only(left: 70),
                alignment: Alignment.centerLeft,
                child: Text(
                  "evc",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      letterSpacing: 3,
                      fontSize: ScreenUtil().setSp(50),
                      color: Colors.white),
                ).tr(context: context),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(40),
              ),
              Container(
                padding: const EdgeInsets.only(left: 70),
                alignment: Alignment.centerLeft,
                child: Text(
                  "pleaseevc",
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      letterSpacing: 1.4,
                      fontSize: ScreenUtil().setSp(38),
                      color: Colors.white),
                ).tr(context: context),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(15),
              ),
              Container(
                // padding: const EdgeInsets.only(left: 70),
                alignment: Alignment.center,
                child: Text(
                  "sentto",
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      letterSpacing: 1.4,
                      fontSize: ScreenUtil().setSp(38),
                      color: Colors.white),
                ).tr(args: [_phonenumber]),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(40),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(
                  left: 70,
                ),
                child: PinCodeTextField(
                  readonly: true,
                  controller: _textEditingController,
                  defaultBorderColor: Colors.transparent,
                  maxLength: 6,
                  pinTextStyle: TextStyle(
                      color: Colors.white, fontSize: ScreenUtil().setSp(60)),
                  hasTextBorderColor: Colors.transparent,
                  pinBoxColor: Colors.white24,
                  pinBoxHeight: ScreenUtil().setHeight(150),
                  pinBoxWidth: ScreenUtil().setWidth(100),
                ),
              ),
              Container(
                // padding: EdgeInsets.only(left: 75),
                alignment: Alignment.center,
                height: ScreenUtil().setHeight(100),
                child: Text(
                  "Didnt",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: ScreenUtil().setSp(
                      38,
                    ),
                  ),
                ).tr(context: context),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(80),
              ),
              Container(
                height: ScreenUtil().setHeight(100),
                width: ScreenUtil().setWidth(350),
                child: RaisedButton(
                  color: HexColor.fromHex("#e27dff"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 5,
                  onPressed: () async {
                    print("verfity");
                    print(vID);
                    await PhoneAuth().signIn(_textEditingController.text, vID);
                    // locator<NavigationService>().navigateTo(routeNames.home);
                  },
                  child: Text(
                    "continue",
                    style: TextStyle(color: Colors.white),
                  ).tr(context: context),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(100),
              ),
              Container(
                child: VirtualKeyboard(
                    type: VirtualKeyboardType.Numeric,
                    textColor: Colors.white,
                    fontSize: ScreenUtil().setSp(80),
                    height: ScreenUtil().setHeight(650),
                    onKeyPress: (key) {
                      print(key.text);
                      if (key.text == null) {
                        _textEditingController.clear();
                      } else {
                        _textEditingController.text =
                            _textEditingController.text + key.text;
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
