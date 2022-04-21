import 'package:flutter/material.dart';

class VehicleDropdown extends StatefulWidget {
  const VehicleDropdown({Key? key}) : super(key: key);

  @override
  State<VehicleDropdown> createState() => _VehicleDropdownState();
}

class _VehicleDropdownState extends State<VehicleDropdown> {
  String vehicleDropDownValue = 'Charter';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: vehicleDropDownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Color.fromARGB(255, 53, 103, 229)),
      underline: Container(
        height: 2,
        color: const Color.fromARGB(255, 53, 103, 229),
      ),
      onChanged: (String? newValue) {
        setState(() {
          vehicleDropDownValue = newValue!;
        });
      },
      items: <String>[
        'Charter',
        'Mini Bus',
        'Sprinter',
        'Party Bus',
        'Sedan',
        'SUV',
        'Limousine',
        'Trolley'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
