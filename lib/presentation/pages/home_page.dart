import 'package:flutter/material.dart';
import 'package:price_calculator/domain/price/i_price_repository.dart';
import 'package:price_calculator/domain/price/price_parameters.dart';
import 'package:price_calculator/injection.dart';
import 'package:price_calculator/presentation/pages/price/widgets/duration_dropdown.dart';
import 'package:price_calculator/presentation/pages/price/widgets/vehicle_dropdown.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _price = 0;
  final vehicleCountController = TextEditingController();
  final priceMethodController = TextEditingController();
  String durationDropdownValue = 'Daily';
  String vehicleDropDownValue = 'Charter';

  void _calculatePrice() {
    setState(() {
      PriceParameters priceParameters = PriceParameters.fromInput(
          vehicleDropDownValue,
          int.parse(vehicleCountController.text),
          durationDropdownValue,
          int.parse(priceMethodController.text));
      print(priceParameters);
      _price = getIt<IPriceRepository>().calculatePrice(priceParameters);
      print(_price);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DropdownButton<String>(
                value: vehicleDropDownValue,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style:
                    const TextStyle(color: Color.fromARGB(255, 53, 103, 229)),
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
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: vehicleCountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Vehicle Count',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              DropdownButton<String>(
                value: durationDropdownValue,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style:
                    const TextStyle(color: Color.fromARGB(255, 53, 103, 229)),
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
              ),
              TextField(
                controller: priceMethodController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Pricing Method Unit',
                ),
              ),
              Text(
                '$_price',
                style: Theme.of(context).textTheme.headline4,
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: _calculatePrice,
                child: const Text('Calculate Price'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
