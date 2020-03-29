import 'package:digitaludhaarkhata/models/Models/SearchModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Searchbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _model = Provider.of<SearchModel>(context, listen: false);
    return Container(
        height: 100,
        padding: EdgeInsets.only(left: 10, right: 10),
        child: TextField(
          cursorColor: Colors.white,
          textAlign: TextAlign.center,
          decoration: new InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: Colors.white, width: 3.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: Colors.white, width: 3.0),
              ),
              hintText: 'Search For Customer',
              hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: ScreenUtil().setSp(45),
                  fontWeight: FontWeight.w500)),
          onChanged: (val) => _model.setKeyword(val),
          style: TextStyle(
              color: Colors.white,
              fontSize: ScreenUtil().setSp(45),
              fontWeight: FontWeight.w500),
        ));
  }
}
