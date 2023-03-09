import 'package:bloc/bloc.dart';
import 'package:bookly_app/views/home/data/models/book_models.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repo/repo_home.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchSimilarBooks({required String cate})async {
    emit(SimilarBooksLoading());
    var result= await  homeRepo.fetchSimilarBooks(category: cate);
    result.fold(
            (failure){
          emit(SimilarBooksError(failure.errorMessage));
        },
            (books){
          emit(SimilarBooksSuccess(books));
        });
  }
}
