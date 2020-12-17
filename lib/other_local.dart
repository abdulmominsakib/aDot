import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:aDot/components.dart';

class TestWidget extends StatefulWidget {
  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    var myLocale = context.locale.toString();
    print(myLocale);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            gradientStartColor,
            gradientEndColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.3, 0.7],
        ),
      ),
      child: Scaffold(
        bottomNavigationBar: BottomNavigation(),
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'This is just For Demo Purpose',
                style: TextStyle(color: Colors.white),
              ).tr(),
              SizedBox(height: 100),
              Center(
                child: Container(
                  child: Text(
                    "${DateFormat.yMMMEd(myLocale).format(selectedDate)}",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 100),
              ElevatedButton(
                onPressed: () {
                  _selectDate(context);
                },
                child: Text('Show Date Picker').tr(),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Back To Home').tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
