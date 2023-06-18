import 'package:dio/dio.dart';

Future<Map<String, dynamic>> autoFill(dynamic requestData) async {
  Dio client = Dio();
  var urlPath ='https://wateraf.onrender.com/Auto_fill';
  var response = await client.post(urlPath, data:requestData);
  Map<String, dynamic> output = response.data;
  return output;
}