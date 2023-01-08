import 'package:flutter/material.dart';
import '../models/models.dart';

class RecipeThumbnail extends StatelessWidget {
  //1
  final SimpleRecipe recipe;

  const RecipeThumbnail({
    super.key,
    required this.recipe,
});
  @override
  Widget build(BuildContext context) {
    //2
    return Container(
      padding: const EdgeInsets.all(8),
      //3
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //4
          Expanded(
            //5
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  recipe.dishImage,
                  fit: BoxFit.cover,
                ),
              ),
          ),
          //6
          const SizedBox(height: 10),
          //7
          Text(
            recipe.title,
            maxLines: 1,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            recipe.duration,
            style: Theme.of(context).textTheme.bodyText1,
          )
        ],
      ),
    );
  }
}