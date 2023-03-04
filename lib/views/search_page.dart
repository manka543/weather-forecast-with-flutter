import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/bloc/search_bloc/search_bloc.dart';
import 'package:weather_forecast/widgets/geolocation_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with AutomaticKeepAliveClientMixin {
  late final TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: TextField(
            controller: _searchController,
            decoration: const InputDecoration(hintText: "Place name eg.London"),
            onSubmitted: (value) => context.read<SearchBloc>().add(SearchName(value)),
          ),
        ),
        BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
          switch (state.runtimeType) {
            case SearchValid:
              return SliverList(delegate: SliverChildBuilderDelegate((context, index) => Location(geolocation: state.data![index]),childCount: state.data!.length));
            case SearchLoading:
                return const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()));
            case SearchInitial:
              return const SliverToBoxAdapter(child: Center(child: Text("Type some name to search for it")));
            case SearchError:
            default:
                return const SliverToBoxAdapter(child: Center(child: Text("An error has occurred the process")));
          }
        },),
      ],
    );
  }
}
