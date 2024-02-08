import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, this.title});

  final String? title;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: NestedScrollView(
        body: const Column(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height * 0.35,
              leading: Container(
                decoration: BoxDecoration(
                  color: theme.primaryColor,
                  image: const DecorationImage(
                    image: AssetImage('assets/images/LOGO.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: const Column(),
              ),
              toolbarHeight: 100,
              leadingWidth:100,
              floating: true,
              pinned: false,
              snap: true,
              flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                decoration: BoxDecoration(
                  color: theme.primaryColor,
                  image: const DecorationImage(
                    image: AssetImage('assets/images/BG2.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: const Column(),
              )),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: theme.primaryColor,
                height: 20,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      height: 20,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
      ),
    );
  }
}