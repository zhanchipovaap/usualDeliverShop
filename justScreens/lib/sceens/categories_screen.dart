import 'package:flutter/material.dart';

class CategoryIn {
  final String count;
  final String name;
  final String pageImage;

  CategoryIn(this.count, this.name, this.pageImage);
}

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  List<CategoryIn> categoryList = [
    CategoryIn("43", "Vegetables", "assets/images/categories/Vegetables.png"),
    CategoryIn("32", "Fruits", "assets/images/categories/Fruits.png"),
    CategoryIn("22", "Bread", "assets/images/categories/Bread.png"),
    CategoryIn("56", "Sweets", "assets/images/categories/Sweets.png"),
    CategoryIn("43", "Pasta", "assets/images/categories/Pasta.png"),
    CategoryIn("43", "Drinks", "assets/images/categories/Drinks.png"),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                    pinned: true,
                    title: Container(
                      alignment: Alignment.centerLeft,
                      child: const Icon(Icons.arrow_back_ios, size: 15),
                    ),
                    expandedHeight: 150,
                    backgroundColor: theme.canvasColor,
                    bottom: PreferredSize(
                      preferredSize: const Size.fromHeight(70),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Categories',
                              style: theme.textTheme.titleLarge,
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            padding: const EdgeInsets.all(9),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(23),
                              border: Border.all(
                                color: theme.dividerColor,
                                width: 1,
                              ),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.height *
                                              0.01),
                                  child: Image.asset('assets/images/search.png',
                                      height: 23),
                                ),
                                Text(
                                  'Search',
                                  style: theme.textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
              ];
            },
            body: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.03),
              child: Container(
                decoration: BoxDecoration(
                  color: theme.canvasColor,
                ),
                child: GridView.count(
                  crossAxisCount: 2,
                  padding: const EdgeInsets.all(16),
                  childAspectRatio: (7 / 8),
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: categoryList.map((CategoryIn value) {
                    return categoriesTile(value, theme);
                  }).toList(),
                ),
              ),
            )));
  }

  Widget categoriesTile(CategoryIn category, ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: theme.dividerColor,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(category.pageImage),
          Padding(
            padding: const EdgeInsets.all(9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    category.name,
                    style: const TextStyle(
                      color: Color(0xff2D0C57),
                      fontFamily: 'SFproDisplayBold',
                      fontSize: 16,
                    ),
                  ),
                ),
                Text(
                  "(${category.count})",
                  style: const TextStyle(
                    fontSize: 10,
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
