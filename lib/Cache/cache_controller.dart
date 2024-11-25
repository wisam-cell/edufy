import 'package:shared_preferences/shared_preferences.dart';

import '../enums.dart';




class CacheController {
/// singelton : desing pattern to issolite class from content use private constructor


   CacheController._privatecons(); // private constructor to ban create object from oustide
  static CacheController cache = CacheController._privatecons();

   // favtory constructor  = return
 factory CacheController()=> cache;




/// shared peferences
   late SharedPreferences preferences;
   Future<void> initCache ()async {
     preferences = await SharedPreferences.getInstance();
   }

   Future<void> setData(CacheKeys key , dynamic value) async{
   if(value is String){
     await preferences.setString(key.name , value);
   }else if(value is int){
     await preferences.setInt(key.name , value);
   }else if(value is bool){
     await preferences.setBool(key.name , value);
   }else if(value is double){
     await preferences.setDouble(key.name , value);
   }
   }

   dynamic getData(CacheKeys key) {
   preferences.get(key.name);
   }





   ///

  //
  //  }
  //                                   // .name to convert enum to string
  //  Future<void> login() async => await preferences.setBool(CacheKeys.loggedIn.name, true);
  //
  //  Future<void> setLanguage(String language)async {
  //  await preferences.setString(CacheKeys.lang.name, language);
  //  }
  //  String get getLanguage => preferences.getString(CacheKeys.lang.name)??'ar';
  //
  //  bool?  get getlogin =>  preferences.getBool(CacheKeys.loggedIn.name);
  //
  //  Future<void> logut()async{
  //    preferences.setBool(CacheKeys.loggedIn.name, false);
  //
  //  }





}


