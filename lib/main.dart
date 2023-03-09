
import 'package:bookly_app/core/utiles/app_colors.dart';
import 'package:bookly_app/core/utiles/service_locator.dart';
import 'package:bookly_app/views/home/data/repo/home_repo_impl.dart';
import 'package:bookly_app/views/home/presentation/manager/Newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/views/home/presentation/manager/feature_books_cubit/feature_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/utiles/app_router.dart';


void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:(context)=>FeatureBookCubit(
              getIt.get<HomeRepoImp>(),
          )..fetchFeatureBooks() ,
        ),
        BlocProvider(
          create:(context)=>NewestBooksCubit(
           getIt.get<HomeRepoImp>())..fetchNewestBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig:AppRouter.router ,
        debugShowCheckedModeBanner:false ,
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColor.primaryColor,
        ),
      ),
    );
  }
}

