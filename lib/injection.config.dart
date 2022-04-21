// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'domain/price/i_price_repository.dart' as _i6;
import 'repository/core/data/database.dart' as _i3;
import 'repository/core/i_cache.dart' as _i4;
import 'repository/core/local_repository.dart' as _i5;
import 'repository/price/price_repository.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.Database>(_i3.Database());
  gh.lazySingleton<_i4.ICache>(() => _i5.LocalRepository(get<_i3.Database>()));
  gh.lazySingleton<_i6.IPriceRepository>(
      () => _i7.PriceRepository(get<_i4.ICache>()));
  return get;
}
