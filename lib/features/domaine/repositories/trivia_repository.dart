import 'package:dartz/dartz.dart';
import 'package:funny_monster/core/error/failures.dart';
import 'package:funny_monster/features/domaine/entities/trivia_entity.dart';

abstract class TriviaRepository {
  Future<Either<Failure, Trivia>> getTrivia({required String number, required String type});
}
