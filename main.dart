import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DemoApp(),
    );
  }
}

class DemoApp extends StatefulWidget {
  const DemoApp({Key? key}) : super(key: key);

  @override
  _DemoAppState createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  late DateTime selectedDay;
  late List selectedEvent;
  final Map<DateTime, List> events = {
    DateTime(2020, 12, 12): [
      {'Name': 'Your event name', 'is Done': true},
      {'Name': 'Your event name 2', 'is Done': true},
      {'Name': 'Your event name 3', 'is Done': false},
    ],
    DateTime(2020, 12, 2): [
      {'Name': 'Your event name', 'is Done': false},
      {'Name': 'Your event name 2', 'is Done': true},
      {'Name': 'Your event name 3', 'is Done': false},
    ]
  };

  void _handleData(date) {
    setState(() {
      selectedDay = date;
      selectedEvent = events[selectedDay] ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Calendar'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          child: Calendar(
            startOnMonday: true,
            selectedColor: Colors.black,
            todayColor: Colors.amber,
            eventColor: Colors.green,
            eventDoneColor: Colors.amber,
            bottomBarColor: Colors.green,
            onRangeSelected: (range) {
              print('Selected Day ${range.from},${range.to}');
            },
            isExpanded: true,
            dayOfWeekStyle: TextStyle(
              fontSize: 13,
              color: Colors.black,
              fontWeight: FontWeight.w900,
            ),
            bottomBarTextStyle: TextStyle(
              color: Color.fromARGB(255, 255, 197, 7),
            ),
            hideArrows: false,
            weekDays: ['Mon', 'Tue', 'Wed', 'Thurs', 'Fri', 'Sat', 'Sun'],
          ),
        ),
      ),
    );
  }
}
