import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizator/config/router/routes/main_shell.dart';
import 'package:quizator/features/quiz/models/quiz_category.dart';
import '../../../components/my_scrollbar.dart';
import '../../../components/sliver_sized_box.dart';
import '../../../config/theme/my_colors.dart';
import '../../../config/theme/text_styles.dart';
import '../widgets/category_list_item.dart';
import '../widgets/home_view_title.dart';

class QuizView extends StatelessWidget {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    print('Egzersizler');

    // final top = kMinInteractiveDimensionCupertino + MediaQuery.paddingOf(context).top + 52;
    // final bottom = MediaQuery.paddingOf(context).bottom +kBottomNavigationBarHeight;

    return CupertinoPageScaffold(
      child: MyScrollbar(
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
              leading: Navigator.canPop(context)
                  ? GestureDetector(
                      onTap: () async => Navigator.maybePop(context),
                      child: const Icon(CupertinoIcons.back),
                    )
                  : null,
            ),

            const SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              sliver: SliverSizedBox(height: 40, child: CupertinoSearchTextField()),
            ),

            const HomeViewTitle(title: 'Challanges'),

            SliverSizedBox(
              height: 80,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemBuilder: (context, index) {
                  return FittedBox(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: context.myColors.primaryColor.withOpacity(0.5),
                        ),
                        Text('data', style: s10W700),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemCount: 200,
              ),
            ),

            // const SliverFillViewport(
            //   viewportFraction: 0.4,
            //   padEnds: false,
            //   delegate: SliverChildListDelegate.fixed([ExampleParallax()]),
            // ),

            HomeViewTitle(
              title: 'Categories',
              onPressed: () => const QuizCategoriesRoute().go(context),
            ),

            SliverSizedBox(
              height: 400,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                cacheExtent: 1000,
                itemBuilder: (context, index) {
                  final category = QuizCategory.values[index];

                  return CategoryListItem(
                    imageUrl: category.imageUrl,
                    name: category.name,
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemCount: QuizCategory.values.length,
              ),
            ),

            const SliverSizedBox(height: kBottomNavigationBarHeight),
          ],
        ),
      ),
    );
  }
}
