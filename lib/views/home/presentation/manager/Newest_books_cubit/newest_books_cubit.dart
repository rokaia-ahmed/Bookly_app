import 'package:bloc/bloc.dart';
import '../../../data/repo/repo_home.dart';
import 'newest_books_state.dart';


class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchNewestBooks()async {
    emit(NewestBooksLoading());
    var result= await  homeRepo.fetchNewestBooks();
    result.fold(
            (failure){
          emit(NewestBooksError(failure.errorMessage));
        },
            (books){
          emit(NewestBooksSuccess(books));
        });
  }
}
