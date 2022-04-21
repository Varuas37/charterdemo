import 'package:injectable/injectable.dart';
import '../../domain/price/i_price_repository.dart';
import '../../domain/price/price_parameters.dart';
import '../core/i_cache.dart';

@LazySingleton(as: IPriceRepository)
class PriceRepository implements IPriceRepository {
  final ICache _localRepository;
  PriceRepository(this._localRepository);

  @override
  double getRateForVehTypeAndPricingMethod(PriceParameters priceParameters) {
    return _localRepository.getRate(
        priceParameters.vehicleType, priceParameters.pricingMethod);
  }

  @override
  double calculatePrice(PriceParameters priceParameters) {
    double rateForTypeAndPricingMethod =
        getRateForVehTypeAndPricingMethod(priceParameters);
    return priceParameters.vehicleCount *
        rateForTypeAndPricingMethod *
        priceParameters.pricingMethodUnit;
  }
}
