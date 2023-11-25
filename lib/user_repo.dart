
import 'package:sqflite/sqflite.dart';

class UserRepo{
void createTable(Database? db){
  db?.execute('CREATE TABLE IF NOT EXIST USER (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, email TEXT, password TEXT)');
}

Future<void> getUsers(Database? db) async{
  final List<Map<String,dynamic>> maps=await db!.query('USER');
  print(maps);
}


}