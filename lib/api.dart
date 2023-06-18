import 'package:dio/dio.dart';
Future<String> callApi(dynamic requestData,int num) async {
  Dio client = Dio();
  var urlPath = 'https://waterquality-tkjy.onrender.com/water_quality';
  var response = await client.post(urlPath, data: requestData,queryParameters: {"mdl":num});
  String output = response.data.toString();
  return output;
}