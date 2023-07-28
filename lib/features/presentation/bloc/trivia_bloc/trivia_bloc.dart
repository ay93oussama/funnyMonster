import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:funny_monster/core/error/failures.dart';
import 'package:funny_monster/core/strings/failure_message.dart';
import 'package:funny_monster/features/domaine/entities/trivia_entity.dart';
import 'package:funny_monster/features/domaine/usescases/trivia_usescase.dart';

part 'trivia_event.dart';
part 'trivia_state.dart';

class TriviaBloc extends Bloc<TriviaEvent, TriviaState> {
  final GetTriviaUsesCase getTriviaUsesCase;

  TriviaBloc({required this.getTriviaUsesCase}) : super(TriviaInitial()) {
    on<TriviaEvent>((event, emit) async {
      if (event is GetTriviaEvent) {
        emit(TriviaLoadingState());

        final result = await getTriviaUsesCase(number: event.number, type: event.type);
        result.fold(
          (failure) => emit(TriviaErrorState(msg: _mapFailureToMessage(failure))),
          (trivia) => emit(TriviaLoadedState(trivia: trivia)),
        );
      }
      if (event is ResetEvent) {
        emit(TriviaInitial());
      }
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return UNEXPECTED_FAILURE_MESSAGE;
    }
  }
}
