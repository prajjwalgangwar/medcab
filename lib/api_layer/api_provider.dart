import 'package:dio/dio.dart';
import 'package:medcab_assignment/api_layer/api_data.dart';
import 'package:medcab_assignment/models/faq_model.dart';

class ApiProvider {
  static Future<FAQResponse?> getFaqDetails() async {
    var dio = Dio();
    var response = await dio.request(
      ApiData.faqURL,
      options: Options(
        method: 'GET',
      ),
    );

    if (response.statusCode == 200) {
      FAQResponse model = FAQResponse.fromJson(response.data);
      print(response.data.runtimeType);
      return model;
    } else {
      print(response.statusMessage);
      return null;
    }
  }
}
