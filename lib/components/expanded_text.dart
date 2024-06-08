import 'package:flutter/cupertino.dart';

@immutable
final class ExpandedText extends StatelessWidget {
  const ExpandedText(
    this.data, {
    super.key,
    this.flex = 1,
    this.textSpan,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow = TextOverflow.ellipsis,
    this.textScaler,
    this.maxLines = 1,
    this.semanticsLabel,
    this.textWidthBasis,
    this.selectionColor,
  });

  final String data;
  final int flex;
  final InlineSpan? textSpan;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow overflow;
  final TextScaler? textScaler;
  final int maxLines;
  final String? semanticsLabel;

  /// {@macro flutter.painting.textPainter.textWidthBasis}
  final TextWidthBasis? textWidthBasis;
  final Color? selectionColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Text(
        data,
        style: style,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        textDirection: textDirection,
        locale: locale,
        softWrap: softWrap,
        strutStyle: strutStyle,
        textWidthBasis: textWidthBasis,
        semanticsLabel: semanticsLabel,
        selectionColor: selectionColor,
      ),
    );
  }
}
