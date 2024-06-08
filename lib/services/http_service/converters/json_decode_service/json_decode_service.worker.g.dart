// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_decode_service.dart';

// **************************************************************************
// Generator: WorkerGenerator 2.4.2
// **************************************************************************

/// WorkerService class for JsonDecodeService
class _$JsonDecodeServiceWorkerService extends JsonDecodeService
    implements WorkerService {
  _$JsonDecodeServiceWorkerService() : super();

  @override
  Map<int, CommandHandler> get operations => _operations;

  late final Map<int, CommandHandler> _operations =
      Map.unmodifiable(<int, CommandHandler>{
    _$jsonDecodeId: ($) => jsonDecode($.args[0]),
  });

  static const int _$jsonDecodeId = 1;
}

/// Service initializer for JsonDecodeService
WorkerService $JsonDecodeServiceInitializer(WorkerRequest startRequest) =>
    _$JsonDecodeServiceWorkerService();

/// Operations map for JsonDecodeService
@Deprecated(
    'squadron_builder now supports "plain old Dart objects" as services. '
    'Services do not need to derive from WorkerService nor do they need to mix in '
    'with \$JsonDecodeServiceOperations anymore.')
mixin $JsonDecodeServiceOperations on WorkerService {
  @override
  // not needed anymore, generated for compatibility with previous versions of squadron_builder
  Map<int, CommandHandler> get operations => WorkerService.noOperations;
}

/// Worker for JsonDecodeService
class JsonDecodeServiceWorker extends Worker implements JsonDecodeService {
  JsonDecodeServiceWorker({PlatformWorkerHook? platformWorkerHook})
      : super($JsonDecodeServiceActivator,
            platformWorkerHook: platformWorkerHook);

  @override
  Future<dynamic> jsonDecode(String source) =>
      send(_$JsonDecodeServiceWorkerService._$jsonDecodeId, args: [source]);
}

/// Worker pool for JsonDecodeService
class JsonDecodeServiceWorkerPool extends WorkerPool<JsonDecodeServiceWorker>
    implements JsonDecodeService {
  JsonDecodeServiceWorkerPool(
      {ConcurrencySettings? concurrencySettings,
      PlatformWorkerHook? platformWorkerHook})
      : super(
            () =>
                JsonDecodeServiceWorker(platformWorkerHook: platformWorkerHook),
            concurrencySettings: concurrencySettings);

  @override
  Future<dynamic> jsonDecode(String source) =>
      execute((w) => w.jsonDecode(source));
}
