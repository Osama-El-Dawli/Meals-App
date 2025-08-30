import 'package:meals_app/features/home/models/meal_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class DatabaseHelper {
  static Database? _db;

  static Future<Database> get database async {
    if (_db != null) return _db!;

    _db = await initDb();
    return _db!;
  }

  static Future<Database> initDb() async {
    String dbPath = await getDatabasesPath();
    final path = join(dbPath, 'meals.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE IF NOT EXISTS meals (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            description TEXT,
            imageUrl TEXT,
            calories INTEGER,
            time TEXT,
            rate REAL
          )
        ''');
      },
    );
  }

  static Future<int> insertMeal(MealModel meal) async {
    final db = await database;
    return await db.insert('meals', meal.toJson());
  }

  static Future<List<Map<String, dynamic>>> getMeals() async {
    final db = await database;
    return await db.query('meals');
  }

  static Future<int> deleteMeal(int id) async {
    final db = await database;
    return await db.delete('meals', where: 'id = ?', whereArgs: [id]);
  }
}
