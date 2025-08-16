import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:news/data/model/api_maneger.dart';
import 'package:news/data/model/sources.dart';
import 'package:news/data/repositries/data_source/local_datasource.dart';
import 'package:news/data/repositries/data_source/remot_datasource.dart';
import 'package:news/data/repositries/news_reposotry.dart';
import 'package:news/ui/model/category_dm.dart';
import 'package:news/ui/screens/nwes/news_list.dart';
import 'package:news/ui/screens/nwes/news_vew_model.dart';
import 'package:news/ui/utilites/app_colors.dart';
import 'package:news/ui/utilites/extentions/bild_context_extention.dart';
import 'package:news/ui/widgets/app_scafold.dart';
import 'package:news/ui/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

class News extends StatefulWidget {
  CategoryDm categoryDm;
  News({super.key, required this.categoryDm});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  // final ApiManeger apiManeger =  ApiManeger(); //* cannot create
  late NewsVewModel vewModel = NewsVewModel(
    NewsReposotry(LocalDatasource(),RemotDatasource(apiManeger: ApiManeger.instance),Connectivity())
  ); //* this is an object of vewModel

  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {//* yhis well exxecute before bild
  //     vewModel = Provider.of(context, listen: true);
  //     vewModel.loadSources(widget.categoryDm.id);
  //   });
  // }
  @override
  void initState() {
    super.initState();
    ApiManeger.instance.loadSources(widget.categoryDm.id);
  }

  @override
  Widget build(BuildContext context) {
    //* this old context not have the new value to the provider

    return ChangeNotifierProvider(
      //* this remove from main and but hear becuse create it in gust widget
      create: (_) => vewModel,
      child: Builder(
        builder: (context) {
          //* but this context have the new value
          vewModel = Provider.of(context, listen: true);
          if (vewModel.sources.isEmpty) {
            vewModel.loadSources(widget.categoryDm.id);
          }
          //! hear we use vew model to build boody

          return AppScafold(
            appParTitle: widget.categoryDm.text,
            //* the body is only rebild widget to not rebuild the all widget(consumer)
            body: Consumer<NewsVewModel>(
              builder: (context, _, __) {
                if (vewModel.errorMessage.isNotEmpty) {
                  return ErrorWidget(vewModel.errorMessage);
                } else if (vewModel.sources.isNotEmpty) {
                  return buildTabsList(context, vewModel.sources);
                } else {
                  return Center(child: LoadingWidget());
                }
              },
            ),
          );
        },
      ),
    );

    // return AppScafold(
    //   body: Column(
    //     children: [
    //       Expanded(
    //         child: FutureBuilder(
    //           future: ApiManeger.instance.loadSources(widget.categoryDm.id),//! <= the sengelton ideia
    //           builder: (context, snapShot) {
    //             if (snapShot.hasError) {
    //               return ErrorWidget(snapShot.error.toString());
    //             } else if (snapShot.hasData) {
    //               var source = snapShot.data!;
    //               return buildTabsList(source);
    //             } else {
    //               return Center(child: LoadingWidget());
    //             }
    //           },
    //         ),
    //       ),
    //     ],
    //   ),
    //   appParTitle: widget.categoryDm.text,
    // );
  }

  Widget buildTabsList(BuildContext context, List<Source> sources) {
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
