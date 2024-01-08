import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medcab_assignment/api_layer/api_provider.dart';
import 'package:medcab_assignment/blocs/book_manpower_bloc/event.dart';
import 'package:medcab_assignment/blocs/book_manpower_bloc/state.dart';
import 'package:medcab_assignment/models/faq_model.dart';

class BookManpowerBloc extends Bloc<ManpowerEvent, ManpowerState> {
  BookManpowerBloc() : super(const ManpowerState()) {
    on<FetchDetailsEvent>(fetchDetails);
  }

  fetchDetails(FetchDetailsEvent event, Emitter<ManpowerState> emit) async {
    emit(state.copyWith(faqResponseStatus: FAQResponseStatus.fetching));
    print('fetching details of faq');
    FAQResponse? response = await ApiProvider.getFaqDetails();
    if (response != null) {
      emit(state.copyWith(
          faqResponseStatus: FAQResponseStatus.fetched, faqResponse: response));
    } else {
      emit(state.copyWith(faqResponseStatus: FAQResponseStatus.error));
    }
  }
}
