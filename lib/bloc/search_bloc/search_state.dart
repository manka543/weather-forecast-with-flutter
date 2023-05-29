part of 'search_bloc.dart';

@immutable
abstract class SearchState {
  const SearchState(this.data);
  final List<Geolocation>? data;
}

class SearchInitial extends SearchState {
  const SearchInitial() : super(null);
}

class SearchLoading extends SearchState {
  const SearchLoading() : super(null);
}

class SearchValid extends SearchState {
  const SearchValid(super.data);
}

class SearchNothingFound extends SearchState {
  const SearchNothingFound(): super(null);
}

class SearchError extends SearchState {
  final String errorCode;
  const SearchError(this.errorCode) : super(null);
}
