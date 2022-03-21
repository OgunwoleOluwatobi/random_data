import 'dart:developer' as dev;

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:random_data/core/utils/exports.dart';
import 'package:stacked_services/stacked_services.dart' as stacked;
import '../../utils/network_utils.dart' as network_utils;

/// Helper service that abstracts away common HTTP Requests
class HttpServiceImpl extends HttpService {
  final stacked.NavigationService _navigationService = locator<stacked.NavigationService>();

  final _dio = Dio(BaseOptions(connectTimeout: 50000));

  @override
  setHeader() {
    final Map<String, dynamic> header = {
      'content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyMzQ4MTYzODU3ODc4IiwiaWF0IjoxNjQ3ODkxNTkyLCJleHAiOjE2NDc5Nzc5OTJ9.SRSySm0_FAAm3fwqmly49zO8BuVt7Wiy1dWBv4rrNeb41LDndxkJf8luS8UOEr8xqK2lDUGAhgSiKYgfidFuKQ',
      'sourceappid': 'ckpu7zo0p0000gg5436coo7xs'
    };

    _dio.options.headers.addAll(header);
  }

  @override
  void dispose() {
    _dio.clear();
    _dio.close(force: true);
  }

  @override
  clearHeaders() {
    _dio.options.headers.clear();
  }

  @override
  Future getHttp(String route, {Map<String, dynamic>? params}) async {
    late Response response;
    params?.removeWhere((key, value) => value == null);
    late final String fullRoute;
    fullRoute = '${dotenv.env['API']}$route';
      if(dotenv.env['APP_DEBUG'] == 'true') {
        Logger.d('[GET] Sending $params to $fullRoute');
      }
    

    try {
      setHeader();
      response = await _dio.get(
        fullRoute,
        queryParameters: params,
        options: Options(
          contentType: 'application/json',
        ),
      );
    } on DioError catch (e) {
      
      if(dotenv.env['APP_DEBUG'] == 'true') {
        Logger.e('HttpService: Failed to GET $fullRoute: Error message: ${e.message}');
      }
      
      if(dotenv.env['APP_DEBUG'] == 'true') {
        debugPrint('Http response data is: ${e.response?.data}');
      }

      if (e.response?.statusCode == 401) {
        throw const AuthException('Session Expired');
      }
      return e.response?.data;
    } catch (e) {
      debugPrint(e.toString());
    }

    if(dotenv.env['APP_DEBUG'] == 'true') {
      Logger.d('Received Response: $response');
      dev.log(response.data.toString());
    }
    return response.data;
  }

}