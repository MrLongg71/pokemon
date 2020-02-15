import 'package:dio/dio.dart';

class APIPokemon {
  static Dio getAPI() {
    BaseOptions options = new BaseOptions(
        baseUrl: "https://pokeapi.co/api/",
        connectTimeout: 30000,
        receiveTimeout: 5000);
    Dio dio = new Dio(options);
    return dio;
  }
  static Dio APIUrl() {
    BaseOptions options = new BaseOptions(
        baseUrl: "",
        connectTimeout: 30000,
        receiveTimeout: 5000);
    Dio dio = new Dio(options);
    return dio;
  }
}
