import 'package:dartz/dartz.dart';
import 'package:funny_monster/core/error/failures.dart';
import 'package:funny_monster/features/domaine/entities/trivia_entity.dart';
import 'package:funny_monster/features/domaine/repositories/trivia_repository.dart';

class GetTriviaUsesCase {
  final TriviaRepository triviaRepository;
  GetTriviaUsesCase({required this.triviaRepository});

  Future<Either<Failure, Trivia>> call({required String number, required String type}) {
    return triviaRepository.getTrivia(number: number, type: type);
  }
}
