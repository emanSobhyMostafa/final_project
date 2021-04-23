import 'package:equatable/equatable.dart';
import 'package:final_project/models/product.dart';




class TotalInCartState extends Equatable {
  final DateTime time;

  TotalInCartState(this.time);
  @override
  // TODO: implement props
  List<Object> get props => [time];
}
