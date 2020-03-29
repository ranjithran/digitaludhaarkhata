import 'package:digitaludhaarkhata/models/Data/CustomerData.dart';
import 'package:digitaludhaarkhata/models/Models/CustomerModel.dart';
import 'package:digitaludhaarkhata/models/Models/SearchModel.dart';
import 'package:digitaludhaarkhata/models/views/CustomerView.dart';
import 'package:digitaludhaarkhata/models/views/DetailsView.dart';
import 'package:digitaludhaarkhata/models/views/HomeView.dart';
import 'package:digitaludhaarkhata/models/views/LanguageMenuView.dart';
import 'package:digitaludhaarkhata/models/views/SignUp.dart';
import 'package:digitaludhaarkhata/models/views/Test.dart';
import 'package:digitaludhaarkhata/models/views/verifyview.dart';
import 'package:flutter/cupertino.dart';
import 'package:digitaludhaarkhata/routes/routename.dart' as routenames;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Route<dynamic> generateRoute(RouteSettings _settings) {
  switch (_settings.name) {
    case routenames.main:
      return MaterialPageRoute(builder: (context) => LanguageMenu());
      break;
    case routenames.signup:
      return MaterialPageRoute(builder: (context) => PhoneSignUp());
      break;
    case routenames.signup2:
      final String _vID=_settings.arguments;
      
      return MaterialPageRoute(builder: (context) => PhoneSignUp2(
        vID: _vID,
      ));
      break;
    case routenames.home:
      return MaterialPageRoute(
        builder: (context) => MultiProvider(
          providers: [
            ChangeNotifierProvider<SearchModel>(
              create: (context) => SearchModel(),
            ),
          
            ChangeNotifierProvider<CustomerModel>(
              create: (context) => CustomerModel(),
            ),
          ],
          child: HomeView(),
        ),
      );
      break;
    case routenames.customer:
      final Customer _customer=_settings.arguments;
      return MaterialPageRoute(
        builder: (context) => MultiProvider(
          providers: [
            ChangeNotifierProvider<CustomerModel>(
              create: (context) => CustomerModel(),
            ),
          ],
          child: CustomerView(
            id: _customer.id,
            name: _customer.name,
          ),
        ),
      );
      break;
    case routenames.details:
      final CustomerEntriesDeatils _customerEntriesDeatils =
          _settings.arguments;
      return MaterialPageRoute(
        builder: (context) => DetailsView(
          datetime: _customerEntriesDeatils.datetime,
          money: _customerEntriesDeatils.money,
        ),
      );
      break;
    default:
      return MaterialPageRoute(
        builder: (context) => Test(),
      );
  }
}
