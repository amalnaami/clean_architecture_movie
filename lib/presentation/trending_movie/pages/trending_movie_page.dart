import 'package:clean_architecture_project/data/models/trending_movie_model.dart';
import 'package:clean_architecture_project/presentation/trending_movie/bloc/trending_movie_bloc.dart';
import 'package:clean_architecture_project/presentation/trending_movie/bloc/trending_movie_state.dart';
import 'package:clean_architecture_project/presentation/trending_movie/widgets/custom_appbar.dart';
import 'package:clean_architecture_project/presentation/trending_movie/widgets/trending_movie_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/trending_movie_event.dart';

class TrendingMoviePage extends StatefulWidget {
  const TrendingMoviePage({Key? key}) : super(key: key);

  @override
  State<TrendingMoviePage> createState() => _TrendingMoviePageState();
}

class _TrendingMoviePageState extends State<TrendingMoviePage> {
  final double _contentMargin = 15.0;
  final double _heightAppbar = 60.0;

  @override
  void initState() {
    super.initState();
    context.read<TrendingMovieBloc>().add(const OnChanged());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Trending Movie',
        height: _heightAppbar,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(_contentMargin),
        child: BlocBuilder<TrendingMovieBloc, TrendingMovieState>(
          builder: (context, state) {
            if (state is TrendingMovieLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TrendingMovieHasData) {
              return _buildBody(state.result.results!);
            } else if (state is TrendingMovieError) {
              return const Center(
                child: Text('Something went wrong!'),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }

  Widget _buildBody(List<Result> result) {
    return ListView.builder(
      itemCount: result.length,
      itemBuilder: (BuildContext context, int index) {
        return TrendingMovieWidget(
          result: result[index],
          isTrend: true,
        );
      },
    );
  }
}
