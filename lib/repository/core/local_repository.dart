import 'package:injectable/injectable.dart';

import '../../domain/price/enums.dart';

import 'data/database.dart';
import 'i_cache.dart';

@LazySingleton(as: ICache)
class LocalRepository implements ICache {
  // In other cases, this Database class could actually be the sqllite database or any database for that matter.
  final Database data;
  LocalRepository(this.data);

  @override
  double getRate(VehicleType type, PricingMethods method) {
    String key = "${type.name} ${method.name}";
    return data.getValue(key);
  }
}
