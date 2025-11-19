import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:plantapp_case/features/home/presentation/widgets/questions_horizontal/question_card_widget.dart';
import 'package:plantapp_case/features/home/presentation/widgets/categories_grid/widgets/category_grid_item_widget.dart';
import 'package:plantapp_case/features/home/domain/entities/question_entity.dart';
import 'package:plantapp_case/features/home/domain/entities/category_entity.dart';

@widgetbook.UseCase(
  name: 'Question Card',
  type: QuestionCardWidget,
)
Widget questionCard(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(16),
    child: QuestionCardWidget(
      question: QuestionEntity(
        id: 1,
        title: 'How to identify plants?',
        subtitle: '2min read',
        imageUri: 'https://picsum.photos/240/164?random=1',
        uri: '/questions/1',
        order: 1,
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Category Grid Item',
  type: CategoryGridItemWidget,
)
Widget categoryGridItem(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(16),
    child: CategoryGridItemWidget(
      category: CategoryEntity(
        id: 1,
        name: 'houseplants',
        title: 'Houseplants',
        image: CategoryImageEntity(
          id: 1,
          name: 'houseplants.jpg',
          url: 'https://picsum.photos/142/142?random=2',
          width: 142,
          height: 142,
        ),
        rank: 1,
      ),
      onTap: () {
        debugPrint('Category tapped');
      },
    ),
  );
}