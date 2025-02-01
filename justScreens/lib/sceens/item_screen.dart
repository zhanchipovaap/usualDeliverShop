import 'package:flutter/material.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({super.key});

  @override
  _ItemScreenState createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
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
                    minimumSize:
                        Size(MediaQuery.of(context).size.width - 20, 50),
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
            SliverPersistentHeader(
              delegate: MySliverAppBar(expandedHeight: 200),
              floating: true,
              pinned: false,
            ),
          ];
        },
      ),
    );
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  MySliverAppBar({required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final theme = Theme.of(context);
    final progress = shrinkOffset / maxExtent;
    return Material(
      child: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedOpacity(
            duration: const Duration(milliseconds: 150),
            opacity: 1 - progress,
            child: Image.asset(
              'assets/images/item/BostonLettuce.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            height: 20,
            child: Container(
              height: 20,
              decoration: BoxDecoration(
                color: theme.canvasColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    // return Expanded(
    //   child: Column(
    //     // fit: StackFit.expand,
    //     children: [
    //       AnimatedOpacity(
    //         duration: const Duration(milliseconds: 150),
    //         opacity: 1 - progress,
    //         child: Image(
    //           image: AssetImage('assets/images/item/BostonLettuce.png'),
    //           fit: BoxFit.cover,
    //         ),
    //       ),
    //       // Container(
    //       //   height: 150,
    //       //   child: const Image(
    //       //     image: AssetImage('assets/images/item/BostonLettuce.png'),
    //       //     fit: BoxFit.cover,
    //       //   ),
    //       // ),
    //       // Container(
    //       //   height: 20,
    //       //   decoration: BoxDecoration(
    //       //     color: theme.canvasColor,
    //       //     borderRadius: const BorderRadius.only(
    //       //       topLeft: Radius.circular(20.0),
    //       //       topRight: Radius.circular(20.0),
    //       //     ),
    //       //   ),
    //       // ),
    //     ],
    //   ),
    // );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => expandedHeight;

  @override
  // TODO: implement minExtent
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
