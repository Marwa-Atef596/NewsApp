import 'package:flutter/material.dart';
import '../widget/category_card_listview.dart';
import '../widget/list_view_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "News",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              Text(
                "Cloud",
                style: TextStyle(fontSize: 20, color: Colors.orange),
              )
            ],
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: CategoryListView(),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 32,
                ),
              ),
              NewsListviewBuilder(
                category: 'general',
              )
              //rebuild only
            ],
          ),
        )
        //  const Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 16),
        //   child: Column(
        //     children: [
        //       CategoryListView(),
        //       SizedBox(
        //         height: 32,
        //       ),
        //       Expanded(child: NewsListview()),
        //     ],
        //   ),
        // ),
        );
  }
}
