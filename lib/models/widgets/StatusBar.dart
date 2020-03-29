import 'package:digitaludhaarkhata/models/Models/CustomerModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class StatusBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(240),
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      color: Colors.green,
      child: Card(
        elevation: 3,
        child: InkWell(
          onTap: (){
            
          },

                  child: Container(
            alignment: Alignment.center,
            child: Consumer<CustomerModel>(
              builder: (context,_model,child)=>
                          Text(
                _model.statusBarStatus,
                style: TextStyle(fontSize: ScreenUtil().setSp(60)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
