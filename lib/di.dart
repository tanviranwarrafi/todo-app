import 'package:app/libraries/formatters.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<Formatters>(Formatters.new);
}
