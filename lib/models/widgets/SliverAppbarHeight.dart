import 'package:digitaludhaarkhata/models/Models/CustomerModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import "package:easy_localization/easy_localization.dart";
import 'package:provider/provider.dart';

class MainHead extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 40, top: 60, right: 40, bottom: 5),
      child: Card(
        color: Colors.white,
        child: Consumer<CustomerModel>(
          builder: (context,_model,child)=>
                  Column(
            children: <Widget>[
              Table(
                border: TableBorder(
                  verticalInside: BorderSide(width: 0.2, color: Colors.black54),
                ),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(children: [
                    Container(
                      height: ScreenUtil().setHeight(120),
                      child: Text(
                        "${_model.give}",
                        style: TextStyle(fontSize: ScreenUtil().setSp(60),color: Colors.red),
                      ),
                      alignment: Alignment.center,
                    ),
                    Container(
                        alignment: Alignment.center,
                        height: ScreenUtil().setHeight(120),
                        child: Text(
                          "${_model.get}",
                          style: TextStyle(fontSize: ScreenUtil().setSp(60),color: Colors.green),
                        ))
                  ]),
                  TableRow(children: [
                    Container(
                        alignment: Alignment.center,
                        child: Text(
                          "You had given",
                          style: TextStyle(fontSize: ScreenUtil().setSp(50)),
                        ).tr(context:context)),
                    Container(
                        alignment: Alignment.center,
                        child: Text(
                          "You got",
                          style: TextStyle(fontSize: ScreenUtil().setSp(50)),
                        ).tr(context:context))
                  ])
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Divider(),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "Total You Had ${_model.get+_model.give}",
                  style: TextStyle(fontSize: ScreenUtil().setSp(60),color: Colors.blue),
                ).tr(args: ["100",],context: context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
