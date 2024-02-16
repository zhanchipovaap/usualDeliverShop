import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: NestedScrollView(
        body: Container(
          decoration: BoxDecoration(
            color: theme.canvasColor,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.036),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.115,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/BOX.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.025),
                child: Text(
                  "Non-Contact\n Deliveries",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleLarge,
                ),
              ),
              Text(
                "When placing an order, select the option\n “Contactless delivery” and the courier will leave\n your order at the door.",
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium,
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.06),
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    minimumSize: Size(MediaQuery.of(context).size.width-20,50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: const Color(0xff0BCE83),
                    padding: const EdgeInsets.all(10),
                  ),
                  child: Text(
                    'ORDER NOW',
                    style: theme.textTheme.labelMedium,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.018),
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: const Color(0xff9586A8),
                  ),
                  child: const Text('DISMISS'),
                ),
              ),
            ],
          ),
        ),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height * 0.30,
              leading: Container(
                decoration: BoxDecoration(
                  color: theme.primaryColor,
                  image: const DecorationImage(
                    image: AssetImage('assets/images/LOGO.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              toolbarHeight: 100,
              leadingWidth: 100,
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
                      decoration: BoxDecoration(
                        color: theme.canvasColor, //F6F5F5
                        borderRadius: const BorderRadius.only(
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
