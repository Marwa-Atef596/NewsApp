import 'package:flutter/material.dart';

import '../model/article_model.dart';
import 'newsTile.dart';

class NewsListview extends StatelessWidget {
  final List<ArticleModel> articles;
  const NewsListview({super.key,required this.articles});

  @override
  Widget build(BuildContext context) {
    return SliverList(
//اسكرول الصفحه كلها وخى فيها ليست فيو
        delegate: SliverChildBuilderDelegate(childCount: articles.length,
            (context, index) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 22),
        child: NewTile(
          articleModel: articles[index],
        ),
      );
    }));
    //  ListView.builder(
    //     physics: const BouncingScrollPhysics(), //يلغى الازرق االى ف الاسكرول
    //     itemCount: 10,
    //     itemBuilder: (context, i) {
    //       return const Padding(
    //         padding: EdgeInsets.only(bottom: 22),
    //         child: NewTile(),
    //       );
    //     });
  }
}
