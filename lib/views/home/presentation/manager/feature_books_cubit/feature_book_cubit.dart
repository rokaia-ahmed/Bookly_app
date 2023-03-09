import 'package:bookly_app/views/home/data/repo/repo_home.dart';
import 'package:bookly_app/views/home/presentation/manager/feature_books_cubit/feature_book_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeatureBookCubit extends Cubit<FeatureBookStates>{
  FeatureBookCubit(this.homeRepo) :super(FeatureBookInitial());
  final HomeRepo homeRepo;

  Future<void> fetchFeatureBooks()async {
    emit(FeatureBookLoading());
  var result= await  homeRepo.fetchFeaturedBooks();
  result.fold(
          (failure){
            emit(FeatureBookError(failure.errorMessage));
          },
          (books){
            emit(FeatureBookSuccess(books));
          });
  }
}