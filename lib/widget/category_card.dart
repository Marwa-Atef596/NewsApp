import 'package:flutter/material.dart';
import 'package:news_app/model/card_model.dart';
import 'package:news_app/widget/category_view.dart';

class CategortyCard extends StatelessWidget {
  const CategortyCard({super.key, required this.card});
  final CardModel card;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryView(
              category: card.name,
              //ع حسب اسم كل كاتجورى فيهم هيجيبلى البيانات
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image:
              DecorationImage(fit: BoxFit.fill, image: AssetImage(card.image)),
        ),
        width: 170,
        height: 100,
        child: Center(
            child: Text(
          card.name,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        )),
      ),
    );
  }
}
