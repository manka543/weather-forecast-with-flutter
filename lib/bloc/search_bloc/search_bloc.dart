import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:weather_forecast/model/geolocation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(const SearchInitial()) {
    on<SearchName>((event, emit) async {
      emit(const SearchLoading());
      var url = Uri.https("geocoding-api.open-meteo.com", 'v1/search', {"name" : event.name, "count": "10", "lang" : "pl"}, );
      var response = await http.get(url);
      final parsed = jsonDecode(response.body);
      final locations = <Geolocation>[];
      for (var location in parsed["results"]) {
        locations.add(Geolocation.fromJson(location));
      }
      emit(SearchValid(locations));
    });
  }
}
