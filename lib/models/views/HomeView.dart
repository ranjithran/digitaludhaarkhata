import 'package:digitaludhaarkhata/Services/Locator.dart';
import 'package:digitaludhaarkhata/models/Models/CreatingCustomer.dart';
import 'package:digitaludhaarkhata/models/Models/CustomerModel.dart';
import 'package:digitaludhaarkhata/models/Models/SearchModel.dart';
import 'package:digitaludhaarkhata/models/views/bottomView.dart';
import 'package:digitaludhaarkhata/models/widgets/Searchbar.dart';
import 'package:digitaludhaarkhata/models/widgets/SliverAppbarHeight.dart';
import 'package:digitaludhaarkhata/models/widgets/Title.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  TabController _controller;
  final TextEditingController _textEditingController =
      new TextEditingController();
  final CreatingCustomer _creatingCustomer = locator<CreatingCustomer>();
  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 3, vsync: this);
    Provider.of<CustomerModel>(context, listen: false).creatingList();
  }

  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  bool _icon = false;
  @override
  Widget build(BuildContext context) {
    final _model = Provider.of<SearchModel>(context, listen: false);
    Provider.of<CustomerModel>(context, listen: false).creatingList();
    Provider.of<CustomerModel>(context, listen: false).statusbar();
    ScreenUtil.init(context);
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Alert(
                context: context,
                title: "Cusomer Name",
                content: Column(
                  children: <Widget>[
                    TextField(
                      controller: _textEditingController,
                      decoration: InputDecoration(
                        icon: Icon(Icons.account_circle),
                        labelText: 'Name',
                      ),
                    ),
                  ],
                ),
                buttons: [
                  DialogButton(
                    onPressed: () {
                      _creatingCustomer.creatingCustomer(
                          Provider.of<CustomerModel>(context, listen: false)
                                  .names
                                  .length +
                              1,
                          _textEditingController.text);
                      Navigator.pop(context);
                    },
                    child: Text(
                      "add",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ).tr(context: context),
                  )
                ]).show().then((onValue) {
              // Provider.of<CustomerModel>(context, listen: false).creatingList();
            });
          },
          icon: Icon(MdiIcons.accountPlusOutline),
          label: Text("ac").tr(context: context),
          elevation: 5,
        ),
        bottomNavigationBar: TabBar(
          controller: _controller,
          labelColor: Colors.black87,
          unselectedLabelColor: Colors.grey,
          tabs: [
            Tab(
              icon: Icon(Icons.all_out),
              text: "ALL",
            ),
            Tab(icon: Icon(MdiIcons.minus), text: "Receivables"),
            Tab(
              icon: Icon(MdiIcons.plus),
              text: "Payables",
            ),
            // Tab(icon: Icon(MdiIcons.numeric0Box), text: "Settled"),
          ],
        ),
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: Colors.lightGreen,
                  leading: Container(
                    alignment: Alignment.center,
                    // child: Hero(
                    //     tag: "Total",
                    //     child: Text(
                    //       r"$100",
                    //       style: TextStyle(fontSize: ScreenUtil().setSp(40)),
                    //     )),
                  ),
                  actions: <Widget>[
                    SizedBox(
                        width: ScreenUtil().setWidth(900),
                        child: _icon
                            ? Searchbar()
                            : TitleMain(
                                title: "title2",
                              )),
                    IconButton(
                      icon: Icon(
                        !_icon ? MdiIcons.accountSearch : MdiIcons.close,
                        color: Colors.white,
                        size: ScreenUtil().setSp(80),
                      ),
                      onPressed: () {
                        setState(() {
                          _icon
                              ? [_icon = false, _model.setBusy(false)]
                              : _icon = true;
                        });
                      },
                      color: Colors.black,
                    ),
                  ],
                  expandedHeight: 210.0,
                  floating: true,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    background: MainHead(),
                    collapseMode: CollapseMode.none,
                  ),
                ),
              ];
            },
            dragStartBehavior: DragStartBehavior.start,
            body: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: TabBarView(
                    controller: _controller,
                    children: <Widget>[
                      BottomView(),
                      BottomView(),
                      BottomView(),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
