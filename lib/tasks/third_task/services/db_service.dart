import 'package:hackathon_fatura/tasks/third_task/models/movie.dart';
import 'package:sqflite/sqflite.dart';

class DBService {
  DBService._();

  static final instance = DBService._();

  Database? db;

  Future open() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = '$databasesPath/app.db';
    print(path);

    db = await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
      await db.execute('''
          create table favourites ( 
            id integer primary key autoincrement, 
            title text not null,
            backdrop_path text null
            )
          ''');
    });
  }

  Future<Movie> insert(Movie movie) async {
    await db!.insert("favourites", movie.toMap());
    return movie;
  }

  Future<List<Movie>?> getMovies() async {
    try {
      List<Map<String, Object?>> records = await db!.rawQuery('SELECT * FROM favourites');
      List<Movie> Movies = [];
      for (int i = 0; i < records.length; i++) {
        Movies.add(Movie.fromJson(records[i]));
      }
      return Movies;
    } catch (ex) {
      print(ex);
    }
  }

  Future<int> delete(int id) async {
    return await db!.delete("favourites", where: 'id = ?', whereArgs: [id]);
  }

  Future close() async => db!.close();
}
