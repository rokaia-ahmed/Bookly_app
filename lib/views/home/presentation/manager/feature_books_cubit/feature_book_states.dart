import 'package:bookly_app/views/home/data/models/book_models.dart';
import 'package:equatable/equatable.dart';

abstract class FeatureBookStates extends Equatable{
  const FeatureBookStates();
  @override
  List<Object?> get props => [];
}
class FeatureBookInitial extends FeatureBookStates{}
class FeatureBookLoading extends FeatureBookStates{}
class FeatureBookSuccess extends FeatureBookStates{
  final List<BookModel> books;
  const FeatureBookSuccess(this.books);
}
class FeatureBookError extends FeatureBookStates{
  final String errorMessage;
  const FeatureBookError(this.errorMessage);
}