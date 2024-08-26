import 'dart:async';
import 'dart:io';
//import 'package:googleapis/androidenterprise/v1.dart';
//import 'package:googleapis/websecurityscanner/v1.dart';
import 'package:http/http.dart' as http;
//import 'package:googleapis/youtube/v3.dart' as youtube;
//import 'package:googleapis/youtube/v3.dart' as drive;
// import 'package:rpsp/app/shared/share_prefs/storage_prefs.dart';

import 'app_exceptions.dart';
//import 'package:rpsp_main/app/modules/bible/components/book_modal.dart';

class UnKnowApiException implements Exception {
  int httpCode;

  UnKnowApiException(this.httpCode);
}

class ItemNotFoundException implements Exception {}

class NetworkException implements Exception {}

class BaseAPI {
  // final _prefs = StoragePrefs();

  final String url;
  final dynamic body;
  final Map<String, dynamic>? queryParameters;

  BaseAPI({
    required this.url,
    this.body,
    this.queryParameters,
  });

  late Uri uri;
  late String token;
  final duration = const Duration(seconds: 10);

  Uri initUri() {
    // token = _prefs.token;

    token = 'AIzaSyDjDX_6U5yst7tRflqdm6N5ZofgJ64uUNg';

    //token = 'b520c010beef91e3c1b31dc768112017f36b1228';

    // Heroku

    // uri = Uri(
    //   scheme: 'https',
    //   host: 'ultrasonic-center.herokuapp.com',
    //   path: url,
    // );
    // return uri;

    //Vps

    uri = Uri(
      scheme: 'http',
      host: '35.209.63.228',
      port: 8500,
      path: 'apis/$url',
      queryParameters: queryParameters,
    );
    print('url: $uri');
    return uri;
  }

  Future<http.Response> post() async {
    initUri();
    try {
      final response = await http.post(uri, body: body, headers: {
        'Content-Type': 'application/json',
      }).timeout(duration);
      return response;
    } on TimeoutException catch (e) {
      throw FetchDataException('No hay conexión a internet', e.message);
    } on SocketException catch (e) {
      throw FetchDataException('No hay conexión a internet', e.message);
    } on Error catch (e) {
      throw FetchDataException('$e', uri.toString());
    }
  }

  Future<http.Response> postToken() async {
    initUri();
    try {
      final response = await http.post(uri, body: body, headers: {
        'Content-Type': 'application/json',
        'x-token': token
      }).timeout(duration);
      return response;
    } on TimeoutException catch (e) {
      throw FetchDataException('No hay conexión a internet', e.message);
    } on SocketException catch (e) {
      // print('error: $e');
      throw FetchDataException('No hay conexión a internet', e.message);
    } on Error catch (e) {
      throw FetchDataException('$e', uri.toString());
    }
  }

  Future<http.Response> get() async {
    initUri();

    try {
      final response = await http.get(uri, headers: {
        'Content-Type': 'application/json',
        'x-token': token
      }).timeout(duration);
      return response;
    } on TimeoutException catch (e) {
      throw FetchDataException('No hay conexión a internet', e.message);
    } on SocketException catch (e) {
      throw FetchDataException('No hay conexión a internet', e.message);
    } on Error catch (e) {
      throw FetchDataException('$e', uri.toString());
    }
  }

  Future<http.Response> put() async {
    initUri();

    try {
      final response = await http.put(uri, body: body, headers: {
        'Content-Type': 'application/json',
        'x-token': token
      }).timeout(duration);
      return response;
    } on TimeoutException catch (e) {
      throw FetchDataException('No hay conexión a internet', e.message);
    } on SocketException catch (e) {
      throw FetchDataException('No hay conexión a internet', e.message);
    } on Error catch (e) {
      throw FetchDataException('$e', uri.toString());
    }
  }

  Future<http.Response> putNoToken() async {
    initUri();

    try {
      final response = await http.put(uri,
          body: body,
          headers: {'Content-Type': 'application/json'}).timeout(duration);
      return response;
    } on TimeoutException catch (e) {
      throw FetchDataException('No hay conexión a internet', e.message);
    } on SocketException catch (e) {
      throw FetchDataException('No hay conexión a internet', e.message);
    } on Error catch (e) {
      throw FetchDataException('$e', uri.toString());
    }
  }

  Future<http.Response> delete() async {
    initUri();
    try {
      final response =
          await http.delete(uri, headers: {'x-token': token}).timeout(duration);
      return response;
    } on TimeoutException catch (e) {
      throw FetchDataException('No hay conexión a internet', e.message);
    } on SocketException catch (e) {
      throw FetchDataException('No hay conexión a internet', e.message);
    } on Error catch (e) {
      throw FetchDataException('$e', uri.toString());
    }
  }

  Future<http.Response> fetchVerse() async {
    initUri();

    try {
      final response = await http.get(uri, headers: {
        'Content-Type': 'application/json',
        'x-token': token
      }).timeout(duration);

      return response;
    } on TimeoutException catch (e) {
      throw FetchDataException('No hay conexión a internet', e.message);
    } on SocketException catch (e) {
      throw FetchDataException('No hay conexión a internet', e.message);
    } on Error catch (e) {
      throw FetchDataException('$e', uri.toString());
    }
  }
}
