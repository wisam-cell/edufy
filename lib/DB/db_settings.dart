import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbSettings{
  ///Singelton
  /// we use singlton to verify object only one time and use it in all app files



DbSettings._(); // private constructor
static final DbSettings dbSettings =DbSettings._(); // object from private constructor
factory DbSettings() => dbSettings;



/// data base
late Database database;
Future<void> initDB() async {
  Directory directory= await getApplicationDocumentsDirectory();
  String sqlName = 'app_db.sql';
  String path = join(directory.path,sqlName);//merge sql file in dirctory

  database = await openDatabase(
      path,
      version: 1,
    onCreate: (db, version) async {// use once when i first time create db
       await db.execute("CREATE TABLE products("
           "id INTEGER PRIMARY KEY AUTOINCREMENT,"
           "name TEXT NOT NULL,"
           "description TEXT,"
           "price REAL NOT NULL,"
           "image TEXT"
           ")");
        
        
        
    },
      onOpen: (db) {},// every time i open the app it will use it

      onUpgrade: (db, oldVersion, newVersion) {},//when upgrade verssion from 1 to 2
      onDowngrade:(db, oldVersion, newVersion) {},// ... from 4 ti 3 or 2 or1






  ); // open and create new db




}
}