import 'package:flutter_dotenv/flutter_dotenv.dart';

class Evironment {
  static final String _theMovieDbKey = dotenv.env['TMDB_KEY'] ?? '';

  static String get theMovieDbKey {
    if (_theMovieDbKey.isEmpty) {
      throw Exception('TheMovieDB key is not set');
    }
    return _theMovieDbKey;
  }
}
