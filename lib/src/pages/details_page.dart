import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../models/movies.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.movies});

  final Movies movies;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar.large(
          leading: Container(
            height: 70,
            width: 70,
            margin: const EdgeInsets.only(
              top: 16,
              left: 16,
            ),
            decoration: BoxDecoration(
              color: const Color.fromARGB(106, 241, 241, 241),
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_rounded),
            ),
          ),
          backgroundColor: const Color.fromRGBO(12, 53, 106, 150),
          expandedHeight: 500,
          pinned: true,
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(
              '${Constants.imagePath}${movies.posterPath}',
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverToBoxAdapter(
            child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Overview',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(movies.title,
                  style: const TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                      fontSize: 17)),
              const SizedBox(height: 6),
              Row(
                children: [
                  const Icon(Icons.calendar_month, color: Colors.amber),
                  Text(
                    movies.releaseDate.substring(0, 4),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 30),
                  const Icon(Icons.star, color: Colors.amber),
                  Text(
                    movies.voteAverage.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                movies.overview,
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 15),
              const Text(
                'Cast',
                style: TextStyle(
                    color: Colors.amber,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(movies.id.toString().characters.first,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17)),
              const SizedBox(height: 10),
            ],
          ),
        )),
      ],
    ));
  }
}
