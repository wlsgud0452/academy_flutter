import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlit_crud_app/students.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'student.db'),
      onCreate: (database, version) async {
        await database.execute(
            'create table students (id integer primary key autoincrement, code text, name text, dept text, phone text)');
      },
      version: 1,
    );
  }

//Test용 임시 Data 생성하기
  Future<int> insertStudents(Students student) async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db.rawInsert(
        'insert into students(code,name,dept,phone) values(?,?,?,?) ',
        [student.code, student.name, student.dept, student.phone]);
    return result;
  }

  Future<List<Students>> queryStudents() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult =
        await db.rawQuery('select * from students');
    return queryResult.map((e) => Students.fromMap(e)).toList();
  }

  Future<int> updateStudents(Students student) async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db.rawInsert(
        'update students set name = ?, dept = ?, phone = ? where id = ?',
        [student.name, student.dept, student.phone, student.id]);

    return result;
  }

  Future<int> deleteStudent(int id) async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db.rawInsert('delete from students where id = ?', [id]);

    return result;
  }

  Future<int?> codeCheck(String code) async {
    int? count = 0;
    final Database db = await initializeDB();
    // final List<Map<String, Object?>> queryResult =
    //     await db.rawQuery('select * from students');
    count = Sqflite.firstIntValue(await db
        .rawQuery('select count(*) from students where code = ?', [code]));

    return count;
  }
}
