import 'package:flutter/material.dart';
import 'package:quizator/config/router/routes/main_shell.dart';
import 'package:quizator/config/theme/my_colors.dart';
import 'package:quizator/config/theme/text_styles.dart';

import '../../../../components/my_network_image.dart';

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.category,
  });

  final String imageUrl;
  final String name;
  final int category;

  @override
  Widget build(BuildContext context) {
    print('LocationListItem BUILT');

    return GestureDetector(
      onTap: () {
        SingleQuizRoute(category: category).go(context);
      },
      child: AspectRatio(
        aspectRatio: 9 / 16,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              _buildParallaxBackground(context),
              _buildGradient(),
              _buildTitle(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildParallaxBackground(BuildContext context) {
    final GlobalKey backgroundImageKey = GlobalKey();

    return Flow(
      delegate: ParallaxFlowDelegate(
        scrollable: Scrollable.of(context),
        listItemContext: context,
        backgroundImageKey: backgroundImageKey,
      ),
      children: [
        SizedBox(
          key: backgroundImageKey,
          height: 400,
          child: MyNetworkImage(
            fit: BoxFit.fitHeight,
            imageUrl: imageUrl,
          ),
        ),
      ],
    );
  }

  Widget _buildGradient() {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.transparent, Colors.black.withOpacity(1)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.6, 0.95],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Positioned.fill(
      left: 10,
      bottom: 20,
      child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            name,
            style: s20W600.copyWith(color: context.myColors.scaffoldBackgroundColor),
          )),
    );
  }
}

class ParallaxFlowDelegate extends FlowDelegate {
  ParallaxFlowDelegate({
    required this.scrollable,
    required this.listItemContext,
    required this.backgroundImageKey,
  }) : super(repaint: scrollable.position);

  final ScrollableState scrollable;
  final BuildContext listItemContext;
  final GlobalKey backgroundImageKey;

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return BoxConstraints.tightFor(
      height: constraints.maxHeight,
    );
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    // Calculate the position of this list item within the viewport.
    final scrollableBox = scrollable.context.findRenderObject()! as RenderBox;
    final listItemBox = listItemContext.findRenderObject()! as RenderBox;

    final listItemOffset = listItemBox.localToGlobal(
      listItemBox.size.topCenter(Offset.zero),
      ancestor: scrollableBox,
    );

    // Determine the percent position of this list item within the
    // scrollable area.

    final viewportDimension = scrollable.position.viewportDimension;

    final scrollFraction = (listItemOffset.dx / viewportDimension).clamp(0.0, 1.0);

    // Calculate the vertical alignment of the background
    // based on the scroll percent.
    final horizontalAlignment = Alignment(scrollFraction * 2 - 1, 0);

    // Convert the background alignment into a pixel offset for
    // painting purposes.
    final backgroundSize =
        (backgroundImageKey.currentContext!.findRenderObject()! as RenderBox).size;
    final listItemSize = context.size;

    final childRect = horizontalAlignment.inscribe(backgroundSize, Offset.zero & listItemSize);

    // Paint the background.

    context.paintChild(
      0,
      transform: Transform.translate(offset: Offset(childRect.left, 0)).transform,
    );
  }

  @override
  bool shouldRepaint(ParallaxFlowDelegate oldDelegate) {
    return scrollable != oldDelegate.scrollable ||
        listItemContext != oldDelegate.listItemContext ||
        backgroundImageKey != oldDelegate.backgroundImageKey;
  }
}
