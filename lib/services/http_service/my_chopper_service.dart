import 'package:chopper/chopper.dart';
import 'package:squadron/squadron.dart';

import 'converters/json_decode_service/json_decode_service.dart';
import 'converters/json_serializable_worker_pool_converter.dart';
import 'my_chopper_logger.dart';
import 'my_squadron_logger.dart';

class MyChopperService {
  MyChopperService._();
  static final MyChopperService _instance = MyChopperService._();

  static Future<MyChopperService> get instance async {
    _instance.chopper = await _instance.init();

    return _instance;
  }

  late final ChopperClient chopper;

  Future<ChopperClient> init() async {
    // initialize Squadron before using it
    Squadron.setId('chopper_service_worker_pool');
    Squadron.setLogger(MySquadronLogger());
    Squadron.logLevel = SquadronLogLevel.all;
    Squadron.debugMode = true;

    final jsonDecodeServiceWorkerPool = JsonDecodeServiceWorkerPool(
      concurrencySettings: ConcurrencySettings.fourIoThreads,
    );

    await jsonDecodeServiceWorkerPool.start();

    final converter = JsonSerializableWorkerPoolConverter(
      const {
        // Ayah: Ayah.fromJson,
        // Surah: Surah.fromJson,
      },
      // make sure to provide the WorkerPool to the JsonConverter
      jsonDecodeServiceWorkerPool,
    );

    final chopper = ChopperClient(
      baseUrl: Uri.parse('http://185.81.238.242:8080'),
      services: [
        // SurahService.create(),
        // AyahService.create(),
      ],
      converter: converter,
      errorConverter: converter,
      interceptors: [
        const HeadersInterceptor({
          'Content-Type': 'application/json',
          'x-lang': 'tr',
          'Accept-Language': 'tr',
        }),
        const MyHttpLoggingInterceptor(),
        // TalkerHttpLogger(),
      ],
    );

    // ref.onDispose(() {
    //   chopper.dispose();
    //   jsonDecodeServiceWorkerPool.cancel();
    // });

    return chopper;
  }
}

Future<ChopperClient> chopper() async {
  // initialize Squadron before using it
  Squadron.setId('chopper_service_worker_pool');
  Squadron.setLogger(MySquadronLogger());
  Squadron.logLevel = SquadronLogLevel.all;
  Squadron.debugMode = true;

  final jsonDecodeServiceWorkerPool = JsonDecodeServiceWorkerPool(
    concurrencySettings: ConcurrencySettings.fourIoThreads,
  );

  await jsonDecodeServiceWorkerPool.start();

  final converter = JsonSerializableWorkerPoolConverter(
    const {
      // Ayah: Ayah.fromJson,
      // Surah: Surah.fromJson,
    },
    // make sure to provide the WorkerPool to the JsonConverter
    jsonDecodeServiceWorkerPool,
  );

  final chopper = ChopperClient(
    baseUrl: Uri.parse('http://185.81.238.242:8080'),
    services: [
      // SurahService.create(),
      // AyahService.create(),
    ],
    converter: converter,
    errorConverter: converter,
    interceptors: [
      const HeadersInterceptor({
        'Content-Type': 'application/json',
        'x-lang': 'tr',
        'Accept-Language': 'tr',
      }),
      const MyHttpLoggingInterceptor(),
      // TalkerHttpLogger(),
    ],
  );

  // ref.onDispose(() {
  //   chopper.dispose();
  //   jsonDecodeServiceWorkerPool.cancel();
  // });

  return chopper;
}
