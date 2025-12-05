import 'package:injectable/injectable.dart';
import 'locator_config.config.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.asNewInstance();

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() => getIt.init();