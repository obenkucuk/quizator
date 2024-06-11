import 'package:flutter/cupertino.dart';
import 'package:quizator/features/home/presentation/widgets/category_list_item.dart';

import '../../data/models/quiz_category.dart';

class QuizCategoriesView extends StatelessWidget {
  const QuizCategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Categories'),
        previousPageTitle: 'Home',
      ),
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              sliver: SliverGrid.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 9 / 16,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  final category = QuizCategory.values[index];

                  return CategoryListItem(
                    imageUrl: category.imageUrl,
                    name: category.name,
                    category: category.number,
                  );
                },
                itemCount: QuizCategory.values.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
