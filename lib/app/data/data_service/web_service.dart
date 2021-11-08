import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:local/app/data/data_service/server_configs.dart';
import 'package:local/app/utils/user_prefs.dart';


class WebService{
  var dio = Dio();

  static final shared = WebService();

  Future<Map<String, dynamic>?> getApiDIO(
      {required String path, Map<String, dynamic>? queryParameters}) async {

    try{

      print('URL: ' + ServerConfigs.baseURL + path);

   final user = await  UserPrefs.shared.getUser;

   print('token : Bearer ${user.token}');

      final req = Response(data: queryParameters, requestOptions: RequestOptions(
          path: ''
      ));

      print('queryParam: $req');

      Response<Map<String, dynamic>> cool = await dio.get<Map<String, dynamic>>(ServerConfigs.baseURL + path,queryParameters: queryParameters,options: Options(
        headers: {
          'Authorization': 'Bearer ' + user.token

        }
      ));

      print('Res: $cool');

      return handleResponse(cool);

    } on SocketException {
      throw 'No Internet connection';
    } on DioError catch(e){
      switch(e.type){
        case DioErrorType.connectTimeout:
          throw 'Connection timeOut';
        case DioErrorType.sendTimeout:
          throw 'Connection timeOut';
        case DioErrorType.receiveTimeout:
          throw 'Connection timeOut';
        case DioErrorType.response:
          throw 'Something went wrong.';
        case DioErrorType.cancel:
          throw 'Request Canceled by user';
        case DioErrorType.other:
          throw 'Something went wrong.';
      }
    }catch(e){
      rethrow;
    }

  }

  Future<Map<String, dynamic>?> postApiDIO({required String path,data,Map<String, dynamic>? queryParameters}) async {

    try{

      print('URL: ' + ServerConfigs.baseURL + path);

      final user = await  UserPrefs.shared.getUser;

      print('token: Bearer ${user.token}');


      if(!kReleaseMode){
        final req = Response(data: data, requestOptions: RequestOptions(
            path: ''
        ));
        print('Req: $req');
      }

      Response<Map<String, dynamic>> cool = await dio.post<Map<String, dynamic>>(ServerConfigs.baseURL + path,data: data,queryParameters: queryParameters,
      options: Options(
        headers: {
          'Authorization': 'Bearer ' + user.token
        }
      ));

      print('Res: $cool');

      return handleResponse(cool);

    } on SocketException {
      throw 'No Internet connection';
    } on DioError catch(e){
      switch(e.type){
        case DioErrorType.connectTimeout:
          throw 'Connection timeOut';
        case DioErrorType.sendTimeout:
          throw 'Connection timeOut';
        case DioErrorType.receiveTimeout:
          throw 'Connection timeOut';
        case DioErrorType.response:
          throw 'Something went wrong.';
        case DioErrorType.cancel:
          throw 'Request Canceled by user';
        case DioErrorType.other:
          throw 'Something went wrong.';
      }
    }catch(e){
      rethrow;
    }

  }



  Future<Map<String, dynamic>?> deleteApiDIO({required String path,data,Map<String, dynamic>? queryParameters}) async {

    try{

      print('URL: ' + ServerConfigs.baseURL + path);

      final user = await  UserPrefs.shared.getUser;

      print('token: Bearer ${user.token}');


      if(!kReleaseMode){
        final req = Response(data: data, requestOptions: RequestOptions(
            path: ''
        ));
        print('Req: $req');
      }

      Response<Map<String, dynamic>> cool = await dio.delete<Map<String, dynamic>>(ServerConfigs.baseURL + path,data: data,queryParameters: queryParameters,
          options: Options(
              headers: {
                'Authorization': 'Bearer ' + user.token
              }
          ));

      print('Res: $cool');

      return handleResponse(cool);

    } on SocketException {
      throw 'No Internet connection';
    } on DioError catch(e){
      switch(e.type){
        case DioErrorType.connectTimeout:
          throw 'Connection timeOut';
        case DioErrorType.sendTimeout:
          throw 'Connection timeOut';
        case DioErrorType.receiveTimeout:
          throw 'Connection timeOut';
        case DioErrorType.response:
          throw 'Something went wrong.';
        case DioErrorType.cancel:
          throw 'Request Canceled by user';
        case DioErrorType.other:
          throw 'Something went wrong.';
      }
    }catch(e){
      rethrow;
    }

  }

  Map<String, dynamic>? handleResponse(Response<Map<String, dynamic>> cool){
    try{
      if ((cool.statusCode ?? 0) >= 200 && (cool.statusCode ?? 0) < 300) {
        return cool.data;
      }else{
        throw 'Error occurred while Communication with Server, with StatusCode : ${cool.statusCode}';
      }
    }catch (e){
      rethrow;
    }
  }

}

