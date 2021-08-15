import 'package:flutter/material.dart';
import 'package:hackathon_fatura/tasks/third_task/provider_controllers/home_controller.dart';
import 'package:hackathon_fatura/tasks/third_task/widgets/tab_content.dart';
import 'package:provider/provider.dart';

/* Create a movie mobile application that get popular And recent movies
with an ability to add movie to Favourite list that will be offline
storage on device (use any way you want) that will be displayed
in favorite tabs

- design of this app is attached in project folder
- Adding a progress indicator when information is loading
- Deal with errors coming from the backend (because eventually it will happen!)
- Create model objects for the API data retrieved to avoid working with dynamic (serialisation/deserialisation?)
- Add some sort of state management to show how that is done (InheritedWidget, Provider, GetIt, Mobx and so on)
- add pagination mechanism
 */
class ThirdTaskScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeController(),
      child: Consumer<HomeController>(builder: (_, provider, __) {
        return Center(
          child: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                bottom: const TabBar(
                  tabs: [
                    Tab(text: "Popular"),
                    Tab(text: "Top Rated"),
                    Tab(text: "Favourite"),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  TabContent(movies: provider.popularMovies),
                  TabContent(movies: provider.topRatedMovies),
                  TabContent(movies: provider.favourties),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
