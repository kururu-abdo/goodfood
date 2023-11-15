import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:goodfoods/core/data/network/app_exceptions.dart';
import 'package:goodfoods/core/utils/shared_prefs.dart';
import 'package:goodfoods/core/utils/utils.dart';
import 'package:goodfoods/main.dart';
import 'package:http/http.dart' as http;

class ApiBaseHelper {
  final String _baseUrl = "https://goodfoodsa.co/api/";
  String get token => sharedPrefs.token;
   Map<String, String>? requestHeaders;
   ApiBaseHelper(){
requestHeaders = {
      //  'Content-type': 'application/json',
       'Accept': 'application/json',
       'Authorization': 'Bearer ${token.trim()}'
     };
   }
   
  Future<dynamic> get(String url ,{String? pageUrl ,bool? isPaginate=false}) async {
    print('Api Get, url $url');
     log(requestHeaders.toString());
    var responseJson;
    try {
      final response = await http.get(
        
        
        Uri.parse(
          
          isPaginate!?pageUrl!:
          _baseUrl + url),
      
      headers: requestHeaders??{}
      );
      responseJson = _returnResponse(response);
    } on SocketException {
     
      throw FetchDataException('No Internet connection');
    }
    print('api get recieved!');
    return responseJson;
  }

  Future<dynamic> post(String url, dynamic body ,
  
  ) async {
    print('Api Post, url ${_baseUrl + url}');
    var responseJson;
    try {

      requestHeaders!.addAll({'Content-type': 'application/json'});
      log(requestHeaders.toString());
      final response = await http.post
      (Uri.parse(_baseUrl + url),
       body: body
      
      ,
            headers: (requestHeaders ?? {})
            
            
,

      );
      
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    } catch (e){
      log("POST $e");
      throw Exception(e.toString());
    }
    print('api post.');
    return responseJson;
  }

  Future<dynamic> put(String url, dynamic body) async {
    print('Api Put, url $url');
    var responseJson;
    try {
      final response = await http.put(Uri.parse(_baseUrl + url), body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api put.');
    print(responseJson.toString());
    return responseJson;
  }

  Future<dynamic> delete(String url) async {
    print('Api delete, url $url');
    var apiResponse;
    try {
      final response = await http.delete(Uri.parse(_baseUrl + url));
      apiResponse = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api delete.');
    return apiResponse;
  }
}

dynamic _returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
    case 201:
     if (response.body.isEmpty) {
       return json.decode({}.toString());
     }
      var responseJson = json.decode(response.body.toString());
      print(responseJson);
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
     logout(navigatorKey.currentContext!);
     throw UnauthorisedException('Wrong email/password');
    
    case 403:
      throw UnauthorisedException('Session Expired');
    case 500:
    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}