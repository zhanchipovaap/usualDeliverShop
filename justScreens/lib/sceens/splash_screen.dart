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
        body: Container(
          decoration: BoxDecoration(
            color: theme.splashColor,
          ),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.036),
              Container(
                height: MediaQuery.of(context).size.height * 0.115,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/BOX.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.025),
              const Text(
                "Non-Contact\n Deliveries",
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1.2,
                  color: Color(0xff2D0C57),
                  fontFamily: 'SFproDisplayBold',
                  fontSize: 30,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.025),
              const Text(
                "When placing an order, select the option\n “Contactless delivery” and the courier will leave\n your order at the door.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff9586A8),
                  fontFamily: 'SFproRegular',
                  fontSize: 15,
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
                      decoration: const BoxDecoration(
                        color: Color(0xffF6F5F5), //F6F5F5
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
