import 'package:fast_app_base/common/get_it/get_it.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
void initGetIt() => getIt.init();

