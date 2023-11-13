import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MoviesDataSource moviesDataSource;

  MovieRepositoryImpl({required this.moviesDataSource});

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return moviesDataSource.getNowPlaying(page: page);
  }
}
