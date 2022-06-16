import 'package:flutter/material.dart';

import '../../../utils/style/text_style.dart';
import '../../model/category_model.dart';


class Category extends StatelessWidget {
  final CategoryModel category;
  Category(this.category);

  @override
  Widget build(BuildContext context) {
    return  Text(
      category.name!,
      style: StyleText.categoryStyle,
    );
  }
}
