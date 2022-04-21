import 'enums.dart';

class PriceParameters {
  VehicleType vehicleType;
  int vehicleCount;
  PricingMethods pricingMethod;
  int pricingMethodUnit;
  PriceParameters(this.vehicleType, this.vehicleCount, this.pricingMethod,
      this.pricingMethodUnit);
  static Map<String, VehicleType> vehicleTypeMap = {
    'Charter': VehicleType.Charter,
    'Mini Bus': VehicleType.MiniBus,
    'Sprinter': VehicleType.Sprinter,
    'Party Bus': VehicleType.PartyBus,
    'Sedan': VehicleType.Sedan,
    'SUV': VehicleType.SUV,
    'Limousine': VehicleType.Limousine,
    'Trolley': VehicleType.Trolley,
  };
  static Map<String, PricingMethods> pricingMap = {
    'Daily': PricingMethods.Daily,
    'Hourly': PricingMethods.Hourly,
    'Distance': PricingMethods.Distance,
  };

  factory PriceParameters.fromInput(String vehicleSelection, int vehicleCount,
      String pricingSelection, int pricingMethodUnit) {
    // We will be making sure that only valid value are passed.
    // This check was added in 8:57pm. After I submitted the project.
    // Have not implemented this check in the front yet. But,I just didn't feel like not checking this.
    if (!vehicleTypeMap.containsKey(vehicleSelection)) {
      throw Exception('Invalid Vehicle Selection Passed');
    }
    if (!pricingMap.containsKey(pricingSelection)) {
      throw Exception('Invalid Pricing Method Passed');
    }
    VehicleType vehicleType = vehicleTypeMap[vehicleSelection]!;
    PricingMethods pricingMethod = pricingMap[pricingSelection]!;
    return PriceParameters(
        vehicleType, vehicleCount, pricingMethod, pricingMethodUnit);
  }
}
