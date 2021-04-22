import 'package:final_project/screens/category/category_bloc/category_event.dart';
import 'package:final_project/screens/category/category_bloc/category_state.dart';
import 'package:final_project/services/service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryBloc extends Bloc<CategoryEvents, CategoryState> {
  final categoryName;
  CategoryBloc(this.categoryName) : super(WaitingState());

  @override
  Stream<CategoryState> mapEventToState(CategoryEvents event) async* {
    if (event is GetDataEvent) {
      yield WaitingState();

      try {
        final products = await getProducts(categoryName);
        // print(products);
        // print('ppppppppppppppppppppppppppppppppppppppppppppppppppppp');

        yield SuccessState(categoryProducts: products);
      } on Exception catch (e) {
        yield ErrorState();
      }
    }
  }
}
