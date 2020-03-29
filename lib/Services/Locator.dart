
import 'package:digitaludhaarkhata/Core/FileLoader/FielLoader.dart';
import 'package:digitaludhaarkhata/Services/NavigationServices.dart';
import 'package:digitaludhaarkhata/models/Models/CreatingCustomer.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(()=>FileLoader());
  locator.registerLazySingleton(()=>CreatingCustomer());
 
}