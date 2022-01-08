import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:movieapp/features/movie/domain/entities/movie_entity.dart';
import 'package:movieapp/features/movie/presentation/controllers/movie_controller.dart';
import 'package:movieapp/features/movie/presentation/ui/widgets/custom_list_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final MovieController _controller;

  @override
  void initState() {
    super.initState();
    _controller = GetIt.I.get<MovieController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              ValueListenableBuilder<MovieEntity?>(
                valueListenable: _controller.movies,
                builder: (__, movies, _) {
                  return Visibility(
                    visible: movies != null,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Movies',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        const SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.grey.withOpacity(0.05),
                                Colors.grey.withOpacity(0.15),
                                Colors.grey.withOpacity(0.05),
                              ],
                              stops: [0, 7, 1],
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  onChanged: _controller.onChanged,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.search),
                                    fillColor: Colors.white30,
                                    focusColor: Colors.white30,
                                    hoverColor: Colors.white30,
                                  ),
                                  cursorColor: Colors.white30,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
              ValueListenableBuilder<MovieEntity?>(
                valueListenable: _controller.movies,
                builder: (_, movies, __) {
                  return movies != null
                      ? ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: movies.listMovies.length,
                          itemBuilder: (_, idx) => CustomListCardWidget(
                            movie: movies.listMovies[idx],
                          ),
                          separatorBuilder: (_, __) => Divider(),
                        )
                      : Lottie.asset('assets/lottie.json');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
