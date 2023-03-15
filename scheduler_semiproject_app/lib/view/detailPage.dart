import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final DateTime selecetDate;
  const DetailPage({super.key, required this.selecetDate});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late DateTime selectDate;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectDate = widget.selecetDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('스케쥴 입력'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              DatePickerDialog(
                initialDate: selectDate, //선택된 날짜
                firstDate: DateTime(2022),
                lastDate: DateTime(2023),
              ),
              // SizedBox(
              //   height: 300,
              //   child: CupertinoDatePicker(
              //     minimumDate: DateTime(2010, 01, 01),
              //     minimumYear: 1900,
              //     maximumYear: DateTime.now().year,
              //     initialDateTime: DateTime.now(),
              //     maximumDate: DateTime.now(),
              //     onDateTimeChanged: (value) {
              //       //
              //       print(value);
              //     },
              //     mode: CupertinoDatePickerMode.date,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
