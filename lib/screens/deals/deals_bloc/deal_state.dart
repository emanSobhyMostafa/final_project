import 'package:equatable/equatable.dart';
import 'package:final_project/models/product.dart';

abstract class DealState extends Equatable {
  final List<Product> dealProducts;

  DealState({this.dealProducts});
}

class WaitingState extends DealState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class SuccessState extends DealState {
    final List<Product> dealProducts;


  SuccessState({this.dealProducts})
      : super(dealProducts: dealProducts);
  @override
  // TODO: implement props
  List<Object> get props => [dealProducts];
}

class ErrorState extends DealState {
  final String error;

  ErrorState({this.error});
  @override
  // TODO: implement props
  List<Object> get props => [error];
}
