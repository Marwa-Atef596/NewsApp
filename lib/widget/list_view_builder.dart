import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/widget/news_listview.dart';
import '../services/new_service.dart';

class NewsListviewBuilder extends StatefulWidget {
  const NewsListviewBuilder({super.key, required this.category});
  final String category;

  @override
  State<NewsListviewBuilder> createState() => _NewsListviewBuilderState();
}

class _NewsListviewBuilderState extends State<NewsListviewBuilder> {
  // ignore: prefer_typing_uninitialized_variables
  var future;

  @override
  void initState() {
    super.initState();
    future = NewsService(Dio()).getNews(category:widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      //rebuild only
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewsListview(articles: snapshot.data!);
        } else if (snapshot.hasError) {
          const SliverToBoxAdapter(
            child: Text("Oops there's Error"),
          );
        }
        return const SliverToBoxAdapter(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import '../model/article_model.dart';
// import '../services/new_service.dart';
// import 'news_listview.dart';

// class NewsListviewBuilder extends StatefulWidget {
//   const NewsListviewBuilder({
//     super.key,
//   });

//   @override
//   State<NewsListviewBuilder> createState() => _NewsListviewBuilderState();
// }

// class _NewsListviewBuilderState extends State<NewsListviewBuilder> {
//   List<ArticleModel> articles = [];
//   bool isLoading = true;
//   @override
//   void initState() {
//     super.initState();
//     getGeneralNews();
//   }

//   Future<void> getGeneralNews() async {
//     articles = await NewsService(Dio()).getNews();
//     isLoading = false;
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return isLoading
//         ? const SliverToBoxAdapter(
//             child: Center(child: CircularProgressIndicator()))
//         : articles.isNotEmpty
//             ? NewsListview(articles: articles)
//             : const SliverToBoxAdapter(
//                 child: Text("Oops there's Error"),
//               );
//   }
// }
