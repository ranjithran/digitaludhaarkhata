import 'package:digitaludhaarkhata/Core/Auth/PhoneAuth.dart';
import 'package:digitaludhaarkhata/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:virtual_keyboard/virtual_keyboard.dart';
import 'package:easy_localization/easy_localization.dart';


class PhoneSignUp extends StatelessWidget {
  
  final TextEditingController _textEditingController = TextEditingController();
  
  
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
                  "signup",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(70),
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 2),
                ).tr(context: context),
              ),
              Container(
                padding: EdgeInsets.only(left:30),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(left: 70),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "india",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            letterSpacing: 2,
                            fontSize: ScreenUtil().setSp(60),
                            color: Colors.white),
                      ).tr(context: context),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70, right: 120),
                      child: Divider(
                        color: Colors.white70,
                        thickness: 1.4,
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(left: 70, right: 120),
                        child: TextField(
                            readOnly: true,
                            controller: _textEditingController,
                            style: TextStyle(
                              
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: ScreenUtil().setSp(40),
                                letterSpacing: 1.2),
                            autocorrect: true,
                            decoration: InputDecoration(
                              hintText: 'Your Phone Number',
                              hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: ScreenUtil().setSp(40),
                                  letterSpacing: 1.2),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ))),
                    SizedBox(
                      height: ScreenUtil().setHeight(70),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 75),
                      alignment: Alignment.centerLeft,
                      height: ScreenUtil().setHeight(100),
                      child: Text(
                        "smsmay",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: ScreenUtil().setSp(
                            38,
                          ),
                        ),
                      ).tr(context:context),
                    ),
                    // SizedBox(
                    //   height: ScreenUtil().setHeight(50),
                    // ),
                    
                  ],
                ),
              ),
              SizedBox(height: ScreenUtil().setHeight(80),),
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
                          
                         String vID=await PhoneAuth().verifyPhone(_textEditingController.text).then((onValue){
                           print("this is"+onValue);
                         });
                        //  print(vID);
                        },
                        child: Text("continue").tr(context:context),
                      ),
                    ),
              SizedBox(
                height: ScreenUtil().setHeight(180),
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