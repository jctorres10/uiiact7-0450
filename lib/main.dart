import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ceniceros 0450',
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.deepOrange,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> imgList = [
    "https://raw.githubusercontent.com/jctorres10/img-Actividad13/main/Bewitched.jpg",
    "https://raw.githubusercontent.com/jctorres10/img-Actividad13/main/BDC.jpg",
    "https://raw.githubusercontent.com/jctorres10/img-Actividad13/main/LDCDA.jpg",
    "https://raw.githubusercontent.com/jctorres10/img-Actividad13/main/Lets-Start-Here.jpg",
    "https://raw.githubusercontent.com/jctorres10/img-Actividad13/main/MaquinaPersona.jpg",
    "https://raw.githubusercontent.com/jctorres10/img-Actividad13/main/NSLQVAPM.jpg"
  ];

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffddedf2),
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text(
          "Vinill Music 0450",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            CarouselSlider(
              items: imgList
                  .map((e) => Center(
                        child: Image.network(e),
                      ))
                  .toList(),
              options: CarouselOptions(
                  initialPage: 0,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 2),
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  onPageChanged: (value, _) {
                    setState(() {
                      _currentPage = value;
                    });
                  }),
            ),
            buildCarouselIndicator(),
            const Text(
              "Los artístas del momento",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }

  buildCarouselIndicator() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      for (int i = 0; i < imgList.length; i++)
        Container(
          margin: const EdgeInsets.all(5),
          height: i == _currentPage ? 7 : 5,
          width: i == _currentPage ? 7 : 5,
          decoration: BoxDecoration(
              color: i == _currentPage
                  ? const Color(0xffffffff)
                  : const Color(0xff848484),
              shape: BoxShape.circle),
        )
    ]);
  }
}
