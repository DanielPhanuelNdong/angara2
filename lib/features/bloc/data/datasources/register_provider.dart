import 'package:dio/dio.dart';
import 'package:wiso_cash/features/bloc/data/models/index.dart';

class DataProvider {
  RegisterModelTrue? register;

  RegisterModelTrue? get registerModel {
    return register;
  }

  Future<RegisterModelTrue?> registerUser(var data, String url) async {
    var dio =
        Dio(BaseOptions(baseUrl: "https://metierangarapay.sowitelsrv.com/"));
    try {
      var formData = FormData.fromMap(data);
      Response response = await dio.post(url, data: formData);
      if (response.statusCode == 200) {
        register = registerModelTrueFromJson(response.toString());

        return registerModelTrueFromJson(response.toString());
      }
    } on DioException catch (e) {
      print(e);
      // if (e.error is SocketException || e.type == DioExceptionType.other) {
      //   rethrow;
      // }
      // if (e.type == DioExceptionType.response) {
      //   return null;
      // }
    }
    return null;
  }

  Future<RegisterModelTrue?> envoieWallet(var data, String url) async {
    var dio =
        Dio(BaseOptions(baseUrl: "https://metierangarapay.sowitelsrv.com/"));
    try {
      var formData = FormData.fromMap(data);
      Response response = await dio.post(url, data: formData);
      if (response.statusCode == 200) {
        register = registerModelTrueFromJson(response.toString());

        return registerModelTrueFromJson(response.toString());
      }
    } on DioException catch (e) {
      print(e);
      // if (e.error is SocketException || e.type == DioExceptionType.other) {
      //   rethrow;
      // }
      // if (e.type == DioExceptionType.response) {
      //   return null;
      // }
    }
    return null;
  }
}
