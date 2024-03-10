import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

const String serverUrl =
    "https://mandarin-express-bot.nsnoob.one/api/v1/tracking/received_in_china";
const String sendSuccessMessage = "Успешно отправлено";
const String sendErrorMessage = "Не отправлено";

class ScanSerivce {
  final Dio _dio = Dio();

  Future<void> sendQrCodeToServer(String code) async {
    EasyLoading.show();
    try {
      var response = await _dio.post("$serverUrl?code=$code");
      if ([200, 201].contains(response.statusCode)) {
        EasyLoading.showSuccess(sendSuccessMessage);
      } else {
        EasyLoading.showError(sendErrorMessage);
      }
    } catch (e) {
      EasyLoading.showError(sendErrorMessage);
    }
  }
}
