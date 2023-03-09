
import 'package:bookly_app/views/home/data/models/book_models.dart';
import 'package:equatable/equatable.dart';

abstract class NewestBooksState extends Equatable {
  const NewestBooksState();
  @override
  List<Object> get props => [];
}

class NewestBooksInitial extends NewestBooksState {}
class NewestBooksLoading extends NewestBooksState {}
class NewestBooksError extends NewestBooksState {
  final String error;

  const NewestBooksError(this.error);
}
class NewestBooksSuccess extends NewestBooksState {
  final List<BookModel>books;

  const NewestBooksSuccess(this.books);
}
