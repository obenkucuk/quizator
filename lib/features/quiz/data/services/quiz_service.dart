import 'package:chopper/chopper.dart';

import '../models/quiz_model.dart';

part 'quiz_service.chopper.dart';

@ChopperApi(baseUrl: '/amount=10&category=25')
abstract class QuizService extends ChopperService {
  @FactoryConverter(request: JsonConverter.requestFactory)
  static QuizService create([ChopperClient? client]) => _$QuizService(client);

  @Get(path: '/')
  Future<Response<QuizModel>> getSelectedQuiz(@Query() int category,
      {@Query() int amount = 10, @Query() String type = 'multi'});
}
