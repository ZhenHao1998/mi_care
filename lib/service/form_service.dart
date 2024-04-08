import 'package:get_it/get_it.dart';
import 'package:mi_care/model/form_data.dart';
import 'package:mi_care/service/http_service.dart';

class FormService {
  final httpService = GetIt.I<HttpService>();

  Future<bool> submitForm({required FormData formData}) async {
    return httpService.get(param: formData.toJson()).then((value) {
      if (value != null && value.statusCode == 200) {
        return true;
      }

      return false;
    });
  }
}
