import 'package:bookly_app/core/error/failure.dart';
import 'package:bookly_app/core/utiles/api_service.dart';
import 'package:bookly_app/views/home/data/models/book_models.dart';
import 'package:bookly_app/views/home/data/repo/repo_home.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImp implements HomeRepo{
  final ApiService apiService;
  HomeRepoImp(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
   try{
     var data = await apiService.get(
         endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest&q=subject:computer science');
     List<BookModel> books =[];
     for(var item in data ['items']){
       books.add(BookModel.fromJson(item));
     }
     return right(books);
   } catch(e){
     if(e is DioError){
       return Left(ServerFailure.fromDioError(e));
     }
     return Left(ServerFailure(e.toString()));
   }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks()async {
    try{
      var data = await apiService.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=subject:programming');
      List<BookModel> books =[];
      for(var item in data ['items']){
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch(e){
      if(e is DioError){
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({required String category})async {
    try{
      var data = await apiService.get(
          endPoint: 'volumes?Filtering=free-ebooks&Sorting=relevance&q=programming');
      List<BookModel> books =[];
      for(var item in data ['items']){
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch(e){
      if(e is DioError){
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}