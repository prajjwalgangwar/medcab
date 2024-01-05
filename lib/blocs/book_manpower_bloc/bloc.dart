import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medcab_assignment/blocs/book_manpower_bloc/event.dart';
import 'package:medcab_assignment/blocs/book_manpower_bloc/state.dart';

class BookManpowerBloc extends Bloc<ManpowerEvent, ManpowerState> {
  BookManpowerBloc() : super(ManpowerState());
}
