import 'package:get_it/get_it.dart';
import 'package:mi_care/service/form_service.dart';
import 'package:mi_care/service/http_service.dart';

Future<void> bootstrap() async {
  GetIt.I.registerFactory(HttpService.new);
  GetIt.I.registerFactory(FormService.new);

  await GetIt.I.allReady();
}
