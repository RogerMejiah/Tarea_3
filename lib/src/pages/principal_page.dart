import 'package:flutter/material.dart';

import '../../api/api.dart';
import '../../models/movies.dart';
import '../widgets/populares_slider.dart';

class PrincipalPage extends StatefulWidget {
  const PrincipalPage({super.key});

  @override
  State<PrincipalPage> createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  late Future<List<Movies>> popularMovies;

  @override
  void initState() {
    super.initState();
    popularMovies = Api().getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'UnahPlus',
          style: TextStyle(
              color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 30),
        ),

        // title: Image.asset(
        //   'assests/unahplus.png',
        //   fit: BoxFit.cover,
        //   height: 30,
        //   filterQuality: FilterQuality.high,
        // ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 30.0,
                backgroundColor: Colors.black54,
                child: Icon(
                  Icons.movie,
                  color: Colors.amber,
                  size: 35,
                ),
                // backgroundImage: AssetImage('images/unahplus.png'),
              ),
              const SizedBox(height: 20),
              const Text('Most popular movies',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
              const SizedBox(height: 20),
              SizedBox(
                child: FutureBuilder(
                    future: popularMovies,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else if (snapshot.hasData) {
                        return PopularesSlider(
                          snapshot: snapshot,
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
