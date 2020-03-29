import 'package:digitaludhaarkhata/Services/Locator.dart';
import 'package:digitaludhaarkhata/Services/NavigationServices.dart';
import 'package:digitaludhaarkhata/models/Data/CustomerData.dart';
import 'package:digitaludhaarkhata/models/Models/CustomerModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:digitaludhaarkhata/routes/routename.dart'as routeNames;
import 'package:provider/provider.dart';
class CustomerCard extends StatelessWidget {
  final String name;
  
  final int id;
  const CustomerCard({Key key, this.name, this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        print(id);
        locator<NavigationService>().navigateToWithArguments(routeNames.customer,Customer(id, 0, name, 0));
      },
          child: Container(
        height: ScreenUtil().setHeight(220),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    height: ScreenUtil().setHeight(110),
                    width: ScreenUtil().setWidth(110),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(100),
                      // boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
                    ),
                    child: Text(
                      name[0],
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(80), color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      name,
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(50),
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.5),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      alignment: Alignment.centerRight,
                      child: Consumer<CustomerModel>(

                        builder: (context,_model,child)=>
                                              Text(
                          "₹${_model.stausvalue}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: ScreenUtil().setSp(45),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 80),
              child: Divider(thickness: 1),
            )
          ],
        ),
      ),
    );
  }
}
