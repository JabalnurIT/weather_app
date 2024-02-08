import 'package:flutter/material.dart';
import '../../res/colours.dart';
import '../../res/fonts.dart';

class MainText extends StatelessWidget {
  const MainText(
    this.text, {
    super.key,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.softWrap,
    this.decoration,
    this.letterSpacing,
    this.height,
    this.fontFamily,
    this.decorationStyle,
    this.textBaseline,
    this.locale,
    this.background,
    this.fontFamilyFallback,
    this.shadows,
    this.textWidthBasis,
    this.wordSpacing,
    this.heightStyle,
    this.strutStyle,
    this.textDirection,
    this.localeOverride,
    this.debugLabel,
    this.fontSizeFactor,
    this.textScaleFactor,
    this.semanticsLabel,
    this.inherit,
    this.allowFontScaling,
    this.textLeadingDistribution,
  });

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool? softWrap;
  final TextDecoration? decoration;
  final double? letterSpacing;
  final double? height;
  final String? fontFamily;
  final TextDecorationStyle? decorationStyle;
  final TextBaseline? textBaseline;
  final Locale? locale;
  final Paint? background;
  final List<String>? fontFamilyFallback;
  final List<Shadow>? shadows;
  final TextWidthBasis? textWidthBasis;
  final double? wordSpacing;
  final double? heightStyle;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final Locale? localeOverride;
  final String? debugLabel;
  final double? fontSizeFactor;
  final double? textScaleFactor;
  final String? semanticsLabel;
  final bool? inherit;
  final bool? allowFontScaling;
  final TextLeadingDistribution? textLeadingDistribution;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize ?? 16,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: color ?? Colours.accentColour,
        fontFamily: fontFamily ?? Fonts.inter,
        decoration: decoration ?? TextDecoration.none,
        decorationStyle: decorationStyle ?? TextDecorationStyle.solid,
        letterSpacing: letterSpacing ?? 0,
        height: height ?? 1.2,
        textBaseline: textBaseline ?? TextBaseline.alphabetic,
        locale: locale ?? const Locale('en', 'US'),
        background: background,
        fontFamilyFallback: fontFamilyFallback ?? const <String>[],
        shadows: shadows ?? const <Shadow>[],
        wordSpacing: wordSpacing ?? 0,
        debugLabel: debugLabel ?? '',
        inherit: inherit ?? true,
        leadingDistribution:
            textLeadingDistribution ?? TextLeadingDistribution.even,
      ),
      textAlign: textAlign ?? TextAlign.start,
      overflow: overflow ?? TextOverflow.visible,
      maxLines: maxLines,
      softWrap: softWrap ?? true,
      textWidthBasis: textWidthBasis ?? TextWidthBasis.parent,
    );
  }
}
