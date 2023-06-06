import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

class StoreResult{
  static Database? _database;


  //open database connection
static Future<Database?> _openDatabase()async{
  if(_database != null){
    return _database;
  }

  //Get database path to the database
  String dbpath =await getDatabasesPath();
  String path =join(dbpath,'result.db');

  //Create database
  _database = await openDatabase(
    path,
    version: 1,
    onCreate: (db,version){
      //Create table
      db.execute('''
        CREATE TABLE IF NOT EXISTS result_table(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        date TEXT,
        result INTEGER,
        result_in_percentage REAL
        )
      ''');
    }
  );
  return _database;
}

//Insert data into table
static Future<void> insertData(String date,int result,double result_in_percentage)async{
  Database? db = await _openDatabase();
  await db?.insert('result_table', {'date' : date,'result':result,'result_in_percentage':result_in_percentage});
}

//Query all data from the table
static Future<List<Map<String,dynamic>>> getAllResult()async{
  Database? db = await _openDatabase();
  return db!.query('result_table');
}

}

