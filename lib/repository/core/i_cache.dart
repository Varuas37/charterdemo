import '../../domain/price/enums.dart';

abstract class ICache {
  double getRate(VehicleType type, PricingMethods method);
}
