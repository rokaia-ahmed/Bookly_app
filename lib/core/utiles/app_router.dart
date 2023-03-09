import 'package:bookly_app/core/utiles/service_locator.dart';
import 'package:bookly_app/views/home/data/models/book_models.dart';
import 'package:bookly_app/views/home/data/repo/home_repo_impl.dart';
import 'package:bookly_app/views/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/views/home/presentation/screens/book_details.dart';
import 'package:bookly_app/views/home/presentation/screens/home_screen.dart';
import 'package:bookly_app/views/search/screens/search_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../views/splash/presentation/screens/splash_screen.dart';

abstract class AppRouter{
  static const  kHomeScreen='/HomeScreen';
  static const  kBookDetails='/BoolDetails';
  static const  kSearchScreen='/SearchScreen';
 static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: kHomeScreen,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: kBookDetails,
        builder: (context, state) => BlocProvider(
          create:(context)=>SimilarBooksCubit(getIt.get<HomeRepoImp>()) ,
            child:  BoolDetails(model:state.extra as BookModel ),
        ),
      ),
      GoRoute(
        path: kSearchScreen,
        builder: (context, state) => const SearchScreen(),
      ),
    ],
  );
}