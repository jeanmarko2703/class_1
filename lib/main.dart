import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const backgroundColor = Color.fromRGBO(17, 0, 32, 1);
    const secondBackgroundColor = Color.fromRGBO(12, 30, 47, 1);

    final List<String> categories = ["Movies", "Series", "Tv Show"];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Netflix',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          title: Image.asset(
            "assets/logo.png",
            width: size.width * 0.4,
          ),
          backgroundColor: backgroundColor,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(15),
              color: secondBackgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(
                    Icons.search,
                  ),
                  ...categories.map((e) => Text(e))
                ],
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Popular series"),
                          SizedBox(
                            height: 10,
                          ),
                          MovieList(),
                        ],
                      ),
                    );
                  }),
            ))
          ],
        ),
        bottomNavigationBar: Container(
            color: secondBackgroundColor,
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: const SafeArea(
              bottom: true,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.home),
                  Icon(Icons.favorite),
                  Icon(Icons.info)
                ],
              ),
            )),
      ),
    );
  }
}

class MovieList extends StatelessWidget {
  const MovieList({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.25,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Image.asset(
                      "assets/post.jpg",
                      width: size.width * 0.3,
                    ),
                    const Text("Garfield Movie")
                  ],
                ));
          }),
    );
  }
}
