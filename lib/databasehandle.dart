import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class DatabaseHandle{

static final DatabaseHandle _databaseHandle=DatabaseHandle._internal();
static Database? _database;
  factory DatabaseHandle(){
    return _databaseHandle;
  }
DatabaseHandle._internal();

  Future<Database?> openDB() async{
    _database =await openDatabase(
      join(await getDatabasesPath(),' todo.db'),
    );
    return _database;
  }
}