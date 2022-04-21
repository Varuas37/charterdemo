import 'package:flutter/material.dart';

class DurationDropdown extends StatefulWidget {
  const DurationDropdown({Key? key}) : super(key: key);

  @override
  State<DurationDropdown> createState() => _DurationDropdownState();
}

class _DurationDropdownState extends State<DurationDropdown> {
  String durationDropdownValue = 'Daily';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: durationDropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Color.fromARGB(255, 53, 103, 229)),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          durationDropdownValue = newValue!;
        });
      },
      items: <String>[
        'Daily',
        'Hourly',
        'Distance',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
