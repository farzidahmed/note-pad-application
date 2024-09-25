
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {

  Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }

    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "mydatabase.db");
    _database =
    await openDatabase(path, version: 2, onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE Datalist (id INTEGER PRIMARY KEY, title TEXT,  description TEXT)');
    });
    return _database;
  }
// single data insert er jonno
  // insertData(context) async {
  //   Database? db = await database;
  //   db?.insert("MyProfile", {
  //     "name": "Flutter demo",
  //     "age": 22,
  //     "address": "dhaka 1207",
  //     "num": 12.5
  //   });
  //   var snackBar = SnackBar(content: Text('Data inserted successfully !'));
  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
  // }
//multiple data insert er jonno

Future<void> addlist(context, dynamic title, dynamic description)async{
    Database? db = await _database;
    db?.insert("Datalist", {
      'title':title,
      'description':description
    });
    var snackBar = SnackBar(content: Text('Data inserted successfully !'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    print("data successfully added$database");
}
  Future<dynamic> readData()async{
    Database? db = await database;
    final list = db?.query("Datalist");
    return list ;
  }


}