import 'package:equatable/equatable.dart';
import 'package:final_project/models/product.dart';

abstract class MainState extends Equatable {
  final Map<String, Map<String, dynamic>> mainCategoryData;
  final List<String> allCategoriesNames;
  final List<String> userFavourites;
  final List<Product> mainDealsData;

  MainState(
      {this.mainCategoryData, this.allCategoriesNames, this.userFavourites , this.mainDealsData});
}

class WaitingState extends MainState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class SuccessState extends MainState {
  final Map<String, Map<String, dynamic>> mainCategoryData;
  final List<Product> mainDealsData;
  final List<String> allCategoriesNames;
    final List<String> userFavourites;


  SuccessState({this.mainCategoryData, this.allCategoriesNames , this.userFavourites,this.mainDealsData})
      : super(
            mainCategoryData: mainCategoryData,
            allCategoriesNames: allCategoriesNames,
            mainDealsData: mainDealsData
            );
  @override
  // TODO: implement props
  List<Object> get props => [mainCategoryData,mainDealsData];
}

class ErrorState extends MainState {
  final String error;

  ErrorState({this.error});
  @override
  // TODO: implement props
  List<Object> get props => [error];
}

