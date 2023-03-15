import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:scheduler_semiproject_app/database_handler.dart';
import 'package:scheduler_semiproject_app/home.dart';
import 'package:scheduler_semiproject_app/model/schedule.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDate;

  Map<String, List> mySelectedEvents = {};

  final titleController = TextEditingController();
  final descpController = TextEditingController();

  late DatabaseHandler handler;
  late String selectDay;
  late Future<List<Schedule>> listFuture;
  late String userId;

  @override
  void initState() {
    super.initState();
    handler = DatabaseHandler();
    _selectedDate = _focusedDay;
    selectDay = '';
    userId = '';
    _initSharedPreferences();
    handler.initializeDB().whenComplete(
      () async {
        setState(() {
          getAll();
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Calendar'),
        leading: TextButton(
            onPressed: () {
              deleteUserInfo();
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return Home();
                },
              ));
            },
            child: const Text(
              'Logout',
              style: TextStyle(color: Colors.black, fontSize: 11),
            )),
        actions: [
          IconButton(
            onPressed: () {
              Get.defaultDialog(
                title: '백업',
                middleText: '일정을 백업하시겠습니까?',
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('취소'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          backupCalendar();
                        },
                        child: const Text('확인'),
                      ),
                    ],
                  ),
                ],
              );
            },
            icon: Icon(Icons.file_upload_outlined),
          ),
          IconButton(
              onPressed: () {
                Get.defaultDialog(
                  title: '일정가져오기',
                  middleText: '일정을 가져오시겠습니까?',
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('취소'),
                        ),
                        TextButton(
                          onPressed: () {
                            importCalendar();
                            Navigator.of(context).pop();

                            Get.defaultDialog(
                              title: '가져오기',
                              middleText: '가져오기를 완료했습니다',
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    setState(() {
                                      getAll();
                                    });
                                  },
                                  child: const Text('확인'),
                                ),
                              ],
                            );
                          },
                          child: const Text('확인'),
                        ),
                      ],
                    ),
                  ],
                );
              },
              icon: Icon(Icons.save_alt))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TableCalendar(
              locale: 'ko_KR',
              headerStyle: const HeaderStyle(
                  formatButtonVisible: false, titleCentered: true),
              firstDay: DateTime(2000),
              lastDay: DateTime(2099),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(_selectedDate, selectedDay)) {
                  setState(() {
                    _selectedDate = selectedDay;

                    _focusedDay = focusedDay;
                    selectDay = DateFormat('yyyy-MM-dd').format(focusedDay);
                    print(selectDay);
                  });
                }
              },
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDate, day);
              },
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
              eventLoader: _listOfDayEvents,
            ),
            ..._listOfDayEvents(_selectedDate!).map(
              (myEvents) => ListTile(
                onTap: () {
                  //
                },
                onLongPress: () {
                  deleteDialog(myEvents['id']);
                  setState(() {
                    getAll();
                  });
                },
                leading: const Icon(
                  Icons.done,
                  color: Colors.teal,
                ),
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text('${myEvents['eventTitle']}'),
                ),
                subtitle: Text('${myEvents['eventDescp']}'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddEventDialog(),
        label: const Text('Add Event'),
      ),
    );
  } //----funtion----

  List _listOfDayEvents(DateTime dateTime) {
    if (mySelectedEvents[DateFormat('yyyy-MM-dd').format(dateTime)] != null) {
      return mySelectedEvents[DateFormat('yyyy-MM-dd').format(dateTime)]!;
    } else {
      return [];
    }
  }

  _showAddEventDialog() async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Add New Event',
          textAlign: TextAlign.center,
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              controller: descpController,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            child: const Text('Add Event'),
            onPressed: () {
              addSchedule();
              if (titleController.text.isEmpty &&
                  descpController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('일정을 입력해주세요'),
                    duration: Duration(seconds: 2),
                  ),
                );

                return;
              } else {
                setState(() {
                  if (mySelectedEvents[
                          DateFormat('yyyy-MM-dd').format(_selectedDate!)] !=
                      null) {
                    mySelectedEvents[
                            DateFormat('yyyy-MM-dd').format(_selectedDate!)]
                        ?.add({
                      "eventTitle": titleController.text,
                      "eventDescp": descpController.text,
                    });
                  } else {
                    mySelectedEvents[
                        DateFormat('yyyy-MM-dd').format(_selectedDate!)] = [
                      {
                        "eventTitle": titleController.text,
                        "eventDescp": descpController.text,
                      }
                    ];
                  }
                });
                setState(() {
                  getAll();
                });

                titleController.clear();
                descpController.clear();
                Navigator.pop(context);
                return;
              }
            },
          )
        ],
      ),
    );
  }

//-----일정입력
  Future<int> addSchedule() async {
    Schedule schedule = Schedule(
        title: titleController.text.trim(),
        content: descpController.text.trim(),
        initdate: _selectedDate.toString().split(' ')[0],
        user_uid: userId);
    await handler.insertSchedule(schedule);

    return 0;
  }

//-----sqLite 데이터 베이스에서 모든 데이터 가져오기
  void getAll() {
    setState(() {
      mySelectedEvents = {};

      listFuture = handler.querySchedule(userId);

      listFuture.then((value) {
        for (var i in value) {
          if (mySelectedEvents[i.initdate] != null) {
            mySelectedEvents[i.initdate]?.add(
                {"eventTitle": i.title, "eventDescp": i.content, "id": i.id});
          } else {
            mySelectedEvents[i.initdate] = [
              {"eventTitle": i.title, "eventDescp": i.content, "id": i.id}
            ];
          }
        }
      });
    });
  }

//----일정삭제
  deleteDialog(int id) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('일정삭제'),
          content: const Text('해당 일정을 삭제하시겠습니까?'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('취소')),
            TextButton(
                onPressed: () {
                  deleteSchedule(id);
                  setState(() {
                    getAll();
                  });
                  Navigator.of(context).pop();
                },
                child: const Text(
                  '확인',
                  style: TextStyle(color: Colors.red),
                )),
          ],
        );
      },
    );
  }

//--데이터 삭제
  Future<int> deleteSchedule(int id) async {
    // int deleteId = int.parse(id);
    await handler.deleteSchedule(id);

    return 0;
  }

//-------데이터 백업
  backupCalendar() async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/calendar_semi/calendar_delete.jsp?id=$userId');
    var response = await http.get(url);
    listFuture.then(
      (value) async {
        for (var i in value) {
          var url = Uri.parse(
              'http://localhost:8080/Flutter/calendar_semi/calendar_backup.jsp?uid=$userId&title=${i.title}&content=${i.content}&initdate=${i.initdate}');
          await http.get(url);
        }
      },
    );
    Get.defaultDialog(
      title: '백업완료',
      middleText: '백업을 완료했습니다',
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('확인'),
        ),
      ],
    );
  }

  //로그인 데이터 가져오기
  _initSharedPreferences() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      userId = (pref.getString('userid'))!;
    });
  }

  //--------데이터 베이스에서 일정정보 가져오기
  importCalendar() async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/calendar_semi/calendar_import.jsp?user_uid=$userId');
    var response = await http.get(url);

    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));

    List result = dataConvertedJSON['results'];
    deleteScheduleAll(userId);

    for (var i in result) {
      print(i['ctitle'] + i['ccontent'] + i['cinitdate']);
      importInsert(i['ctitle'], i['ccontent'], i['cinitdate']);
    }
  }

// mysql데이터베이스에서 가져온 일정 데이터 삽입
  importInsert(String title, String content, String initdate) async {
    DateTime datetimeInitdate = DateTime.parse(initdate);
    String initdateStr = DateFormat('yyyy-MM-dd').format(datetimeInitdate);

    Schedule schedule = Schedule(
        title: title,
        content: content,
        initdate: initdateStr,
        user_uid: userId);
    await handler.insertSchedule(schedule);
  }

//기존데이터 삭제
  Future<int> deleteScheduleAll(String userId) async {
    // int deleteId = int.parse(id);
    await handler.deleteScheduleAll(userId);

    return 0;
  }

//로그인정보 삭제
  deleteUserInfo() async {
    final prefs = await SharedPreferences.getInstance();

    prefs.remove('userid');
  }
}
