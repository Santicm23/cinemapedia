import 'package:go_router/go_router.dart';

import 'package:cinemapedia/presentation/screens/screens.dart';
import 'package:cinemapedia/presentation/views/views.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    // Rutas nuevas
    ShellRoute(
        builder: (context, state, child) {
          return HomeScreen(
            childView: child,
          );
        },
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) {
              return const HomeView();
            },
            routes: [
              GoRoute(
                path: 'movie/:id',
                builder: (context, state) {
                  final movieId = state.pathParameters['id'] ?? 'null';
                  return MovieScreen(
                    movieId: movieId,
                  );
                },
              ),
            ]
          ),
          GoRoute(
            path: '/categories',
            builder: (context, state) {
              return const CategoriesView();
            },
          ),
          GoRoute(
            path: '/favorites',
            builder: (context, state) {
              return const FavoritesView();
            },
          ),
        ])

    // Rutas antiguas
    // GoRoute(
    //     path: '/',
    //     name: HomeScreen.name,
    //     builder: (context, state) => const HomeScreen(childView: HomeView(),),
    //     routes: [
    //       GoRoute(
    //         path: 'movie/:id',
    //         name: MovieScreen.name,
    //         builder: (context, state) {
    //           final movieId = state.pathParameters['id'] ?? 'null';
    //           return MovieScreen(
    //             movieId: movieId,
    //           );
    //         },
    //       ),
    //     ]),
  ],
);
