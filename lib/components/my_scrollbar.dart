import 'package:flutter/cupertino.dart';

class MyScrollbar extends StatelessWidget {
  const MyScrollbar({
    super.key,
    required this.child,
    this.controller,
    this.scrollbarOrientation,
    this.padding,
    this.crossAxisMargin = 0,
    this.interactive = false,
  });

  final Widget child;
  final ScrollController? controller;
  final ScrollbarOrientation? scrollbarOrientation;
  final EdgeInsets? padding;
  final double crossAxisMargin;
  final bool interactive;

  @override
  Widget build(BuildContext context) {
    print('MyScrollbar BUILT');

    final top = kMinInteractiveDimensionCupertino + MediaQuery.paddingOf(context).top + 52;
    final bottom = MediaQuery.paddingOf(context).bottom;

    final customPadding = EdgeInsets.only(
      top: top,
      bottom: bottom,
    );

    return RawScrollbar(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(500))),
      thumbColor: CupertinoColors.systemGrey3,
      padding: padding ?? customPadding,
      interactive: interactive,
      thumbVisibility: false,
      controller: controller,
      scrollbarOrientation: scrollbarOrientation,
      crossAxisMargin: crossAxisMargin,
      child: child,
    );
  }
}
