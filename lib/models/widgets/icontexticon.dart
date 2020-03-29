import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class IconTextIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  const IconTextIcon({Key key, @required this.icon,@required this.label}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
                  child: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            icon,
                            size: ScreenUtil().setSp(90),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              label,
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(50),
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: Container(
                                  alignment: Alignment.centerRight,
                                  child: Icon(MdiIcons.arrowRight)))
                        ],
                      ),
                      ),
                );
  }
}