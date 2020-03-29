import 'package:digitaludhaarkhata/Services/startup.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:digitaludhaarkhata/Services/Locator.dart';
import 'package:digitaludhaarkhata/Services/NavigationServices.dart';
import 'package:digitaludhaarkhata/routes/routesgenerator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:digitaludhaarkhata/routes/routename.dart' as routesnames;

void main() => [
      WidgetsFlutterBinding.ensureInitialized(),
      setupLocator(),
      StartUP(),
      runApp(EasyLocalization(
          path: 'resources/lang',
          supportedLocales: [
            Locale('en', 'IN'),
            Locale('hi', 'IN'),
            Locale('mh', 'IN'),
            Locale('gu', 'IN'),
            Locale('ta', 'IN'),
            Locale('te', 'IN'),
            Locale('pu', 'IN'),
            Locale('ma', 'IN'),
            Locale('ka', 'IN'),
            Locale('be', 'IN'),
            Locale('or', 'IN'),
          ],
          child: MyApp()))
    ];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital Udhaar Khata',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: generateRoute,
      initialRoute: routesnames.main,
      navigatorKey: locator<NavigationService>().navigatorKey,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        EasyLocalization.of(context).delegate,
      ],
      supportedLocales: EasyLocalization.of(context).supportedLocales,
      locale: EasyLocalization.of(context).locale,
    );
  }
}
