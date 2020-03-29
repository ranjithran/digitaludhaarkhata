import 'package:digitaludhaarkhata/models/Data/CustomerData.dart';
import 'package:digitaludhaarkhata/models/Models/CustomerModel.dart';
import 'package:digitaludhaarkhata/models/Models/SearchModel.dart';
import 'package:digitaludhaarkhata/models/widgets/CustomerCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomView extends StatelessWidget {

  List<Customer> _list = new List();
  List<CustomerCard> _buildList() {
  
    return _list
        .map((contact) => new CustomerCard(
          id: contact.id,
              name: contact.name,
              
            ))
        .toList();
  }

  List<CustomerCard> _buildSearchList(_searchText) {
    if (_searchText.isEmpty) {
      return _list
          .map((contact) => new CustomerCard(
            id: contact.id,
                name: contact.name,
                
              ))
          .toList();
    } else {
      List<Customer> _searchList = List();
      for (int i = 0; i < _list.length; i++) {
          // String name = _list.elementAt(i).toString();
          String name = _list.elementAt(i).name.toString();
        if (name.toLowerCase().contains(_searchText.toLowerCase())) {
          _searchList.add(_list[i]);
        }
      }
      return _searchList
          .map((contact) => CustomerCard(
            id: contact.id,
                name: contact.name,
                
              ))
          .toList();
    }
  }
  
  @override
  Widget build(BuildContext context) {
    
    _list=Provider.of<CustomerModel>(context).names;
    
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              child: Consumer<SearchModel>(
                builder: (context,model,child)=>ListView(
                  padding: new EdgeInsets.symmetric(vertical: 8.0),
                  children: model.isSearching ? _buildSearchList(model.keyword) : _buildList(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  
}
