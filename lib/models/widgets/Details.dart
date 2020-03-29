import 'package:digitaludhaarkhata/models/Models/CustomerModel.dart';
import 'package:digitaludhaarkhata/models/widgets/DetailsCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Details extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    return Consumer<CustomerModel>(
      builder: (context, _model, child) => Container(
          child: ListView.builder(
              itemCount: _model.entries.length,
              itemBuilder: (context, _index) => DetailsCard(
                datetime: _model.entries[_index].dateTime.toString(),
                gave: _model.entries[_index].gave,
                got: _model.entries[_index].got,
              ),),),
    );
  }
}
