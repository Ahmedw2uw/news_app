import 'package:flutter/material.dart';
import 'package:news/ui/model/category_dm.dart';
import 'package:news/ui/utilites/app_colors.dart';
import 'package:news/ui/utilites/app_rouets.dart';
import 'package:news/ui/utilites/extentions/bild_context_extention.dart';
import 'package:news/ui/widgets/app_scafold.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var categories = CategoryDm.getCategories(context.themeProvider.isDark);
    return AppScafold(
      appParTitle: "Home",
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Text(
              "Good Morning \n Here is Some News For You",
              style: context.textTheme.titleMedium,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return buildCategoryWidget(categories, index, context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategoryWidget(
    List<CategoryDm> categories,
    int index,
    BuildContext context,
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(context, AppRouets.news(categories[index]));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage(categories[index].imagePath),
            fit: BoxFit.fill,
          ),
        ),
        height: context.height * 0.30,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment:
                index % 2 == 0
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
            children: [
              Text(categories[index].text, style: context.textTheme.titleLarge),
              Container(
                decoration: BoxDecoration(
                  color: context.primaryColor.withAlpha(122),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment:
                      (index % 2 == 0)
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                  children: [
                    Text("Vew All", style: context.textTheme.titleLarge),
                    CircleAvatar(
                      backgroundColor:
                          context.themeProvider.isDark
                              ? AppColors.balck
                              : AppColors.white,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color:
                            context.themeProvider.isDark
                                ? AppColors.white
                                : AppColors.balck,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
