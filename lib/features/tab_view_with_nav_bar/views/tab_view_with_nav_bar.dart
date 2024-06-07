import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../config/theme/my_colors.dart';
import '../models/navigation_rail_items.dart';
import '../widgets/animated_branch_container.dart';

class TabViewWithNavBar extends StatelessWidget {
  const TabViewWithNavBar({
    required this.navigationShell,
    required this.children,
    Key? key,
  }) : super(
          key: key ?? const ValueKey<String>('ScaffoldWithNavBar'),
        );

  final StatefulNavigationShell navigationShell;
  final List<Widget> children;

  void goBranch(int index) {
    // if (navigationShell.currentIndex == index) return;

    navigationShell.goBranch(
      index,
      initialLocation: navigationShell.currentIndex == index,
    );
  }

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;

    if (platform == TargetPlatform.iOS) {
      return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          onTap: goBranch,
          currentIndex: navigationShell.currentIndex,
          backgroundColor: MyColors.light.primaryColor.withOpacity(0.5),
          items: NavigationRailItems.values.mapIndexed((index, tab) {
            return BottomNavigationBarItem(
              icon: navigationShell.currentIndex == index
                  ? Icon(tab.selectedIcon)
                  : Icon(tab.unselectedIcon),
              label: tab.label,
            );
          }).toList(),
        ),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            builder: (context) {
              return AnimatedBranchContainer(
                currentIndex: navigationShell.currentIndex,
                children: children,
              );
            },
          );
        },
      );
    }

    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: goBranch,
          selectedIndex: navigationShell.currentIndex,
          destinations: NavigationRailItems.values.mapIndexed((index, tab) {
            return NavigationDestination(
              icon: navigationShell.currentIndex == index
                  ? Icon(tab.selectedIcon)
                  : Icon(tab.unselectedIcon),
              label: tab.label,
            );
          }).toList(),
        ),
        body: AnimatedBranchContainer(
          currentIndex: navigationShell.currentIndex,
          children: children,
        ),
      ),
    );
  }
}
