import 'package:flutter/material.dart';
import 'package:weather_forecast/views/home_page.dart';
import 'package:weather_forecast/views/search_page.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Weather"),
        ),
        body: TabBarView(controller: _tabController, children: const [
          HomePage(),
          SearchPage(),
        ]),
        bottomNavigationBar: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              text: "Home",
              icon: Icon(Icons.home),
            ),
            Tab(
              text: "Search",
              icon: Icon(Icons.search),
            ),
          ],
        ));
  }
}
