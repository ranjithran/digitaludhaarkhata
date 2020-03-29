import 'package:digitaludhaarkhata/Services/Locator.dart';
import 'package:digitaludhaarkhata/models/Models/CreatingCustomer.dart';
import 'package:digitaludhaarkhata/models/Models/CustomerModel.dart';
import 'package:digitaludhaarkhata/models/widgets/CustomerBottom.dart';
import 'package:digitaludhaarkhata/models/widgets/StatusBar.dart';
import 'package:digitaludhaarkhata/models/widgets/Title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import "package:easy_localization/easy_localization.dart";

class CustomerView extends StatelessWidget {
  final int id;
  final String name;

  CustomerView({Key key, this.id, this.name}) : super(key: key);
  final CreatingCustomer _creatingCustomer = locator<CreatingCustomer>();
  final TextEditingController _textEditingController =
      new TextEditingController();
  @override
  Widget build(BuildContext context) {
    Provider.of<CustomerModel>(context, listen: false).creatingEntries(id);

    print("this is $id");
    ScreenUtil.init(context);
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(bottom: 10),
        height: ScreenUtil().setHeight(180),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Card(
              elevation: 3,
              child: InkWell(
                onTap: () {
                  Alert(
                      context: context,
                      title: "You Gave",
                      content: Column(
                        children: <Widget>[
                          TextField(
                            controller: _textEditingController,
                            decoration: InputDecoration(
                              icon: Icon(MdiIcons.currencyInr),
                              labelText: 'Amount',
                            ),
                          ),
                        ],
                      ),
                      buttons: [
                        DialogButton(
                          onPressed: () {
                            _creatingCustomer.creatingCustomerEntries(
                                id, int.parse(_textEditingController.text),0,2);
                            _textEditingController.clear();
                            Navigator.pop(context);
                          },
                          child: Text(
                            "add",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ).tr(context:context),
                        )
                      ]).show();
                },
                child: Container(
                  alignment: Alignment.center,
                  height: ScreenUtil().setHeight(120),
                  width: ScreenUtil().setWidth(350),
                  color: Colors.redAccent,
                  child: Text(
                    "You Gave (-)",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.white),
                  ).tr(context:context),
                ),
              ),
            ),
            Card(
              elevation: 3,
              child: InkWell(
                onTap: () {
                  Alert(
                      context: context,
                      title: "You Got",
                      content: Column(
                        children: <Widget>[
                          TextField(
                            controller: _textEditingController,
                            decoration: InputDecoration(
                              icon: Icon(MdiIcons.currencyInr),
                              labelText: 'Amount',
                            ),
                          ),
                        ],
                      ),
                      buttons: [
                        DialogButton(
                          onPressed: () {
                            _creatingCustomer.creatingCustomerEntries(
                                id, 0, int.parse(_textEditingController.text),1);
                            _textEditingController.clear();
                            Navigator.pop(context);
                          },
                          child: Text(
                            "add",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ).tr(context: context),
                        )
                      ]).show();
                },
                child: Container(
                  alignment: Alignment.center,
                  height: ScreenUtil().setHeight(120),
                  width: ScreenUtil().setWidth(350),
                  color: Colors.lightGreen,
                  child: Text(
                    "You Got (+)",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.white),
                  ).tr(context: context),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: TitleMain(
          title: name,
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              leading: Container(),
              actions: <Widget>[],
              stretch: true,
              expandedHeight: 100.0,
              // floating: false,
              // pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: StatusBar(),
                collapseMode: CollapseMode.none,
              ),
            ),
          ];
        },
        body: CustomerBottom(),
      ),
    ));
  }
}
