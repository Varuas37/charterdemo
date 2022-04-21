// ignore: file_names
// I have implemented class so as to simulate a real database. Although I have modified a few things here.
// Note: [Updated April 20, 8:05]: At first I thought I wasn't allowed to use a database hence I chose to use this route.
// I should have asked you for clarification. But, I think with the strucutre that we have, it's not a lot of work to just change this database.
import 'package:injectable/injectable.dart';

@singleton
class Database {
  static Map<String, double> values = {
    "Charter Daily": 1000.00,
    "Charter Hourly": 400.00,
    "Charter Distance": 3.50,
    "MiniBus Daily": 925.00,
    "MiniBus Hourly": 360.00,
    "MiniBus Distance": 3.25,
    "Sprinter Daily": 850.00,
    "Sprinter Hourly": 320.00,
    "Sprinter Distance": 3.00,
    "PartyBus Daily": 775.00,
    "PartyBus Hourly": 280.00,
    "PartyBus Distance": 2.75,
    "Sedan Daily": 700.00,
    "Sedan Hourly": 240.00,
    "Sedan Distance": 2.50,
    "SUV Daily": 625.00,
    "SUV Hourly": 200.00,
    "SUV Distance": 2.25,
    "Limousine Daily": 550.00,
    "Limousine Hourly": 160.00,
    "Limousine Distance": 2.00,
    "Trolley Daily": 475.00,
    "Trolley Hourly": 120.00,
    "Trolley Distance": 1.75,
  };

  double getValue(String key) {
    if (values.containsKey(key)) {
      return values[key]!;
    } else {
      throw 'value does not exist in the database';
    }
  }
}
