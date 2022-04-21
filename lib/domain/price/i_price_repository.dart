import 'price_parameters.dart';

abstract class IPriceRepository {
  double getRateForVehTypeAndPricingMethod(PriceParameters priceParameters);
  double calculatePrice(PriceParameters priceParameters);
}
