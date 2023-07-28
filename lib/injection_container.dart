import 'package:funny_monster/core/network/network_info.dart';
import 'package:funny_monster/features/data/datasources/remote_data_source/trivia_remote_data_source.dart';
import 'package:funny_monster/features/data/repositories/trivia_repository_impl.dart';
import 'package:funny_monster/features/domaine/usescases/trivia_usescase.dart';
import 'package:funny_monster/features/presentation/bloc/trivia_bloc/trivia_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/domaine/repositories/trivia_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// ---------------------  Feature - Trivia  ---------------------
  // Bloc
  sl.registerLazySingleton(() => TriviaBloc(getTriviaUsesCase: sl()));

  // UsesCase
  sl.registerLazySingleton(() => GetTriviaUsesCase(triviaRepository: sl()));

  //repository
  sl.registerLazySingleton<TriviaRepository>(() => TriviaRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));

  // DataSources
  sl.registerLazySingleton<TriviaRemoteDataSource>(() => TriviaRemoteDataSourceImpl(client: sl()));

  /// ---------------------  Core  ---------------------
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(internetConnectionChecker: sl()));

  /// ---------------------  External  ---------------------

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
