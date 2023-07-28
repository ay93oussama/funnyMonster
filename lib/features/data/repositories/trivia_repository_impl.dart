import 'package:dartz/dartz.dart';
import 'package:funny_monster/core/error/exceptions.dart';
import 'package:funny_monster/core/error/failures.dart';
import 'package:funny_monster/core/network/network_info.dart';
import 'package:funny_monster/features/data/datasources/remote_data_source/trivia_remote_data_source.dart';
import 'package:funny_monster/features/domaine/entities/trivia_entity.dart';
import 'package:funny_monster/features/domaine/repositories/trivia_repository.dart';

class TriviaRepositoryImpl implements TriviaRepository {
  final TriviaRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  TriviaRepositoryImpl({required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, Trivia>> getTrivia({required String number, required String type}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.getTrivia(number, type);
        return right(response);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(OfflineFailure());
    }
  }
}
