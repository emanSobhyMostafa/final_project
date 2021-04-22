import 'package:final_project/bloc/main_event.dart';
import 'package:final_project/bloc/main_state.dart';
import 'package:final_project/services/service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainBloc extends Bloc<MainEvents, MainState> {
  MainBloc() : super(WaitingState());

  @override
  Stream<MainState> mapEventToState(MainEvents event) async* {
    if (event is GetDataEvent) {
      yield WaitingState();

      try {
        final allMainCats = await getMainCategories();
    
        final allCats = await getAllCategories();
    
        yield SuccessState(
            mainCategoryData: allMainCats, allCategoriesNames: allCats);
      } on Exception catch (e) {
        yield ErrorState();
      }
    }
  }
}