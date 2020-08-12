import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AbstractSearchBlocEvent {}

abstract class AbstractSearchBlocState {}

class SearchBlocInitialState extends AbstractSearchBlocState {}

class SearchBloc
    extends Bloc<AbstractSearchBlocEvent, AbstractSearchBlocState> {
  SearchBloc(AbstractSearchBlocState initialState) : super(initialState);

  @override
  Stream<AbstractSearchBlocState> mapEventToState(
      AbstractSearchBlocEvent event) async* {
    yield SearchBlocInitialState();
  }
}
