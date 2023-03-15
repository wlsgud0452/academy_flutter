import 'package:path/path.dart';
import 'package:scheduler_semiproject_app/model/schedule.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'calendar.db'),
      onCreate: (database, version) async {
        await database.execute(
            'create table calendar (id integer primary key autoincrement, initdate text, title text, content text, user_uid text)');
      },
      version: 1,
    );
  }

  Future<int> insertSchedule(Schedule schedule) async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db.rawInsert(
        'insert into calendar(initdate,title,content,user_uid) values(?,?,?,?) ',
        [
          schedule.initdate,
          schedule.title,
          schedule.content,
          schedule.user_uid
        ]);
    return result;
  }

  Future<List<Schedule>> querySchedule(String user_uid) async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db
        .rawQuery("select * from calendar where user_uid='" + user_uid + "'");
    return queryResult.map((e) => Schedule.fromMap(e)).toList();
  }

  Future<List<Schedule>> queryDaySchedule(
      String initdate, String user_uid) async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.rawQuery(
        'select * from calendar where initdate = ? and user_uid',
        [initdate, user_uid]);
    return queryResult.map((e) => Schedule.fromMap(e)).toList();
  }

  Future<int> deleteSchedule(int id) async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db.rawInsert('delete from calendar where id = ?', [id]);

    return result;
  }

  Future<int> deleteScheduleAll(String user_uid) async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db
        .rawInsert('delete from calendar where user_uid = ?', [user_uid]);

    return result;
  }

// //Test용 임시 Data 생성하기
//   Future<int> insertStudents(Students student) async {
//     int result = 0;
//     final Database db = await initializeDB();
//     result = await db.rawInsert(
//         'insert into students(code,name,dept,phone) values(?,?,?,?) ',
//         [student.code, student.name, student.dept, student.phone]);
//     return result;
//   }

//   Future<List<Students>> queryStudents() async {
//     final Database db = await initializeDB();
//     final List<Map<String, Object?>> queryResult =
//         await db.rawQuery('select * from students');
//     return queryResult.map((e) => Students.fromMap(e)).toList();
//   }

//   Future<int> updateStudents(Students student) async {
//     int result = 0;
//     final Database db = await initializeDB();
//     result = await db.rawInsert(
//         'update students set name = ?, dept = ?, phone = ? where id = ?',
//         [student.name, student.dept, student.phone, student.id]);

//     return result;
//   }

//   Future<int> deleteStudent(int id) async {
//     int result = 0;
//     final Database db = await initializeDB();
//     result = await db.rawInsert('delete from students where id = ?', [id]);

//     return result;
//   }

//   Future<int?> codeCheck(String code) async {
//     int? count = 0;
//     final Database db = await initializeDB();
//     // final List<Map<String, Object?>> queryResult =
//     //     await db.rawQuery('select * from students');
//     count = Sqflite.firstIntValue(await db
//         .rawQuery('select count(*) from students where code = ?', [code]));

//     return count;
//   }
}
