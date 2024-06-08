import 'dart:async';
import 'dart:convert';
import 'package:chopper/chopper.dart';
import '../error_model/error_model.dart';
import 'json_decode_service/json_decode_service.dart';

typedef JsonFactory<T> = T Function(Map<String, dynamic> json);

// This JsonConverter works with or without a WorkerPool
class JsonSerializableWorkerPoolConverter extends JsonConverter {
  const JsonSerializableWorkerPoolConverter(this.factories, [this.workerPool]);

  final Map<Type, JsonFactory> factories;
  final JsonDecodeServiceWorkerPool? workerPool;

  T? _decodeMap<T>(Map<String, dynamic> values) {
    /// Get jsonFactory using Type parameters
    /// if not found or invalid, throw error or return null

    print('responsedan hemen önce');
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! JsonFactory<T>) {
      /// throw serializer not found error;
      return null;
    }

    final result = jsonFactory(values);

    print('RESPONSE! ${result.runtimeType}');

    return result;
  }

  List<T> _decodeList<T>(Iterable<dynamic> values) =>
      values.where((v) => v != null).map<T>((v) => _decode<T>(v) as T).toList();

  dynamic _decode<T>(
    dynamic entity,
  ) {
    if (entity is Iterable) return _decodeList<T>(entity as List);

    if (entity is Map) return _decodeMap<T>(entity as Map<String, dynamic>);

    return entity;
  }

  @override
  FutureOr<Response<ResultType>> convertResponse<ResultType, Item>(
    Response<dynamic> response,
  ) async {
    print('CONVERT RESPONSE! ${response.body}');

    // use [JsonConverter] to decode json
    final jsonRes = await super.convertResponse(response);

    return jsonRes.copyWith<ResultType>(body: _decode<Item>(jsonRes.body) as ResultType);
  }

  @override
  FutureOr<Response> convertError<ResultType, Item>(Response<dynamic> response) async {
    print('errora girdi ResponseBody --> ${response.body}');

    // use [JsonConverter] to decode json
    final jsonRes = await super.convertError(response);

    return jsonRes.copyWith<ErrorModel>(
      body: ErrorModel.fromJson(jsonRes.body as Map<String, dynamic>),
    );
  }

  @override
  FutureOr<dynamic> tryDecodeJson(String data) async {
    try {
      print('TRY DECODE JSON! ${data}');

      // if there is a worker pool use it, otherwise run in the main thread
      return workerPool != null ? await workerPool!.jsonDecode(data) : jsonDecode(data);
    } catch (error) {
      print(error);

      chopperLogger.warning(error);

      return data;
    }
  }
}



// class JsonSerializableConverter extends JsonConverter {
//   final Map<Type, JsonFactory> factories;

//   const JsonSerializableConverter(this.factories);

//   T? _decodeMap<T>(Map<String, dynamic> values) {
//     /// Get jsonFactory using Type parameters
//     /// if not found or invalid, throw error or return null
//     final jsonFactory = factories[T];
//     if (jsonFactory == null || jsonFactory is! JsonFactory<T>) {
//       /// throw serializer not found error;
//       return null;
//     }

//     return jsonFactory(values);
//   }

//   List<T> _decodeList<T>(Iterable<dynamic> values) {
//     // print('RESPONSE LIST');

//     return values.where((v) => v != null).map<T>((v) => _decode<T>(v) as T).toList();
//   }

//   dynamic _decode<T>(dynamic entity) {
//     if (entity is Iterable) return _decodeList<T>(entity as List);

//     if (entity is Map) return _decodeMap<T>(entity as Map<String, dynamic>);

//     return entity;
//   }

//   @override
//   FutureOr<Response<ResultType>> convertResponse<ResultType, Item>(
//     Response<dynamic> response,
//   ) async {
//     // print('RESPONSE! ${response.body}');
//     // use [JsonConverter] to decode json
//     final jsonRes = await super.convertResponse(response);

//     return jsonRes.copyWith<ResultType>(body: _decode<Item>(jsonRes.body) as ResultType);
//   }

//   @override
//   // all objects should implements toJson method
//   // ignore: unnecessary_overrides
//   Request convertRequest(Request request) => super.convertRequest(request);

//   @override
//   FutureOr<Response<dynamic>> convertError<ResultType, Item>(
//     Response<dynamic> response,
//   ) async {
//     print(
//       'error yeriririew ${response.body}',
//     );

//     // use [JsonConverter] to decode json
//     final jsonRes = await super.convertError(response);

//     return jsonRes.copyWith<ErrorModel>(
//       body: ErrorModel.fromJson(jsonRes.body as Map<String, dynamic>),
//     );
//   }

//   @override
//   FutureOr<dynamic> tryDecodeJson(String data) async {
//     try {
//       // if there is a worker pool use it, otherwise run in the main thread
//       return super.tryDecodeJson(data);
//     } catch (error) {
//       print(error);

//       return data;
//     }
//   }
// }
