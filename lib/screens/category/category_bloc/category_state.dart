import 'package:equatable/equatable.dart';
import 'package:final_project/models/product.dart';

abstract class CategoryState extends Equatable {
  final List<Product> categoryProducts;

  CategoryState({this.categoryProducts});
}

class WaitingState extends CategoryState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class SuccessState extends CategoryState {
    final List<Product> categoryProducts;


  SuccessState({this.categoryProducts})
      : super(categoryProducts: categoryProducts);
  @override
  // TODO: implement props
  List<Object> get props => [categoryProducts];
}

class ErrorState extends CategoryState {
  final String error;

  ErrorState({this.error});
  @override
  // TODO: implement props
  List<Object> get props => [error];
}
