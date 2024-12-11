import 'package:flutter/material.dart';
import 'package:news_app/widget/category_card.dart';

import '../model/card_model.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});
  final List<CardModel> cardmodel = const [
    CardModel(image: 'assets/business.avif', name: 'Business'),
    CardModel(image: 'assets/entertaiment.avif', name: 'Entertainment'),
    CardModel(image: 'assets/general.avif', name: 'general'),
    CardModel(image: 'assets/health.avif', name: 'Health'),
    CardModel(image: 'assets/science.avif', name: 'Science'),
    CardModel(image: 'assets/sports.avif', name: 'Sports'),
    CardModel(image: 'assets/technology.jpeg', name: 'Technology'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: cardmodel.length,
          itemBuilder: (context, i) {
            return CategortyCard(card: cardmodel[i]);
          }),
    );
  }
}
