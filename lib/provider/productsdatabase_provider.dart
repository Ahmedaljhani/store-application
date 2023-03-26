import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

class ProductsDataBBaseProvider extends ChangeNotifier{
  //
  List<Map>? products;
  Database? database;

  int count=0;
  //to create provider when start !! important
  ProductsDataBBaseProvider(){
    createDatabase();
  }
//fun create database and table
  Future<void> createDatabase() async {
    // open the database with name and version
    database = await openDatabase("product.db", version: 1,
        onCreate: (Database db, int version) async {
          print("database created!");
          // When creating the db, create the table
          await db.execute(
              'CREATE TABLE Products (id INTEGER PRIMARY KEY, name TEXT,price TEXT,image TEXT,amount TEXT)');
          print("table created!");

        },
        onOpen: (database) async {
          // Get the records
          products = await database.rawQuery('SELECT * FROM Products');
          notifyListeners();
          print("product: ${products.toString()}");
          print("database opened!");

        }
    );
  }
  Future<void> getProducts() async {
    products = await database?.rawQuery('SELECT * FROM Products');
    notifyListeners();
  }

  Future<void> deleteProducts (int id) async {
    // Delete a record
    print("delete called $id");
    await database
        ?.rawDelete('DELETE FROM Products WHERE id = $id');
    getProducts();
    notifyListeners();
  }

  Future<void> insertToDatabase(String name,String price,String image,String amount) async {
    // Insert some records in a transaction
    await database?.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO Products(name,price,image,amount) VALUES("$name","$price","$image","$amount")');
      print('inserted: $id1');

      count=id1;
      notifyListeners();
    });
    getProducts();
  }
  Future<void> editProducts(int id,String content) async{
    await database?.rawUpdate('UPDATE Products SET  amount="$content" WHERE id =$id  ');
    print( "update : $id with content $content");
    getProducts();
  }
}
