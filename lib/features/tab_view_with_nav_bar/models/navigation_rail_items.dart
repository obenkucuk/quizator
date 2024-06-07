import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum NavigationRailItems {
  about,
  education,
  ;

  String get label => switch (this) {
        about => 'Egzersizler',
        education => 'Education',
      };

  IconData get unselectedIcon =>
      switch (this) { about => Icons.home_filled, education => CupertinoIcons.settings };

  IconData get selectedIcon =>
      switch (this) { about => Icons.home_filled, education => CupertinoIcons.settings };
}
