part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {
  const SearchEvent(this.name);
  
  final String? name;
}

class SearchName extends SearchEvent{
  const SearchName(super.name);
}