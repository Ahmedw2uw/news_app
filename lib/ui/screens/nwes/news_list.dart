import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/data/model/api_maneger.dart';
import 'package:news/data/model/artecles.dart';
import 'package:news/data/model/sources.dart';
import 'package:news/ui/utilites/extentions/bild_context_extention.dart';
import 'package:news/ui/widgets/loading_widget.dart';

class NewsList extends StatelessWidget {
  final Source source;
  //! cannot create object wethout instance  // final ApiManeger apiManeger =  ApiManeger();
   const NewsList({super.key, required this.source});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManeger.instance.loadArtecles(source.id ?? ""),//! <= hear the sengelton ideia
      builder: (context, snapShot) {
        if (snapShot.hasError) {
          return ErrorWidget(snapShot.error.toString());
        } else if (snapShot.hasData && snapShot.data!.isNotEmpty) {
          var artecles = snapShot.data!;
          return buildArteclesList(artecles);
        } else {
          return LoadingWidget();
        }
      },
    );
  }

  Widget buildArteclesList(List<Article> artecles) {
    return ListView.builder(
      itemCount: artecles.length,

      itemBuilder: (context, index) {
        return buildArtecleItems(artecles[index], context);
      },
    );
  }

  Widget buildArtecleItems(Article article, BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: context.secondaryColor),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl:
                (article.urlToImage != null && article.urlToImage!.isNotEmpty)
                    ? article.urlToImage!
                    : "https://via.placeholder.com/300x200?text=No+Image",
            placeholder: (_, __) => LoadingWidget(),
            errorWidget: (_, __, ___) => Icon(Icons.broken_image, size: 40),
            height: context.height * 0.25,
            fit: BoxFit.cover,
          ),

          Text(article.title, style: context.textTheme.bodyMedium),
          Row(
            children: [
              Expanded(
                child: Text(
                  article.author ?? "",
                  style: context.textTheme.labelMedium,
                ),
              ),
              // Spacer(),
              Expanded(
                child: Text(
                  article.publishedAt,
                  style: context.textTheme.labelMedium,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
