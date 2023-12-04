import 'package:dio/dio.dart';

import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';
import 'package:cinemapedia/infrastructure/mappers/actor_mapper.dart';

class ActorsMovieDbDatasource extends ActorsDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Evironment.theMovieDbKey,
      'language': 'es-MX',
    },
  ));

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');

    if (response.statusCode != 200) {
      throw Exception('Movie with id $movieId not found');
    }

    final credits = CreditsResponse.fromJson(response.data);

    final List<Actor> actors =
        credits.cast.map((cast) => ActorMapper.castToEntity(cast)).toList();

    return actors;
  }
}
