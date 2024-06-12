// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$QuizEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int category) getSelectedQuiz,
    required TResult Function() startQuiz,
    required TResult Function(
            String selectedAnswer, QuizStateModel quizStateModel, int index)
        answerQuestion,
    required TResult Function(ScrollDirection pageDirection)
        updateCurrentQuestion,
    required TResult Function() updateDuration,
    required TResult Function() finishQuiz,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int category)? getSelectedQuiz,
    TResult? Function()? startQuiz,
    TResult? Function(
            String selectedAnswer, QuizStateModel quizStateModel, int index)?
        answerQuestion,
    TResult? Function(ScrollDirection pageDirection)? updateCurrentQuestion,
    TResult? Function()? updateDuration,
    TResult? Function()? finishQuiz,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int category)? getSelectedQuiz,
    TResult Function()? startQuiz,
    TResult Function(
            String selectedAnswer, QuizStateModel quizStateModel, int index)?
        answerQuestion,
    TResult Function(ScrollDirection pageDirection)? updateCurrentQuestion,
    TResult Function()? updateDuration,
    TResult Function()? finishQuiz,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSelectedQuizEvent value) getSelectedQuiz,
    required TResult Function(StartQuizEvent value) startQuiz,
    required TResult Function(AnswerQuestionEvent value) answerQuestion,
    required TResult Function(UpdateCurrentQuestionEvent value)
        updateCurrentQuestion,
    required TResult Function(_UpdateDurationEvent value) updateDuration,
    required TResult Function(FinishQuizEvent value) finishQuiz,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSelectedQuizEvent value)? getSelectedQuiz,
    TResult? Function(StartQuizEvent value)? startQuiz,
    TResult? Function(AnswerQuestionEvent value)? answerQuestion,
    TResult? Function(UpdateCurrentQuestionEvent value)? updateCurrentQuestion,
    TResult? Function(_UpdateDurationEvent value)? updateDuration,
    TResult? Function(FinishQuizEvent value)? finishQuiz,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSelectedQuizEvent value)? getSelectedQuiz,
    TResult Function(StartQuizEvent value)? startQuiz,
    TResult Function(AnswerQuestionEvent value)? answerQuestion,
    TResult Function(UpdateCurrentQuestionEvent value)? updateCurrentQuestion,
    TResult Function(_UpdateDurationEvent value)? updateDuration,
    TResult Function(FinishQuizEvent value)? finishQuiz,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizEventCopyWith<$Res> {
  factory $QuizEventCopyWith(QuizEvent value, $Res Function(QuizEvent) then) =
      _$QuizEventCopyWithImpl<$Res, QuizEvent>;
}

/// @nodoc
class _$QuizEventCopyWithImpl<$Res, $Val extends QuizEvent>
    implements $QuizEventCopyWith<$Res> {
  _$QuizEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetSelectedQuizEventImplCopyWith<$Res> {
  factory _$$GetSelectedQuizEventImplCopyWith(_$GetSelectedQuizEventImpl value,
          $Res Function(_$GetSelectedQuizEventImpl) then) =
      __$$GetSelectedQuizEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int category});
}

/// @nodoc
class __$$GetSelectedQuizEventImplCopyWithImpl<$Res>
    extends _$QuizEventCopyWithImpl<$Res, _$GetSelectedQuizEventImpl>
    implements _$$GetSelectedQuizEventImplCopyWith<$Res> {
  __$$GetSelectedQuizEventImplCopyWithImpl(_$GetSelectedQuizEventImpl _value,
      $Res Function(_$GetSelectedQuizEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
  }) {
    return _then(_$GetSelectedQuizEventImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetSelectedQuizEventImpl
    with DiagnosticableTreeMixin
    implements _GetSelectedQuizEvent {
  const _$GetSelectedQuizEventImpl({required this.category});

  @override
  final int category;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QuizEvent.getSelectedQuiz(category: $category)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QuizEvent.getSelectedQuiz'))
      ..add(DiagnosticsProperty('category', category));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetSelectedQuizEventImpl &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetSelectedQuizEventImplCopyWith<_$GetSelectedQuizEventImpl>
      get copyWith =>
          __$$GetSelectedQuizEventImplCopyWithImpl<_$GetSelectedQuizEventImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int category) getSelectedQuiz,
    required TResult Function() startQuiz,
    required TResult Function(
            String selectedAnswer, QuizStateModel quizStateModel, int index)
        answerQuestion,
    required TResult Function(ScrollDirection pageDirection)
        updateCurrentQuestion,
    required TResult Function() updateDuration,
    required TResult Function() finishQuiz,
  }) {
    return getSelectedQuiz(category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int category)? getSelectedQuiz,
    TResult? Function()? startQuiz,
    TResult? Function(
            String selectedAnswer, QuizStateModel quizStateModel, int index)?
        answerQuestion,
    TResult? Function(ScrollDirection pageDirection)? updateCurrentQuestion,
    TResult? Function()? updateDuration,
    TResult? Function()? finishQuiz,
  }) {
    return getSelectedQuiz?.call(category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int category)? getSelectedQuiz,
    TResult Function()? startQuiz,
    TResult Function(
            String selectedAnswer, QuizStateModel quizStateModel, int index)?
        answerQuestion,
    TResult Function(ScrollDirection pageDirection)? updateCurrentQuestion,
    TResult Function()? updateDuration,
    TResult Function()? finishQuiz,
    required TResult orElse(),
  }) {
    if (getSelectedQuiz != null) {
      return getSelectedQuiz(category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSelectedQuizEvent value) getSelectedQuiz,
    required TResult Function(StartQuizEvent value) startQuiz,
    required TResult Function(AnswerQuestionEvent value) answerQuestion,
    required TResult Function(UpdateCurrentQuestionEvent value)
        updateCurrentQuestion,
    required TResult Function(_UpdateDurationEvent value) updateDuration,
    required TResult Function(FinishQuizEvent value) finishQuiz,
  }) {
    return getSelectedQuiz(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSelectedQuizEvent value)? getSelectedQuiz,
    TResult? Function(StartQuizEvent value)? startQuiz,
    TResult? Function(AnswerQuestionEvent value)? answerQuestion,
    TResult? Function(UpdateCurrentQuestionEvent value)? updateCurrentQuestion,
    TResult? Function(_UpdateDurationEvent value)? updateDuration,
    TResult? Function(FinishQuizEvent value)? finishQuiz,
  }) {
    return getSelectedQuiz?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSelectedQuizEvent value)? getSelectedQuiz,
    TResult Function(StartQuizEvent value)? startQuiz,
    TResult Function(AnswerQuestionEvent value)? answerQuestion,
    TResult Function(UpdateCurrentQuestionEvent value)? updateCurrentQuestion,
    TResult Function(_UpdateDurationEvent value)? updateDuration,
    TResult Function(FinishQuizEvent value)? finishQuiz,
    required TResult orElse(),
  }) {
    if (getSelectedQuiz != null) {
      return getSelectedQuiz(this);
    }
    return orElse();
  }
}

abstract class _GetSelectedQuizEvent implements QuizEvent {
  const factory _GetSelectedQuizEvent({required final int category}) =
      _$GetSelectedQuizEventImpl;

  int get category;
  @JsonKey(ignore: true)
  _$$GetSelectedQuizEventImplCopyWith<_$GetSelectedQuizEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StartQuizEventImplCopyWith<$Res> {
  factory _$$StartQuizEventImplCopyWith(_$StartQuizEventImpl value,
          $Res Function(_$StartQuizEventImpl) then) =
      __$$StartQuizEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartQuizEventImplCopyWithImpl<$Res>
    extends _$QuizEventCopyWithImpl<$Res, _$StartQuizEventImpl>
    implements _$$StartQuizEventImplCopyWith<$Res> {
  __$$StartQuizEventImplCopyWithImpl(
      _$StartQuizEventImpl _value, $Res Function(_$StartQuizEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartQuizEventImpl
    with DiagnosticableTreeMixin
    implements StartQuizEvent {
  const _$StartQuizEventImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QuizEvent.startQuiz()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'QuizEvent.startQuiz'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartQuizEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int category) getSelectedQuiz,
    required TResult Function() startQuiz,
    required TResult Function(
            String selectedAnswer, QuizStateModel quizStateModel, int index)
        answerQuestion,
    required TResult Function(ScrollDirection pageDirection)
        updateCurrentQuestion,
    required TResult Function() updateDuration,
    required TResult Function() finishQuiz,
  }) {
    return startQuiz();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int category)? getSelectedQuiz,
    TResult? Function()? startQuiz,
    TResult? Function(
            String selectedAnswer, QuizStateModel quizStateModel, int index)?
        answerQuestion,
    TResult? Function(ScrollDirection pageDirection)? updateCurrentQuestion,
    TResult? Function()? updateDuration,
    TResult? Function()? finishQuiz,
  }) {
    return startQuiz?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int category)? getSelectedQuiz,
    TResult Function()? startQuiz,
    TResult Function(
            String selectedAnswer, QuizStateModel quizStateModel, int index)?
        answerQuestion,
    TResult Function(ScrollDirection pageDirection)? updateCurrentQuestion,
    TResult Function()? updateDuration,
    TResult Function()? finishQuiz,
    required TResult orElse(),
  }) {
    if (startQuiz != null) {
      return startQuiz();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSelectedQuizEvent value) getSelectedQuiz,
    required TResult Function(StartQuizEvent value) startQuiz,
    required TResult Function(AnswerQuestionEvent value) answerQuestion,
    required TResult Function(UpdateCurrentQuestionEvent value)
        updateCurrentQuestion,
    required TResult Function(_UpdateDurationEvent value) updateDuration,
    required TResult Function(FinishQuizEvent value) finishQuiz,
  }) {
    return startQuiz(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSelectedQuizEvent value)? getSelectedQuiz,
    TResult? Function(StartQuizEvent value)? startQuiz,
    TResult? Function(AnswerQuestionEvent value)? answerQuestion,
    TResult? Function(UpdateCurrentQuestionEvent value)? updateCurrentQuestion,
    TResult? Function(_UpdateDurationEvent value)? updateDuration,
    TResult? Function(FinishQuizEvent value)? finishQuiz,
  }) {
    return startQuiz?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSelectedQuizEvent value)? getSelectedQuiz,
    TResult Function(StartQuizEvent value)? startQuiz,
    TResult Function(AnswerQuestionEvent value)? answerQuestion,
    TResult Function(UpdateCurrentQuestionEvent value)? updateCurrentQuestion,
    TResult Function(_UpdateDurationEvent value)? updateDuration,
    TResult Function(FinishQuizEvent value)? finishQuiz,
    required TResult orElse(),
  }) {
    if (startQuiz != null) {
      return startQuiz(this);
    }
    return orElse();
  }
}

abstract class StartQuizEvent implements QuizEvent {
  const factory StartQuizEvent() = _$StartQuizEventImpl;
}

/// @nodoc
abstract class _$$AnswerQuestionEventImplCopyWith<$Res> {
  factory _$$AnswerQuestionEventImplCopyWith(_$AnswerQuestionEventImpl value,
          $Res Function(_$AnswerQuestionEventImpl) then) =
      __$$AnswerQuestionEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String selectedAnswer, QuizStateModel quizStateModel, int index});
}

/// @nodoc
class __$$AnswerQuestionEventImplCopyWithImpl<$Res>
    extends _$QuizEventCopyWithImpl<$Res, _$AnswerQuestionEventImpl>
    implements _$$AnswerQuestionEventImplCopyWith<$Res> {
  __$$AnswerQuestionEventImplCopyWithImpl(_$AnswerQuestionEventImpl _value,
      $Res Function(_$AnswerQuestionEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedAnswer = null,
    Object? quizStateModel = null,
    Object? index = null,
  }) {
    return _then(_$AnswerQuestionEventImpl(
      selectedAnswer: null == selectedAnswer
          ? _value.selectedAnswer
          : selectedAnswer // ignore: cast_nullable_to_non_nullable
              as String,
      quizStateModel: null == quizStateModel
          ? _value.quizStateModel
          : quizStateModel // ignore: cast_nullable_to_non_nullable
              as QuizStateModel,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AnswerQuestionEventImpl
    with DiagnosticableTreeMixin
    implements AnswerQuestionEvent {
  const _$AnswerQuestionEventImpl(
      {required this.selectedAnswer,
      required this.quizStateModel,
      required this.index});

  @override
  final String selectedAnswer;
  @override
  final QuizStateModel quizStateModel;
  @override
  final int index;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QuizEvent.answerQuestion(selectedAnswer: $selectedAnswer, quizStateModel: $quizStateModel, index: $index)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QuizEvent.answerQuestion'))
      ..add(DiagnosticsProperty('selectedAnswer', selectedAnswer))
      ..add(DiagnosticsProperty('quizStateModel', quizStateModel))
      ..add(DiagnosticsProperty('index', index));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnswerQuestionEventImpl &&
            (identical(other.selectedAnswer, selectedAnswer) ||
                other.selectedAnswer == selectedAnswer) &&
            (identical(other.quizStateModel, quizStateModel) ||
                other.quizStateModel == quizStateModel) &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, selectedAnswer, quizStateModel, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnswerQuestionEventImplCopyWith<_$AnswerQuestionEventImpl> get copyWith =>
      __$$AnswerQuestionEventImplCopyWithImpl<_$AnswerQuestionEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int category) getSelectedQuiz,
    required TResult Function() startQuiz,
    required TResult Function(
            String selectedAnswer, QuizStateModel quizStateModel, int index)
        answerQuestion,
    required TResult Function(ScrollDirection pageDirection)
        updateCurrentQuestion,
    required TResult Function() updateDuration,
    required TResult Function() finishQuiz,
  }) {
    return answerQuestion(selectedAnswer, quizStateModel, index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int category)? getSelectedQuiz,
    TResult? Function()? startQuiz,
    TResult? Function(
            String selectedAnswer, QuizStateModel quizStateModel, int index)?
        answerQuestion,
    TResult? Function(ScrollDirection pageDirection)? updateCurrentQuestion,
    TResult? Function()? updateDuration,
    TResult? Function()? finishQuiz,
  }) {
    return answerQuestion?.call(selectedAnswer, quizStateModel, index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int category)? getSelectedQuiz,
    TResult Function()? startQuiz,
    TResult Function(
            String selectedAnswer, QuizStateModel quizStateModel, int index)?
        answerQuestion,
    TResult Function(ScrollDirection pageDirection)? updateCurrentQuestion,
    TResult Function()? updateDuration,
    TResult Function()? finishQuiz,
    required TResult orElse(),
  }) {
    if (answerQuestion != null) {
      return answerQuestion(selectedAnswer, quizStateModel, index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSelectedQuizEvent value) getSelectedQuiz,
    required TResult Function(StartQuizEvent value) startQuiz,
    required TResult Function(AnswerQuestionEvent value) answerQuestion,
    required TResult Function(UpdateCurrentQuestionEvent value)
        updateCurrentQuestion,
    required TResult Function(_UpdateDurationEvent value) updateDuration,
    required TResult Function(FinishQuizEvent value) finishQuiz,
  }) {
    return answerQuestion(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSelectedQuizEvent value)? getSelectedQuiz,
    TResult? Function(StartQuizEvent value)? startQuiz,
    TResult? Function(AnswerQuestionEvent value)? answerQuestion,
    TResult? Function(UpdateCurrentQuestionEvent value)? updateCurrentQuestion,
    TResult? Function(_UpdateDurationEvent value)? updateDuration,
    TResult? Function(FinishQuizEvent value)? finishQuiz,
  }) {
    return answerQuestion?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSelectedQuizEvent value)? getSelectedQuiz,
    TResult Function(StartQuizEvent value)? startQuiz,
    TResult Function(AnswerQuestionEvent value)? answerQuestion,
    TResult Function(UpdateCurrentQuestionEvent value)? updateCurrentQuestion,
    TResult Function(_UpdateDurationEvent value)? updateDuration,
    TResult Function(FinishQuizEvent value)? finishQuiz,
    required TResult orElse(),
  }) {
    if (answerQuestion != null) {
      return answerQuestion(this);
    }
    return orElse();
  }
}

abstract class AnswerQuestionEvent implements QuizEvent {
  const factory AnswerQuestionEvent(
      {required final String selectedAnswer,
      required final QuizStateModel quizStateModel,
      required final int index}) = _$AnswerQuestionEventImpl;

  String get selectedAnswer;
  QuizStateModel get quizStateModel;
  int get index;
  @JsonKey(ignore: true)
  _$$AnswerQuestionEventImplCopyWith<_$AnswerQuestionEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateCurrentQuestionEventImplCopyWith<$Res> {
  factory _$$UpdateCurrentQuestionEventImplCopyWith(
          _$UpdateCurrentQuestionEventImpl value,
          $Res Function(_$UpdateCurrentQuestionEventImpl) then) =
      __$$UpdateCurrentQuestionEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ScrollDirection pageDirection});
}

/// @nodoc
class __$$UpdateCurrentQuestionEventImplCopyWithImpl<$Res>
    extends _$QuizEventCopyWithImpl<$Res, _$UpdateCurrentQuestionEventImpl>
    implements _$$UpdateCurrentQuestionEventImplCopyWith<$Res> {
  __$$UpdateCurrentQuestionEventImplCopyWithImpl(
      _$UpdateCurrentQuestionEventImpl _value,
      $Res Function(_$UpdateCurrentQuestionEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageDirection = null,
  }) {
    return _then(_$UpdateCurrentQuestionEventImpl(
      pageDirection: null == pageDirection
          ? _value.pageDirection
          : pageDirection // ignore: cast_nullable_to_non_nullable
              as ScrollDirection,
    ));
  }
}

/// @nodoc

class _$UpdateCurrentQuestionEventImpl
    with DiagnosticableTreeMixin
    implements UpdateCurrentQuestionEvent {
  const _$UpdateCurrentQuestionEventImpl({required this.pageDirection});

  @override
  final ScrollDirection pageDirection;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QuizEvent.updateCurrentQuestion(pageDirection: $pageDirection)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QuizEvent.updateCurrentQuestion'))
      ..add(DiagnosticsProperty('pageDirection', pageDirection));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateCurrentQuestionEventImpl &&
            (identical(other.pageDirection, pageDirection) ||
                other.pageDirection == pageDirection));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pageDirection);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateCurrentQuestionEventImplCopyWith<_$UpdateCurrentQuestionEventImpl>
      get copyWith => __$$UpdateCurrentQuestionEventImplCopyWithImpl<
          _$UpdateCurrentQuestionEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int category) getSelectedQuiz,
    required TResult Function() startQuiz,
    required TResult Function(
            String selectedAnswer, QuizStateModel quizStateModel, int index)
        answerQuestion,
    required TResult Function(ScrollDirection pageDirection)
        updateCurrentQuestion,
    required TResult Function() updateDuration,
    required TResult Function() finishQuiz,
  }) {
    return updateCurrentQuestion(pageDirection);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int category)? getSelectedQuiz,
    TResult? Function()? startQuiz,
    TResult? Function(
            String selectedAnswer, QuizStateModel quizStateModel, int index)?
        answerQuestion,
    TResult? Function(ScrollDirection pageDirection)? updateCurrentQuestion,
    TResult? Function()? updateDuration,
    TResult? Function()? finishQuiz,
  }) {
    return updateCurrentQuestion?.call(pageDirection);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int category)? getSelectedQuiz,
    TResult Function()? startQuiz,
    TResult Function(
            String selectedAnswer, QuizStateModel quizStateModel, int index)?
        answerQuestion,
    TResult Function(ScrollDirection pageDirection)? updateCurrentQuestion,
    TResult Function()? updateDuration,
    TResult Function()? finishQuiz,
    required TResult orElse(),
  }) {
    if (updateCurrentQuestion != null) {
      return updateCurrentQuestion(pageDirection);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSelectedQuizEvent value) getSelectedQuiz,
    required TResult Function(StartQuizEvent value) startQuiz,
    required TResult Function(AnswerQuestionEvent value) answerQuestion,
    required TResult Function(UpdateCurrentQuestionEvent value)
        updateCurrentQuestion,
    required TResult Function(_UpdateDurationEvent value) updateDuration,
    required TResult Function(FinishQuizEvent value) finishQuiz,
  }) {
    return updateCurrentQuestion(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSelectedQuizEvent value)? getSelectedQuiz,
    TResult? Function(StartQuizEvent value)? startQuiz,
    TResult? Function(AnswerQuestionEvent value)? answerQuestion,
    TResult? Function(UpdateCurrentQuestionEvent value)? updateCurrentQuestion,
    TResult? Function(_UpdateDurationEvent value)? updateDuration,
    TResult? Function(FinishQuizEvent value)? finishQuiz,
  }) {
    return updateCurrentQuestion?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSelectedQuizEvent value)? getSelectedQuiz,
    TResult Function(StartQuizEvent value)? startQuiz,
    TResult Function(AnswerQuestionEvent value)? answerQuestion,
    TResult Function(UpdateCurrentQuestionEvent value)? updateCurrentQuestion,
    TResult Function(_UpdateDurationEvent value)? updateDuration,
    TResult Function(FinishQuizEvent value)? finishQuiz,
    required TResult orElse(),
  }) {
    if (updateCurrentQuestion != null) {
      return updateCurrentQuestion(this);
    }
    return orElse();
  }
}

abstract class UpdateCurrentQuestionEvent implements QuizEvent {
  const factory UpdateCurrentQuestionEvent(
          {required final ScrollDirection pageDirection}) =
      _$UpdateCurrentQuestionEventImpl;

  ScrollDirection get pageDirection;
  @JsonKey(ignore: true)
  _$$UpdateCurrentQuestionEventImplCopyWith<_$UpdateCurrentQuestionEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateDurationEventImplCopyWith<$Res> {
  factory _$$UpdateDurationEventImplCopyWith(_$UpdateDurationEventImpl value,
          $Res Function(_$UpdateDurationEventImpl) then) =
      __$$UpdateDurationEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpdateDurationEventImplCopyWithImpl<$Res>
    extends _$QuizEventCopyWithImpl<$Res, _$UpdateDurationEventImpl>
    implements _$$UpdateDurationEventImplCopyWith<$Res> {
  __$$UpdateDurationEventImplCopyWithImpl(_$UpdateDurationEventImpl _value,
      $Res Function(_$UpdateDurationEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UpdateDurationEventImpl
    with DiagnosticableTreeMixin
    implements _UpdateDurationEvent {
  const _$UpdateDurationEventImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QuizEvent.updateDuration()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'QuizEvent.updateDuration'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateDurationEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int category) getSelectedQuiz,
    required TResult Function() startQuiz,
    required TResult Function(
            String selectedAnswer, QuizStateModel quizStateModel, int index)
        answerQuestion,
    required TResult Function(ScrollDirection pageDirection)
        updateCurrentQuestion,
    required TResult Function() updateDuration,
    required TResult Function() finishQuiz,
  }) {
    return updateDuration();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int category)? getSelectedQuiz,
    TResult? Function()? startQuiz,
    TResult? Function(
            String selectedAnswer, QuizStateModel quizStateModel, int index)?
        answerQuestion,
    TResult? Function(ScrollDirection pageDirection)? updateCurrentQuestion,
    TResult? Function()? updateDuration,
    TResult? Function()? finishQuiz,
  }) {
    return updateDuration?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int category)? getSelectedQuiz,
    TResult Function()? startQuiz,
    TResult Function(
            String selectedAnswer, QuizStateModel quizStateModel, int index)?
        answerQuestion,
    TResult Function(ScrollDirection pageDirection)? updateCurrentQuestion,
    TResult Function()? updateDuration,
    TResult Function()? finishQuiz,
    required TResult orElse(),
  }) {
    if (updateDuration != null) {
      return updateDuration();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSelectedQuizEvent value) getSelectedQuiz,
    required TResult Function(StartQuizEvent value) startQuiz,
    required TResult Function(AnswerQuestionEvent value) answerQuestion,
    required TResult Function(UpdateCurrentQuestionEvent value)
        updateCurrentQuestion,
    required TResult Function(_UpdateDurationEvent value) updateDuration,
    required TResult Function(FinishQuizEvent value) finishQuiz,
  }) {
    return updateDuration(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSelectedQuizEvent value)? getSelectedQuiz,
    TResult? Function(StartQuizEvent value)? startQuiz,
    TResult? Function(AnswerQuestionEvent value)? answerQuestion,
    TResult? Function(UpdateCurrentQuestionEvent value)? updateCurrentQuestion,
    TResult? Function(_UpdateDurationEvent value)? updateDuration,
    TResult? Function(FinishQuizEvent value)? finishQuiz,
  }) {
    return updateDuration?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSelectedQuizEvent value)? getSelectedQuiz,
    TResult Function(StartQuizEvent value)? startQuiz,
    TResult Function(AnswerQuestionEvent value)? answerQuestion,
    TResult Function(UpdateCurrentQuestionEvent value)? updateCurrentQuestion,
    TResult Function(_UpdateDurationEvent value)? updateDuration,
    TResult Function(FinishQuizEvent value)? finishQuiz,
    required TResult orElse(),
  }) {
    if (updateDuration != null) {
      return updateDuration(this);
    }
    return orElse();
  }
}

abstract class _UpdateDurationEvent implements QuizEvent {
  const factory _UpdateDurationEvent() = _$UpdateDurationEventImpl;
}

/// @nodoc
abstract class _$$FinishQuizEventImplCopyWith<$Res> {
  factory _$$FinishQuizEventImplCopyWith(_$FinishQuizEventImpl value,
          $Res Function(_$FinishQuizEventImpl) then) =
      __$$FinishQuizEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FinishQuizEventImplCopyWithImpl<$Res>
    extends _$QuizEventCopyWithImpl<$Res, _$FinishQuizEventImpl>
    implements _$$FinishQuizEventImplCopyWith<$Res> {
  __$$FinishQuizEventImplCopyWithImpl(
      _$FinishQuizEventImpl _value, $Res Function(_$FinishQuizEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FinishQuizEventImpl
    with DiagnosticableTreeMixin
    implements FinishQuizEvent {
  const _$FinishQuizEventImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QuizEvent.finishQuiz()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'QuizEvent.finishQuiz'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FinishQuizEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int category) getSelectedQuiz,
    required TResult Function() startQuiz,
    required TResult Function(
            String selectedAnswer, QuizStateModel quizStateModel, int index)
        answerQuestion,
    required TResult Function(ScrollDirection pageDirection)
        updateCurrentQuestion,
    required TResult Function() updateDuration,
    required TResult Function() finishQuiz,
  }) {
    return finishQuiz();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int category)? getSelectedQuiz,
    TResult? Function()? startQuiz,
    TResult? Function(
            String selectedAnswer, QuizStateModel quizStateModel, int index)?
        answerQuestion,
    TResult? Function(ScrollDirection pageDirection)? updateCurrentQuestion,
    TResult? Function()? updateDuration,
    TResult? Function()? finishQuiz,
  }) {
    return finishQuiz?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int category)? getSelectedQuiz,
    TResult Function()? startQuiz,
    TResult Function(
            String selectedAnswer, QuizStateModel quizStateModel, int index)?
        answerQuestion,
    TResult Function(ScrollDirection pageDirection)? updateCurrentQuestion,
    TResult Function()? updateDuration,
    TResult Function()? finishQuiz,
    required TResult orElse(),
  }) {
    if (finishQuiz != null) {
      return finishQuiz();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSelectedQuizEvent value) getSelectedQuiz,
    required TResult Function(StartQuizEvent value) startQuiz,
    required TResult Function(AnswerQuestionEvent value) answerQuestion,
    required TResult Function(UpdateCurrentQuestionEvent value)
        updateCurrentQuestion,
    required TResult Function(_UpdateDurationEvent value) updateDuration,
    required TResult Function(FinishQuizEvent value) finishQuiz,
  }) {
    return finishQuiz(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSelectedQuizEvent value)? getSelectedQuiz,
    TResult? Function(StartQuizEvent value)? startQuiz,
    TResult? Function(AnswerQuestionEvent value)? answerQuestion,
    TResult? Function(UpdateCurrentQuestionEvent value)? updateCurrentQuestion,
    TResult? Function(_UpdateDurationEvent value)? updateDuration,
    TResult? Function(FinishQuizEvent value)? finishQuiz,
  }) {
    return finishQuiz?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSelectedQuizEvent value)? getSelectedQuiz,
    TResult Function(StartQuizEvent value)? startQuiz,
    TResult Function(AnswerQuestionEvent value)? answerQuestion,
    TResult Function(UpdateCurrentQuestionEvent value)? updateCurrentQuestion,
    TResult Function(_UpdateDurationEvent value)? updateDuration,
    TResult Function(FinishQuizEvent value)? finishQuiz,
    required TResult orElse(),
  }) {
    if (finishQuiz != null) {
      return finishQuiz(this);
    }
    return orElse();
  }
}

abstract class FinishQuizEvent implements QuizEvent {
  const factory FinishQuizEvent() = _$FinishQuizEventImpl;
}

/// @nodoc
mixin _$QuizState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<QuizStateModel> questions,
            int currentQuestionIndex, bool userStartedQuiz)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() finishQuiz,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<QuizStateModel> questions, int currentQuestionIndex,
            bool userStartedQuiz)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? finishQuiz,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<QuizStateModel> questions, int currentQuestionIndex,
            bool userStartedQuiz)?
        loaded,
    TResult Function(String message)? error,
    TResult Function()? finishQuiz,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QuizLoadingState value) loading,
    required TResult Function(QuizLoadedState value) loaded,
    required TResult Function(QuizErrorState value) error,
    required TResult Function(QuizFinishState value) finishQuiz,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QuizLoadingState value)? loading,
    TResult? Function(QuizLoadedState value)? loaded,
    TResult? Function(QuizErrorState value)? error,
    TResult? Function(QuizFinishState value)? finishQuiz,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QuizLoadingState value)? loading,
    TResult Function(QuizLoadedState value)? loaded,
    TResult Function(QuizErrorState value)? error,
    TResult Function(QuizFinishState value)? finishQuiz,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizStateCopyWith<$Res> {
  factory $QuizStateCopyWith(QuizState value, $Res Function(QuizState) then) =
      _$QuizStateCopyWithImpl<$Res, QuizState>;
}

/// @nodoc
class _$QuizStateCopyWithImpl<$Res, $Val extends QuizState>
    implements $QuizStateCopyWith<$Res> {
  _$QuizStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$QuizLoadingStateImplCopyWith<$Res> {
  factory _$$QuizLoadingStateImplCopyWith(_$QuizLoadingStateImpl value,
          $Res Function(_$QuizLoadingStateImpl) then) =
      __$$QuizLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$QuizLoadingStateImplCopyWithImpl<$Res>
    extends _$QuizStateCopyWithImpl<$Res, _$QuizLoadingStateImpl>
    implements _$$QuizLoadingStateImplCopyWith<$Res> {
  __$$QuizLoadingStateImplCopyWithImpl(_$QuizLoadingStateImpl _value,
      $Res Function(_$QuizLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$QuizLoadingStateImpl
    with DiagnosticableTreeMixin
    implements QuizLoadingState {
  const _$QuizLoadingStateImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QuizState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'QuizState.loading'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$QuizLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<QuizStateModel> questions,
            int currentQuestionIndex, bool userStartedQuiz)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() finishQuiz,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<QuizStateModel> questions, int currentQuestionIndex,
            bool userStartedQuiz)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? finishQuiz,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<QuizStateModel> questions, int currentQuestionIndex,
            bool userStartedQuiz)?
        loaded,
    TResult Function(String message)? error,
    TResult Function()? finishQuiz,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QuizLoadingState value) loading,
    required TResult Function(QuizLoadedState value) loaded,
    required TResult Function(QuizErrorState value) error,
    required TResult Function(QuizFinishState value) finishQuiz,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QuizLoadingState value)? loading,
    TResult? Function(QuizLoadedState value)? loaded,
    TResult? Function(QuizErrorState value)? error,
    TResult? Function(QuizFinishState value)? finishQuiz,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QuizLoadingState value)? loading,
    TResult Function(QuizLoadedState value)? loaded,
    TResult Function(QuizErrorState value)? error,
    TResult Function(QuizFinishState value)? finishQuiz,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class QuizLoadingState implements QuizState {
  const factory QuizLoadingState() = _$QuizLoadingStateImpl;
}

/// @nodoc
abstract class _$$QuizLoadedStateImplCopyWith<$Res> {
  factory _$$QuizLoadedStateImplCopyWith(_$QuizLoadedStateImpl value,
          $Res Function(_$QuizLoadedStateImpl) then) =
      __$$QuizLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<QuizStateModel> questions,
      int currentQuestionIndex,
      bool userStartedQuiz});
}

/// @nodoc
class __$$QuizLoadedStateImplCopyWithImpl<$Res>
    extends _$QuizStateCopyWithImpl<$Res, _$QuizLoadedStateImpl>
    implements _$$QuizLoadedStateImplCopyWith<$Res> {
  __$$QuizLoadedStateImplCopyWithImpl(
      _$QuizLoadedStateImpl _value, $Res Function(_$QuizLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questions = null,
    Object? currentQuestionIndex = null,
    Object? userStartedQuiz = null,
  }) {
    return _then(_$QuizLoadedStateImpl(
      null == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QuizStateModel>,
      currentQuestionIndex: null == currentQuestionIndex
          ? _value.currentQuestionIndex
          : currentQuestionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      userStartedQuiz: null == userStartedQuiz
          ? _value.userStartedQuiz
          : userStartedQuiz // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$QuizLoadedStateImpl
    with DiagnosticableTreeMixin
    implements QuizLoadedState {
  const _$QuizLoadedStateImpl(final List<QuizStateModel> questions,
      {this.currentQuestionIndex = 0, this.userStartedQuiz = false})
      : _questions = questions;

  final List<QuizStateModel> _questions;
  @override
  List<QuizStateModel> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  @override
  @JsonKey()
  final int currentQuestionIndex;
  @override
  @JsonKey()
  final bool userStartedQuiz;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QuizState.loaded(questions: $questions, currentQuestionIndex: $currentQuestionIndex, userStartedQuiz: $userStartedQuiz)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QuizState.loaded'))
      ..add(DiagnosticsProperty('questions', questions))
      ..add(DiagnosticsProperty('currentQuestionIndex', currentQuestionIndex))
      ..add(DiagnosticsProperty('userStartedQuiz', userStartedQuiz));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizLoadedStateImpl &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions) &&
            (identical(other.currentQuestionIndex, currentQuestionIndex) ||
                other.currentQuestionIndex == currentQuestionIndex) &&
            (identical(other.userStartedQuiz, userStartedQuiz) ||
                other.userStartedQuiz == userStartedQuiz));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_questions),
      currentQuestionIndex,
      userStartedQuiz);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizLoadedStateImplCopyWith<_$QuizLoadedStateImpl> get copyWith =>
      __$$QuizLoadedStateImplCopyWithImpl<_$QuizLoadedStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<QuizStateModel> questions,
            int currentQuestionIndex, bool userStartedQuiz)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() finishQuiz,
  }) {
    return loaded(questions, currentQuestionIndex, userStartedQuiz);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<QuizStateModel> questions, int currentQuestionIndex,
            bool userStartedQuiz)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? finishQuiz,
  }) {
    return loaded?.call(questions, currentQuestionIndex, userStartedQuiz);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<QuizStateModel> questions, int currentQuestionIndex,
            bool userStartedQuiz)?
        loaded,
    TResult Function(String message)? error,
    TResult Function()? finishQuiz,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(questions, currentQuestionIndex, userStartedQuiz);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QuizLoadingState value) loading,
    required TResult Function(QuizLoadedState value) loaded,
    required TResult Function(QuizErrorState value) error,
    required TResult Function(QuizFinishState value) finishQuiz,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QuizLoadingState value)? loading,
    TResult? Function(QuizLoadedState value)? loaded,
    TResult? Function(QuizErrorState value)? error,
    TResult? Function(QuizFinishState value)? finishQuiz,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QuizLoadingState value)? loading,
    TResult Function(QuizLoadedState value)? loaded,
    TResult Function(QuizErrorState value)? error,
    TResult Function(QuizFinishState value)? finishQuiz,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class QuizLoadedState implements QuizState {
  const factory QuizLoadedState(final List<QuizStateModel> questions,
      {final int currentQuestionIndex,
      final bool userStartedQuiz}) = _$QuizLoadedStateImpl;

  List<QuizStateModel> get questions;
  int get currentQuestionIndex;
  bool get userStartedQuiz;
  @JsonKey(ignore: true)
  _$$QuizLoadedStateImplCopyWith<_$QuizLoadedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$QuizErrorStateImplCopyWith<$Res> {
  factory _$$QuizErrorStateImplCopyWith(_$QuizErrorStateImpl value,
          $Res Function(_$QuizErrorStateImpl) then) =
      __$$QuizErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$QuizErrorStateImplCopyWithImpl<$Res>
    extends _$QuizStateCopyWithImpl<$Res, _$QuizErrorStateImpl>
    implements _$$QuizErrorStateImplCopyWith<$Res> {
  __$$QuizErrorStateImplCopyWithImpl(
      _$QuizErrorStateImpl _value, $Res Function(_$QuizErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$QuizErrorStateImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$QuizErrorStateImpl
    with DiagnosticableTreeMixin
    implements QuizErrorState {
  const _$QuizErrorStateImpl({required this.message});

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QuizState.error(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QuizState.error'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizErrorStateImplCopyWith<_$QuizErrorStateImpl> get copyWith =>
      __$$QuizErrorStateImplCopyWithImpl<_$QuizErrorStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<QuizStateModel> questions,
            int currentQuestionIndex, bool userStartedQuiz)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() finishQuiz,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<QuizStateModel> questions, int currentQuestionIndex,
            bool userStartedQuiz)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? finishQuiz,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<QuizStateModel> questions, int currentQuestionIndex,
            bool userStartedQuiz)?
        loaded,
    TResult Function(String message)? error,
    TResult Function()? finishQuiz,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QuizLoadingState value) loading,
    required TResult Function(QuizLoadedState value) loaded,
    required TResult Function(QuizErrorState value) error,
    required TResult Function(QuizFinishState value) finishQuiz,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QuizLoadingState value)? loading,
    TResult? Function(QuizLoadedState value)? loaded,
    TResult? Function(QuizErrorState value)? error,
    TResult? Function(QuizFinishState value)? finishQuiz,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QuizLoadingState value)? loading,
    TResult Function(QuizLoadedState value)? loaded,
    TResult Function(QuizErrorState value)? error,
    TResult Function(QuizFinishState value)? finishQuiz,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class QuizErrorState implements QuizState {
  const factory QuizErrorState({required final String message}) =
      _$QuizErrorStateImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$QuizErrorStateImplCopyWith<_$QuizErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$QuizFinishStateImplCopyWith<$Res> {
  factory _$$QuizFinishStateImplCopyWith(_$QuizFinishStateImpl value,
          $Res Function(_$QuizFinishStateImpl) then) =
      __$$QuizFinishStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$QuizFinishStateImplCopyWithImpl<$Res>
    extends _$QuizStateCopyWithImpl<$Res, _$QuizFinishStateImpl>
    implements _$$QuizFinishStateImplCopyWith<$Res> {
  __$$QuizFinishStateImplCopyWithImpl(
      _$QuizFinishStateImpl _value, $Res Function(_$QuizFinishStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$QuizFinishStateImpl
    with DiagnosticableTreeMixin
    implements QuizFinishState {
  const _$QuizFinishStateImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QuizState.finishQuiz()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'QuizState.finishQuiz'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$QuizFinishStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<QuizStateModel> questions,
            int currentQuestionIndex, bool userStartedQuiz)
        loaded,
    required TResult Function(String message) error,
    required TResult Function() finishQuiz,
  }) {
    return finishQuiz();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<QuizStateModel> questions, int currentQuestionIndex,
            bool userStartedQuiz)?
        loaded,
    TResult? Function(String message)? error,
    TResult? Function()? finishQuiz,
  }) {
    return finishQuiz?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<QuizStateModel> questions, int currentQuestionIndex,
            bool userStartedQuiz)?
        loaded,
    TResult Function(String message)? error,
    TResult Function()? finishQuiz,
    required TResult orElse(),
  }) {
    if (finishQuiz != null) {
      return finishQuiz();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QuizLoadingState value) loading,
    required TResult Function(QuizLoadedState value) loaded,
    required TResult Function(QuizErrorState value) error,
    required TResult Function(QuizFinishState value) finishQuiz,
  }) {
    return finishQuiz(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QuizLoadingState value)? loading,
    TResult? Function(QuizLoadedState value)? loaded,
    TResult? Function(QuizErrorState value)? error,
    TResult? Function(QuizFinishState value)? finishQuiz,
  }) {
    return finishQuiz?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QuizLoadingState value)? loading,
    TResult Function(QuizLoadedState value)? loaded,
    TResult Function(QuizErrorState value)? error,
    TResult Function(QuizFinishState value)? finishQuiz,
    required TResult orElse(),
  }) {
    if (finishQuiz != null) {
      return finishQuiz(this);
    }
    return orElse();
  }
}

abstract class QuizFinishState implements QuizState {
  const factory QuizFinishState() = _$QuizFinishStateImpl;
}
