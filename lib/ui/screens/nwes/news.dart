import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news/data/model/api_maneger.dart';
import 'package:news/data/model/sources.dart';
import 'package:news/ui/model/category_dm.dart';
import 'package:news/ui/screens/nwes/news_list.dart';
import 'package:news/ui/utilites/app_colors.dart';
import 'package:news/ui/utilites/extentions/bild_context_extention.dart';
import 'package:news/ui/widgets/app_scafold.dart';
import 'package:news/ui/widgets/loading_widget.dart';

class News extends StatefulWidget {
  CategoryDm categoryDm;
   News({super.key,required this.categoryDm});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  final ApiManeger apiManeger =  ApiManeger();

  @override
  Widget build(BuildContext context) {
    ApiManeger().loadSources(widget.categoryDm.id);
    return AppScafold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: apiManeger.loadSources(widget.categoryDm.id),
              builder: (context, snapShot) {
                if (snapShot.hasError) {
                  return ErrorWidget(snapShot.error.toString());
                } else if (snapShot.hasData) {
                  var source = snapShot.data!;
                  return buildTabsList(source);
                } else {
                  return Center(child: LoadingWidget());
                }
              },
            ),
          ),
        ],
      ),
      appParTitle: widget.categoryDm.text,
    );
  }

  Widget buildTabsList(List<Source> sources) {
    return DefaultTabController(
      length: sources.length,
      child: Column(
        children: [
          TabBar(
            tabs: sources.map((sources) => mapSourceToTab(sources)).toList(),
            isScrollable: true,
            dividerColor: Colors.transparent,
            labelStyle: context.textTheme.bodyMedium,
            unselectedLabelStyle: context.textTheme.bodySmall,
            tabAlignment: TabAlignment.start,
            indicatorColor:
                Theme.of(context).brightness == Brightness.dark
                    ? AppColors.white
                    : AppColors.balck,
          ),
          Expanded(
            child: TabBarView(
              children:
                  sources.map((source) => NewsList(source: source)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget mapSourceToTab(Source source) {
    //* to convert the list to tabs

    return Tab(text: source.name);
  }
}
