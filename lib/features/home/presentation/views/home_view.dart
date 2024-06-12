import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizator/config/router/routes/main_shell.dart';
import 'package:quizator/features/home/data/models/quiz_category.dart';
import '../../../../components/my_scrollbar.dart';
import '../../../../components/sliver_sized_box.dart';
import '../widgets/category_list_item.dart';
import '../widgets/home_view_title.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: MyScrollbar(
        padding: EdgeInsets.zero,
        child: CustomScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          slivers: [
            CupertinoSliverNavigationBar(
              border: Border.all(color: Colors.transparent, width: 0),
              backgroundColor: Colors.white.withOpacity(0.8),
              transitionBetweenRoutes: false,
              padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
              automaticallyImplyLeading: false,
              alwaysShowMiddle: false,
              largeTitle: const Text('Quizator'),
              middle: const Text('Quizator'),
              leading: GoRouter.of(context).canPop()
                  ? GestureDetector(
                      onTap: () async => GoRouter.of(context).pop(context),
                      child: const Icon(CupertinoIcons.back),
                    )
                  : null,
            ),
            const SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              sliver: SliverSizedBox(height: 40, child: CupertinoSearchTextField()),
            ),
            HomeViewTitle(
              title: 'Categories',
              onPressed: () => const QuizCategoriesRoute().go(context),
            ),
            SliverSizedBox(
              height: 400,
              child: MyScrollbar(
                scrollbarOrientation: ScrollbarOrientation.bottom,
                padding: EdgeInsets.zero,
                crossAxisMargin: -10,
                mainAxisMargin: 20,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  cacheExtent: 2000,
                  itemBuilder: (context, index) {
                    final category = QuizCategory.values[index];

                    return CategoryListItem(
                      imageUrl: category.imageUrl,
                      name: category.name,
                      category: category.number,
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(width: 10),
                  itemCount: QuizCategory.values.length,
                ),
              ),
            ),
            const SliverSizedBox(height: kBottomNavigationBarHeight),
          ],
        ),
      ),
    );
  }
}
