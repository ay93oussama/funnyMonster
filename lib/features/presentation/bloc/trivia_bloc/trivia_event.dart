part of 'trivia_bloc.dart';

abstract class TriviaEvent extends Equatable {
  const TriviaEvent();
}

class GetTriviaEvent extends TriviaEvent {
  final String number;
  final String type;
  const GetTriviaEvent({required this.number, required this.type});

  List<Object?> get props => [number, type];
}

class ResetEvent extends TriviaEvent {
  List<Object?> get props => [];
}
