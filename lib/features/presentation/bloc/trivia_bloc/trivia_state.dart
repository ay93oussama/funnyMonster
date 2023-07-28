part of 'trivia_bloc.dart';

abstract class TriviaState extends Equatable {
  const TriviaState();
}

class TriviaInitial extends TriviaState {
  @override
  List<Object> get props => [];
}

class TriviaLoadingState extends TriviaState {
  @override
  List<Object?> get props => [];
}

class TriviaLoadedState extends TriviaState {
  final Trivia trivia;
  const TriviaLoadedState({required this.trivia});

  @override
  List<Object?> get props => [trivia];
}

class TriviaErrorState extends TriviaState {
  final String msg;
  const TriviaErrorState({required this.msg});
  @override
  List<Object?> get props => [msg];
}
