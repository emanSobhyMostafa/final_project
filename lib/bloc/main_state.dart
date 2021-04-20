import 'package:equatable/equatable.dart';

abstract class MainState extends Equatable {
  final Map<String, Map<String, dynamic>> mainCategoryData;

  MainState({this.mainCategoryData});
}

class WaitingState extends MainState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class SuccessState extends MainState {
  final Map<String, Map<String, dynamic>> mainCategoryData;

  SuccessState(this.mainCategoryData) : super(mainCategoryData: mainCategoryData);
  @override
  // TODO: implement props
  List<Object> get props => [mainCategoryData];
}

class ErrorState extends MainState {
  final String error;

  ErrorState({this.error});
  @override
  // TODO: implement props
  List<Object> get props => [error];
}
