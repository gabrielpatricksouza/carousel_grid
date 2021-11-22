import 'package:carousel_grid/carousel_grid.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> imagesUrls = [
    "https://scaffoldtecnologia.com.br/wp-content/uploads/2021/10/home4.jpg",
    "https://scaffoldtecnologia.com.br/wp-content/uploads/2021/10/app-2.png",
    "https://scaffoldtecnologia.com.br/wp-content/uploads/2021/10/app.jpg",
    "https://scaffoldtecnologia.com.br/wp-content/uploads/2021/10/home-1.jpg",
    "https://scaffoldtecnologia.com.br/wp-content/uploads/2021/10/page-1.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: CarouselGrid(
          height: 285,
          width: 400,
          listUrlImages: imagesUrls,
          iconBack: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
