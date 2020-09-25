import 'dart:io';
import 'package:dio/dio.dart';

const token = 'ecc33654d92812ef6b1387eb724e8344';
const url = 'https://www.cepaberto.com/api/v3/nearest';

class CepAbertoService {
  final Dio dio = Dio();

  Future<String> getLocalizationFromLatLong(double lat, double long) async {
    final params = {'lat': lat, 'lng': long};
    dio.options.headers[HttpHeaders.authorizationHeader] = 'Token token=$token';

    try {
      final response =
          await dio.get<Map<String, dynamic>>(url, queryParameters: params);

      if (response.data.isEmpty) {
        return Future.error('Coordenadas Inválidas');
      }

      final city = response.data['cidade']['nome'];
      final state = response.data['estado']['sigla'];

      final localization = '$city, $state';

      return localization;
    } on DioError catch (e) {
      return Future.error('Erro ao buscar coordenadas');
    }
  }
}
