import 'package:funny_monster/core/error/exceptions.dart';
import 'package:funny_monster/core/util/constants.dart';
import 'package:funny_monster/features/data/models/trivia_model.dart';
import 'package:http/http.dart' as http;

abstract class TriviaRemoteDataSource {
  Future<TriviaModel> getTrivia(number, type);
}

class TriviaRemoteDataSourceImpl implements TriviaRemoteDataSource {
  final http.Client client;
  TriviaRemoteDataSourceImpl({required this.client});

  @override
  Future<TriviaModel> getTrivia(number, type) async {
    final response = await client.get(Uri.parse('${BaseUrl.trivia}$number/$type'));

    if (response.statusCode == 200) {
      final TriviaModel travia = TriviaModel(msg: response.body);
      return travia;
    } else {
      throw ServerException();
    }
  }
}
