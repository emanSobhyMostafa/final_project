import 'package:final_project/screens/deals/deals_bloc/deal_event.dart';
import 'package:final_project/screens/deals/deals_bloc/deal_state.dart';
import 'package:final_project/services/service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DealBloc extends Bloc<DealEvents, DealState> {
  DealBloc() : super(WaitingState());

  @override
  Stream<DealState> mapEventToState(DealEvents event) async* {
    if (event is GetDataEvent) {
      yield WaitingState();

      try {
        final deals = await getDeals();
        // print(products);
        // print('ppppppppppppppppppppppppppppppppppppppppppppppppppppp');

        yield SuccessState(dealProducts:  deals);
      } on Exception catch (e) {
        yield ErrorState();
      }
    }
  }
}
