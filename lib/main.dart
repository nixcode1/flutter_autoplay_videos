import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter AutoPlay'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    // _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new NotificationListener(
        child: ListView.builder(
          // controller: _scrollController,
          itemCount: 10,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Container(
                color: Colors.red,
                height: MediaQuery.of(context).size.height * 0.3,
                margin: EdgeInsets.only(bottom: 20),
                child: Center(child: Text("Default")),
              );
            }
            return Container(
              color: Colors.red,
              height: MediaQuery.of(context).size.height * 0.3,
              margin: EdgeInsets.only(bottom: 20),
              child: Center(child: Text("${index}")),
            );
          },
        ),
        onNotification: (ScrollUpdateNotification notification) {
          // double screenHeight = notification.metrics.viewportDimension +
          //     AppBar().preferredSize.height;
          // // MediaQuery.of(context).padding.top;
          // //How many pixels scrolled from pervious frame
          // print("SCREEN HEIGHT: $screenHeight");
          // //List scroll position
          // print("PIXELS: ${notification.metrics.pixels}");
          int currentPage = (notification.metrics.pixels /
                  (MediaQuery.of(context).size.height * 0.3))
              .floor() + 1;
          print("Current Screen: $currentPage");

          // if (screenHeight > notification.metrics.pixels) {
          //   print(
          //       "Current Screen: $currentPage");
          // } else {
          //   // print(
          //   //     "Current Screen: ${(notification.metrics.pixels & ) / MediaQuery.of(context).size.height * 0.3}");
          // }
          return true;
        },
      ),
    );
  }
}
