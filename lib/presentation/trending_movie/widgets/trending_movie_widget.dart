import 'dart:math' as math;

import 'package:clean_architecture_project/data/models/trending_movie_model.dart';
import 'package:flutter/material.dart';

class TrendingMovieWidget extends StatelessWidget {
  const TrendingMovieWidget(
      {Key? key, required this.result, required this.isTrend})
      : super(key: key);
  final Result result;
  final bool isTrend;
  final double _contentMargin = 10.0;
  final double _opacity = 0.5;
  final double _heightContainer = 100.0;
  final double _widthContainer = 70.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: _baseContainerDecoration(),
          padding: EdgeInsets.all(_contentMargin),
          margin: EdgeInsets.all(_contentMargin),
          child: Row(
            children: [_moviePhoto(), _buildMovieDetails(context)],
          ),
        ),
        _buildRate(context),
      ],
    );
  }

  Widget _moviePhoto() {
    return Container(
      height: _heightContainer,
      width: _widthContainer,
      margin: EdgeInsets.only(right: _contentMargin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_contentMargin),
        image: DecorationImage(
            image: NetworkImage(isTrend
                ? "https://images.unsplash.com/photo-1598899134739-24c46f58b8c0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1156&q=80"
                : 'https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80'),
            fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildMovieDetails(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _buildRichText(
              'Movie Type:  ', "${result.mediaType ?? "No type "}", context),
          SizedBox(height: _contentMargin),
          _buildRichText(
              'Movie Title:  ', result.title ?? "No title ", context),
          SizedBox(height: _contentMargin),
          _buildRichText(
              'Movie Date: ', "${result.releaseDate ?? "No Date"}", context),
        ],
      ),
    );
  }

  Decoration _baseContainerDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(_contentMargin),
      color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(_opacity),
    );
  }

  Widget _buildRate(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Icon(
            Icons.star_rate_rounded,
            color: Color(0xffFFA600),
          ),
          SizedBox(
            width: 50,
            child: _buildRichText(
                '', "${result.voteAverage ?? "No rate "}", context),
          ),
        ],
      ),
    );
  }

  Widget _buildRichText(
      String title, String description, BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style:
              const TextStyle(fontWeight: FontWeight.w900, color: Colors.black),
        ),
        Expanded(
          child: Text(description.replaceAll("00:00:00.000", ""),
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w200)),
        ),
      ],
    );
  }
}
