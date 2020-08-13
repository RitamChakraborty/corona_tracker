import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AbstractCountrySearchEvent {}

class CountrySearchInvokeInitialEvent extends AbstractCountrySearchEvent {}

class FilterChangeEvent extends AbstractCountrySearchEvent {
  final String _filter;

  FilterChangeEvent({@required String filter})
      : this._filter = filter,
        assert(filter != null);

  String get filter => _filter;
}

abstract class AbstractCountrySearchState {}

class CountrySearchInitialState extends AbstractCountrySearchState {}

class FilterChangedState extends AbstractCountrySearchState {
  final String _filter;

  FilterChangedState({@required String filter})
      : this._filter = filter,
        assert(filter != null);

  String get filter => _filter;
}

class CountrySearchBloc
    extends Bloc<AbstractCountrySearchEvent, AbstractCountrySearchState> {
  CountrySearchBloc(AbstractCountrySearchState initialState)
      : super(initialState);

  @override
  Stream<AbstractCountrySearchState> mapEventToState(
      AbstractCountrySearchEvent event) async* {
    if (event is CountrySearchInvokeInitialEvent) {
      yield CountrySearchInitialState();
    } else if (event is FilterChangeEvent) {
      String filter = event.filter;
      yield FilterChangedState(filter: filter);
    }
  }
}
