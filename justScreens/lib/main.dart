import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xffa259ff);
    return MaterialApp(
      theme: ThemeData(
        primaryColor: primaryColor,
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: NestedScrollView(
        body: Container(
            // decoration: BoxDecoration(
            //     color: theme.primaryColor,
            //     image: const DecorationImage(
            //       image: AssetImage('assets/images/BG.png'),
            //       fit: BoxFit.cover,
            //     )),
            ),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              expandedHeight: MediaQuery.of(context).size.height * 0.35,
              floating: true,
              pinned: false,
              snap: true,
              flexibleSpace: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: theme.primaryColor,
                        image: const DecorationImage(
                          image: AssetImage('assets/images/BG2.png'),
                          fit: BoxFit.cover,
                        )),
                  )
                ],
              ),
            )
          ];
        },
      ),
    );
  }
}
