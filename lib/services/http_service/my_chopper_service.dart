import 'package:chopper/chopper.dart';
import 'package:quizator/features/quiz/data/models/quiz_model.dart';
import 'package:quizator/features/quiz/data/services/quiz_service.dart';
import 'package:squadron/squadron.dart';

import 'converters/json_decode_service/json_decode_service.dart';
import 'converters/json_serializable_worker_pool_converter.dart';
import 'my_squadron_logger.dart';

class MyChopperService {
  MyChopperService._();
  static final MyChopperService _instance = MyChopperService._();

  static MyChopperService get instance {
    return _instance;
  }

  late final ChopperClient chopper;

  Future<void> init() async {
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
        QuizModel: QuizModel.fromJson,
        // Surah: Surah.fromJson,
      },
      // make sure to provide the WorkerPool to the JsonConverter
      jsonDecodeServiceWorkerPool,
    );

    chopper = ChopperClient(
      baseUrl: Uri.parse('https://opentdb.com/api.php'),
      services: [
        QuizService.create(),
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
        // TODO: implement MyHttpLoggingInterceptor
        // const MyHttpLoggingInterceptor(),
      ],
    );

    // ref.onDispose(() {
    //   chopper.dispose();
    //   jsonDecodeServiceWorkerPool.cancel();
    // });
  }
}
