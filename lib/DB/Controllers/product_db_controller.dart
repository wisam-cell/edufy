import 'dart:ffi';

import 'package:edufly/DB/db_settings.dart';
import 'package:edufly/Models/DB/product_model.dart';
import 'package:sqflite/sqflite.dart';

class ProductDbController {
/// CRUD
  ///
  final Database _database =DbSettings().database;
  /// CREATE
  Future<bool> create(ProductModel product)async{// convert from model to json
  var response = await _database.insert('products', product.toJson());// return int
  return response > 0 ? true : false ; // return 0 if false and 1 if success


  }

  /// READ([])
  Future<List<ProductModel>> read()async{
  var result= await _database.query('products');//return list of json
  return result.map((row)=>ProductModel.fromjson(row)).toList();
  }


  /// SHOW(id)
  Future<ProductModel?> show(int id)async {
    var result= await _database.rawQuery("SELECT * FROM products WHERE id = '$id'");

    if(result.isNotEmpty){
     return ProductModel.fromjson(result.first);
    }
    return null;
  }



  /// UPDATE
  Future<bool> update(ProductModel product) async{
    // result here is count of updated rows in id case result will be 1
    var result = await _database.update(
        "product",
        product.toJson(),
        where: 'id = ?',
      whereArgs: [product.id]
    );
    return result>0;//0 will be false no rows were updated else return true

  }


/// DELETE
 Future<bool> delete(ProductModel product) async{
    var status = await _database.delete(
      "product",
      where: 'id=?',
        whereArgs: [product.id]
    );
    return status>0;


 }

}