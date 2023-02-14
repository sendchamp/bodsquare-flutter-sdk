import 'dart:developer';

import 'package:bodsquare_sdk/helpers/storage_service.dart';
import 'package:dio/dio.dart';

// import 'package:logger/logger.dart' as logging;

// import '../../services/db_service.dart';

class TokenCheckInterceptor extends InterceptorsWrapper {
  final List<String> ignoredRoutes = ['/open/auth/login'];

  // final _dbService = Get.find<DbService>();

  final StorageService _storageService = StorageService();

// Check for token on request
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // if request path is contained in [ignoredRoutes], do nothing
    if (ignoredRoutes.contains(options.path)) {
    }
    // Else check for the token
    else {
      // If its absent,
      if (!options.headers.containsKey('Authorization')) {
        // var token = _dbService.token;
        var token = await _storageService.getString('token');

        // If its in cache, use it
        if (token != null) {
          //log('token gotten: $token');
          options.headers['AccessKey'] = 'Bearer $token';

          //log('Successfully added $token to header');
          return handler.next(options);
        } else {
          // return [ErrorResponse] asking for auth header.
          return handler.reject(
            DioError(
              error: 'Authorization header not found',
              requestOptions: options,
            ),
          );
        }
      } else {
        /* loggerNoStack.v(
            'Found token: Authorization: ${options.headers['Authorization']}'); */
      }
    }
    //log('onRequest: ${options.headers}');
    return super.onRequest(options, handler);
  }
}
