import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:quizator/services/log/my_logger.dart';

@immutable
class MyHttpLoggingInterceptor implements RequestInterceptor, ResponseInterceptor {
  /// {@macro http_logging_interceptor}
  const MyHttpLoggingInterceptor();

  @override
  FutureOr<Request> onRequest(Request request) async {
    final base = await request.toBaseRequest();

    var startRequestMessage = '--> ${base.method} ${base.url}';
    var bodyMessage = '';
    if (base is http.Request) {
      if (base.body.isNotEmpty) {
        bodyMessage = base.body;

        startRequestMessage += ' (${base.bodyBytes.length}-byte body)';
      }
    }

    myLogger.info(startRequestMessage);

    base.headers.forEach(
      (k, v) => myLogger.info('[HEADER] $k: $v'),
    );

    if (base.contentLength != null && base.headers['content-length'] == null) {
      myLogger.info('content-length: ${base.contentLength}');
    }

    if (bodyMessage.isNotEmpty) {
      myLogger.info(bodyMessage);
    }

    myLogger.info('--> END ${base.method}');

    return request;
  }

  @override
  FutureOr<Response<dynamic>> onResponse(Response<dynamic> response) {
    final base = response.base;

    var bytes = '';
    var reasonPhrase = response.statusCode.toString();
    var bodyMessage = '';
    if (base is http.Response) {
      if (base.reasonPhrase != null) {
        reasonPhrase += ' ${base.reasonPhrase != reasonPhrase ? base.reasonPhrase : ''}';
      }

      if (base.body.isNotEmpty) {
        bodyMessage = base.body;

        bytes = ' (${response.bodyBytes.length}-byte body)';
      }
    }

    // Always start on a new line
    myLogger.info(
      '<-- $reasonPhrase ${base.request?.method} ${base.request?.url}$bytes',
    );

    base.headers.forEach(
      (k, v) => myLogger.info(
        '$k: $v',
      ),
    );

    if (base.contentLength != null && base.headers['content-length'] == null) {
      myLogger.info('content-length: ${base.contentLength}');
    }

    if (bodyMessage.isNotEmpty) {
      myLogger.info(bodyMessage);
    }

    myLogger.info('<-- END HTTP');

    return response;
  }
}
