import 'package:flutter/material.dart';

class DatePickerScreen extends StatefulWidget {
  const DatePickerScreen({super.key});

  @override
  State<DatePickerScreen> createState() => _DatePickerScreenState();
}

class _DatePickerScreenState extends State<DatePickerScreen> {
  DateTime selectDate = DateTime.now();

  TimeOfDay time = TimeOfDay.now();
  DateTimeRange dateRange =
      DateTimeRange(start: DateTime.now(), end: DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date Picker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${selectDate.toString().substring(0, 11)}'),
            ElevatedButton(
                onPressed: () async {
                  DateTime? selectDated = await showDatePicker(
                      context: context,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2030));
                  if (selectDated != null) {
                    setState(() {
                      selectDate = selectDated;
                    });
                  }
                },
                child: Text('Date')),
            SizedBox(
              height: 30,
            ),
            Text(
                '${dateRange.start.toString().substring(0, 11)} - ${dateRange.end.toString().substring(0, 11)}'),
            ElevatedButton(
                onPressed: () async {
                  DateTimeRange? selectDated = await showDateRangePicker(
                      context: context,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2030));
                  if (selectDated != null) {
                    setState(() {
                      dateRange = selectDated;
                    });
                  }
                },
                child: Text('Date')),
            SizedBox(
              height: 30,
            ),
            Text('${time.toString().substring(10, 15)}'),
            ElevatedButton(
                onPressed: () async {
                  TimeOfDay? selectTime =
                      await showTimePicker(context: context, initialTime: time);

                  if (selectTime != null) {
                    setState(() {
                      time = selectTime;
                    });
                  }
                },
                child: Text('Date')),
          ],
        ),
     ),
);
}
}
