part of 'similar_books_cubit.dart';

abstract class SimilarBooksState extends Equatable {
  const SimilarBooksState();
  @override
  List<Object> get props => [];
}

class SimilarBooksInitial extends SimilarBooksState {}
class SimilarBooksSuccess extends SimilarBooksState {
  final List<BookModel> book;
  const SimilarBooksSuccess(this.book);
}
class SimilarBooksError extends SimilarBooksState {
  final String errorMessage;

  const SimilarBooksError(this.errorMessage);
}
class SimilarBooksLoading extends SimilarBooksState {}

