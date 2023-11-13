import 'package:cinemapedia/infrastructure/models/moviedb/movie_from_moviedb.dart';

class TheMovieDbResponse {
    final Dates? dates;
    final int page;
    final List<MovieFromMovieDb> results;
    final int totalPages;
    final int totalMovieFromMovieDbs;

    TheMovieDbResponse({
        required this.dates,
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalMovieFromMovieDbs,
    });

    factory TheMovieDbResponse.fromJson(Map<String, dynamic> json) => TheMovieDbResponse(
        dates: json["dates"] ? Dates.fromJson(json["dates"]) : null,
        page: json["page"],
        results: List<MovieFromMovieDb>.from(json["MovieFromMovieDbs"].map((x) => MovieFromMovieDb.fromJson(x))),
        totalPages: json["total_pages"],
        totalMovieFromMovieDbs: json["total_MovieFromMovieDbs"],
    );

    Map<String, dynamic> toJson() => {
        "dates": dates?.toJson(),
        "page": page,
        "MovieFromMovieDbs": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_MovieFromMovieDbs": totalMovieFromMovieDbs,
    };
}

class Dates {
    final DateTime maximum;
    final DateTime minimum;

    Dates({
        required this.maximum,
        required this.minimum,
    });

    factory Dates.fromJson(Map<String, dynamic> json) => Dates(
        maximum: DateTime.parse(json["maximum"]),
        minimum: DateTime.parse(json["minimum"]),
    );

    Map<String, dynamic> toJson() => {
        "maximum": "${maximum.year.toString().padLeft(4, '0')}-${maximum.month.toString().padLeft(2, '0')}-${maximum.day.toString().padLeft(2, '0')}",
        "minimum": "${minimum.year.toString().padLeft(4, '0')}-${minimum.month.toString().padLeft(2, '0')}-${minimum.day.toString().padLeft(2, '0')}",
    };
}
