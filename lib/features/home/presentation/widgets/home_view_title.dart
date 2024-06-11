import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../components/expanded_text.dart';
import '../../../../config/theme/my_colors.dart';
import '../../../../config/theme/text_styles.dart';

class HomeViewTitle extends StatelessWidget {
  const HomeViewTitle({
    super.key,
    required this.title,
    this.onPressed,
  });

  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      sliver: SliverToBoxAdapter(
        child: Row(
          textBaseline: TextBaseline.ideographic,
          children: [
            ExpandedText(title, style: s16W600),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: CupertinoButton(
                  borderRadius: BorderRadius.zero,
                  minSize: 0,
                  padding: EdgeInsets.zero,
                  onPressed: onPressed,
                  disabledColor: Colors.transparent,
                  child: Text(
                    'All',
                    style: s14W600.copyWith(color: context.myColors.seconderyColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
