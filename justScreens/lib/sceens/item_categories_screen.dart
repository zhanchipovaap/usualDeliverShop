import 'package:flutter/material.dart';
import 'package:testproject/sceens/categories_screen.dart';

class ItemCategoryScreen extends StatefulWidget {
  const ItemCategoryScreen({super.key});

  @override
  State<ItemCategoryScreen> createState() => __ItemCategoryScreenState();
}

class __ItemCategoryScreenState extends State<ItemCategoryScreen> {
  String title = "Vegetables";
  List<String> filters = [
    "Сabbage and lettuce (14)",
    "Сucumbers and tomatoes (10)",
  ];
  List<String> filters2 = [
    "Oinons and garlic (8)",
    "Peppers (7)",
    "Potatoes and carrots (4)",
  ];
  List<CategoryItems> items = [
    CategoryItems("1.10", "Boston Lettuce", "piece",
        "assets/images/category_items/Lettuce.png"),
    CategoryItems("1.85", "Purple Cauliflower", "kg",
        "assets/images/category_items/cauliflower.png"),
    CategoryItems("1.45", "Savoy Cabbage", "kg",
        "assets/images/category_items/cabbage.png"),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SearchWidget(title: title),
            ];
          },
          // body: Container(),
          body: CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter( 
                child: Container(
                  decoration: BoxDecoration(
                    color: theme.canvasColor,
                  ),
                  padding: EdgeInsets.only(top: 40).copyWith(bottom: 20),
                  child: SizedBox(
                    height: 30,
                    child: ListView.builder(
                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.025),
                      itemCount: filters.length,
                      itemBuilder: (context, index) =>
                          FilterContainer(text: filters[index]),
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.only(bottom: 30),
                  decoration: BoxDecoration(
                    color: theme.canvasColor,
                  ),
                  child: SizedBox(
                    height: 30,
                    child: ListView.builder(
                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.025),
                      itemCount: filters2.length,
                      itemBuilder: (context, index) =>
                          FilterContainer(text: filters2[index]),
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
              ),
              SliverList.builder(
                itemCount: items.length,
                itemBuilder: (context, index) => Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.18,
                  decoration: BoxDecoration(
                    color: theme.canvasColor,                    
                  ),
                  child: ItemCategoryTile(
                    title: items[index].name,
                    cost: items[index].price,
                    picture: items[index].picture,
                    type: items[index].type,
                  ),
                ),
              ),
            ],
          )),
          bottomNavigationBar: const bottomMenu(),
    );
  }
}

class FilterContainer extends StatelessWidget {
  const FilterContainer({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 4),
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        
      ),
      child: Text(text, style: TextStyle(fontSize: 12),),
    );
  }
}

class ItemCategoryTile extends StatelessWidget {
  final String title;
  final String cost;
  final String picture;
  final String type;

  const ItemCategoryTile({
    super.key,
    required this.title,
    required this.cost,
    required this.picture,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var wei = MediaQuery.of(context).size.width; //390
    var hei = MediaQuery.of(context).size.height; //844
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(children: [
        Image.asset(
          picture,
          width: MediaQuery.of(context).size.width * 0.41,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05),
              child: Text(title, style: theme.textTheme.titleMedium),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05),
              child: Row(
                children: [
                  Text(
                    "$cost ",
                    style: theme.textTheme.titleSmall,
                  ),
                  Icon(
                    Icons.euro,
                    size: 14,
                    color: theme.indicatorColor,
                  ),
                  Text(" / $type"),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        minimumSize: const Size(78, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(10),
                        side: BorderSide(color: theme.dividerColor)),
                    child: Icon(Icons.favorite_border_outlined,
                        color: theme.indicatorColor)),
                SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      minimumSize: const Size(78, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: const Color(0xff0BCE83),
                      padding: const EdgeInsets.all(10),
                    ),
                    child: const Icon(Icons.shopping_cart_outlined,
                        color: Colors.white)),
              ],
            )
          ],
        )
      ]),
    );
  }
}

class CategoryItems {
  final String price;
  final String name;
  final String type;
  final String picture;

  CategoryItems(this.price, this.name, this.type, this.picture);
}
