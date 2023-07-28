import 'package:equatable/equatable.dart';

class Trivia extends Equatable {
  final String msg;
  const Trivia({required this.msg});

  @override
  // TODO: implement props
  List<Object?> get props => [msg];
}
