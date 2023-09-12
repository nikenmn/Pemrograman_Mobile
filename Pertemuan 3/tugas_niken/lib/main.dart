import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Praktikum 2',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(212, 185, 148, 253),
        ),
        useMaterial3: true,
        fontFamily: 'Rubik',
      ),
      home: const MyHomePage(title: 'Somethinc For U'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                SizedBox(
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 45, 81, 143),
                            border: Border(
                              right: BorderSide(
                                  width: 3,
                                  color: Color.fromARGB(212, 185, 148, 253)),
                            )),
                        alignment: Alignment.center,
                        height: 40,
                        width: 205.5,
                        child: Text(
                          'NEW LAUNCH',
                          style: TextStyle(
                              fontSize: 16.5,
                              color: Colors.white,
                              fontFamily: 'Rubik'),
                        ),
                      ),
                      Container(
                        color: Color.fromARGB(255, 45, 81, 143),
                        alignment: Alignment.center,
                        height: 40,
                        width: 205.5,
                        child: Text(
                          'BEST DEAL',
                          style: TextStyle(
                              fontSize: 16.5,
                              color: Colors.white,
                              fontFamily: 'Rubik'),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      banner(),
                      Konten1(),
                      Konten2(),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class banner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 5),
          padding: EdgeInsets.only(left: 20, bottom: 5),
          color: Color.fromARGB(212, 185, 148, 253),
          alignment: Alignment.bottomLeft,
          child: Text(
            'Girls favourite.',
            style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 10, 35, 77),
                fontFamily: 'Rubik'),
          ),
          height: 320,
          width: 600,
        ),
        Container(
          margin: EdgeInsets.only(top: 5),
          padding: EdgeInsets.only(bottom: 5),
          color: Color.fromARGB(255, 45, 81, 143),
          alignment: Alignment.bottomCenter,
          child: Text(
            'Somethinc Hooman Cushion',
            style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Rubik'),
          ),
          height: 280,
          width: 590,
        ),
        Container(
          //margin: EdgeInsets.only(top: 5),
          alignment: Alignment.topCenter,
          child: Image(
            image:
                AssetImage('assets/somethinc-hooman-breathable-cushiondfs.jpg'),
          ),
          height: 230,
        )
      ],
    );
  }
}

class Konten1 extends StatelessWidget {
  const Konten1({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10, left: 8),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 162, 187, 229),
                  border: Border.all(
                      width: 3, color: Color.fromARGB(212, 185, 148, 253))),
              alignment: Alignment.center,
              child: Image(
                image: AssetImage(
                  'assets/serum.jpg',
                ),
              ),
              height: 100,
            ),
            Container(
              margin: EdgeInsets.only(top: 10, right: 8),
              padding: EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 162, 187, 229),
                /*border: Border(
                      right: BorderSide(
                          width: 1,
                          color: Color.fromARGB(212, 185, 148, 253)))*/
              ),
              alignment: Alignment.center,
              child: Text(
                'Skincare Enthusiast Jangan Sampai Ketingggalan!',
                style: TextStyle(fontSize: 16, fontFamily: 'Rubik'),
              ),
              width: 185,
              height: 100,
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(left: 8, bottom: 3, right: 8),
          decoration: BoxDecoration(
              color: Color.fromARGB(212, 185, 148, 253),
              border: Border(right: BorderSide(width: 3, color: Colors.white))),
          alignment: Alignment.topLeft,
          padding: EdgeInsets.all(10),
          width: 394.3,
          child: Text(
            'Ragam Serum untuk Kondisi Kulitmu.',
            style: TextStyle(fontSize: 16, fontFamily: 'Rubik'),
          ),
          height: 42,
        ),
      ],
    );
  }
}

class Konten2 extends StatelessWidget {
  const Konten2({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10, left: 8),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 162, 187, 229),
                  border: Border.all(
                      width: 3, color: Color.fromARGB(212, 185, 148, 253))),
              alignment: Alignment.center,
              child: Image(
                image: AssetImage(
                  'assets/eyeshadow.jpg',
                ),
              ),
              height: 100,
            ),
            Container(
              margin: EdgeInsets.only(top: 10, right: 8),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 162, 187, 229),
              ),
              alignment: Alignment.center,
              child: Text(
                'Eyeshadow Palette and SRSLY Balancer Makeup Setting Spray',
                style: TextStyle(fontSize: 16, fontFamily: 'Rubik'),
              ),
              width: 185,
              height: 100,
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(left: 8, bottom: 3, right: 8),
          decoration: BoxDecoration(
              color: Color.fromARGB(212, 185, 148, 253),
              border: Border(right: BorderSide(width: 3, color: Colors.white))),
          alignment: Alignment.topLeft,
          padding: EdgeInsets.all(10),
          width: 408,
          child: Text(
            'Best Combo U Need!',
            style: TextStyle(fontSize: 16, fontFamily: 'Rubik'),
          ),
          height: 42,
        ),
      ],
    );
  }
}
