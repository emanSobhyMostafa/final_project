// import 'package:equatable/equatable.dart';
// import 'package:final_project/models/product.dart';

// abstract class MainState extends Equatable {
//   final Map<String, Map<String, dynamic>> mainCategoryData;
//   final Map<String, List<Product>> allCategories;

//   MainState({this.mainCategoryData, this.allCategories});
// }

// class WaitingState extends MainState {
//   @override
//   // TODO: implement props
//   List<Object> get props => [];
// }

// class SuccessState extends MainState {
//   final Map<String, Map<String, dynamic>> mainCategoryData;
//   final Map<String, List<Product>> allCategories;

//   SuccessState({this.mainCategoryData, this.allCategories})
//       : super(mainCategoryData: mainCategoryData, allCategories: allCategories);
//   @override
//   // TODO: implement props
//   List<Object> get props => [mainCategoryData];
// }

// class ErrorState extends MainState {
//   final String error;

//   ErrorState({this.error});
//   @override
//   // TODO: implement props
//   List<Object> get props => [error];
// }
