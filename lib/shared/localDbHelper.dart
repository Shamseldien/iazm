import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();
    return _database!;
  }

  DatabaseHelper.internal();

  Future<Database> initDatabase() async {
    final path = await getDatabasesPath();
    final databasePath = join(path, 'login_records.db');

    return await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          '''
          CREATE TABLE login_records (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            email TEXT,
            password TEXT,
            loginCount INTEGER
          )
          ''',
        );
      },
    );
  }

  Future<int> insertLoginRecord(String email, String password) async {
    final db = await database;

    final loginRecord = {
      'email': email,
      'password': password,
      'loginCount': 1,
    };

    return await db.insert('login_records', loginRecord);
  }

  Future<int?> updateLoginRecord(String email, String password) async {
    final db = await database;

    final record = await db.query(
      'login_records',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    if (record.isNotEmpty) {
      final loginCount = (record.first['loginCount'] as int )+ 1;
      return await db.update(
        'login_records',
        {'loginCount': loginCount},
        where: 'email = ? AND password = ?',
        whereArgs: [email, password],
      );
    }

    return null;
  }

  Future<List<Map<String, Object?>>> getAllLoginRecords() async {
    final db = await database;
    return await db.query('login_records');
  }
}
