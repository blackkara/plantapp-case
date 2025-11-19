import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'brush_text.dart';

class ClickableTextSpan {
  final String text;
  final TextStyle? style;
  final VoidCallback? onTap;
  final String? brushImagePath;

  const ClickableTextSpan({required this.text, this.style, this.onTap, this.brushImagePath});
}

class ClickableText extends StatelessWidget {
  final String text;
  final TextStyle? defaultStyle;
  final List<ClickableTextSpan> clickableSpans;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow overflow;

  const ClickableText({
    super.key,
    required this.text,
    required this.clickableSpans,
    this.defaultStyle,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.overflow = TextOverflow.clip,
  });

  @override
  Widget build(BuildContext context) {
    // Fırça efektli span var mı kontrol et
    final hasBrushSpans = clickableSpans.any((span) => span.brushImagePath != null);

    if (hasBrushSpans) {
      return _buildBrushAwareText();
    }

    return RichText(text: _buildTextSpan(), textAlign: textAlign, maxLines: maxLines, overflow: overflow);
  }

  TextSpan _buildTextSpan() {
    final List<InlineSpan> spans = [];
    String remainingText = text;

    for (final clickableSpan in clickableSpans) {
      final int index = remainingText.indexOf(clickableSpan.text);

      if (index == -1) continue;

      // Add text before clickable span
      if (index > 0) {
        spans.add(TextSpan(text: remainingText.substring(0, index), style: defaultStyle));
      }

      // Add clickable span
      spans.add(
        TextSpan(
          text: clickableSpan.text,
          style:
              clickableSpan.style ?? defaultStyle?.copyWith(color: Colors.blue, decoration: TextDecoration.underline),
          recognizer: clickableSpan.onTap != null ? (TapGestureRecognizer()..onTap = clickableSpan.onTap) : null,
        ),
      );

      // Update remaining text
      remainingText = remainingText.substring(index + clickableSpan.text.length);
    }

    // Add remaining text
    if (remainingText.isNotEmpty) {
      spans.add(TextSpan(text: remainingText, style: defaultStyle));
    }

    return TextSpan(children: spans);
  }

  Widget _buildBrushAwareText() {
    final List<InlineSpan> spans = [];
    String remainingText = text;

    for (final clickableSpan in clickableSpans) {
      final int index = remainingText.indexOf(clickableSpan.text);

      if (index == -1) continue;

      // Add text before clickable span
      if (index > 0) {
        spans.add(TextSpan(text: remainingText.substring(0, index), style: defaultStyle));
      }

      // Add clickable span with brush effect using WidgetSpan
      if (clickableSpan.brushImagePath != null) {
        spans.add(
          WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: BrushText(
              text: clickableSpan.text,
              textStyle:
                  clickableSpan.style ??
                  defaultStyle?.copyWith(color: Colors.blue, decoration: TextDecoration.underline),
              brushImagePath: clickableSpan.brushImagePath!,
              onTap: clickableSpan.onTap,
              padding: EdgeInsets.zero, // Padding'i sıfırlayalım
            ),
          ),
        );
      } else {
        spans.add(
          TextSpan(
            text: clickableSpan.text,
            style:
                clickableSpan.style ?? defaultStyle?.copyWith(color: Colors.blue, decoration: TextDecoration.underline),
            recognizer: clickableSpan.onTap != null ? (TapGestureRecognizer()..onTap = clickableSpan.onTap) : null,
          ),
        );
      }

      // Update remaining text
      remainingText = remainingText.substring(index + clickableSpan.text.length);
    }

    // Add remaining text
    if (remainingText.isNotEmpty) {
      spans.add(TextSpan(text: remainingText, style: defaultStyle));
    }

    return RichText(
      text: TextSpan(children: spans),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  /// Creates a clickable text with Terms of Use and Privacy Policy pattern
  factory ClickableText.termsAndPrivacy({
    Key? key,
    required String fullText,
    required VoidCallback onTermsTap,
    required VoidCallback onPrivacyTap,
    TextStyle? defaultStyle,
    TextStyle? linkStyle,
    TextAlign textAlign = TextAlign.start,
    int? maxLines,
    TextOverflow overflow = TextOverflow.clip,
  }) {
    return ClickableText(
      key: key,
      text: fullText,
      defaultStyle: defaultStyle,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      clickableSpans: [
        ClickableTextSpan(text: 'Terms of Use', style: linkStyle, onTap: onTermsTap),
        ClickableTextSpan(text: 'Privacy Policy', style: linkStyle, onTap: onPrivacyTap),
      ],
    );
  }

  /// Creates a clickable text with custom clickable parts
  factory ClickableText.custom({
    Key? key,
    required String text,
    required List<String> clickableTexts,
    required List<VoidCallback?> onTaps,
    List<TextStyle?>? clickableStyles,
    TextStyle? defaultStyle,
    TextAlign textAlign = TextAlign.start,
    int? maxLines,
    TextOverflow overflow = TextOverflow.clip,
  }) {
    assert(clickableTexts.length == onTaps.length, 'clickableTexts and onTaps must have the same length');
    assert(
      clickableStyles == null || clickableStyles.length == clickableTexts.length,
      'clickableStyles must have the same length as clickableTexts',
    );

    final spans = <ClickableTextSpan>[];
    for (int i = 0; i < clickableTexts.length; i++) {
      spans.add(ClickableTextSpan(text: clickableTexts[i], style: clickableStyles?[i], onTap: onTaps[i]));
    }

    return ClickableText(
      key: key,
      text: text,
      defaultStyle: defaultStyle,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      clickableSpans: spans,
    );
  }

  /// Creates a localized clickable text with Terms of Use and Privacy Policy pattern
  factory ClickableText.localizedTermsAndPrivacy({
    Key? key,
    required VoidCallback onTermsTap,
    required VoidCallback onPrivacyTap,
    TextStyle? defaultStyle,
    TextStyle? linkStyle,
    TextAlign textAlign = TextAlign.start,
    int? maxLines,
    TextOverflow overflow = TextOverflow.clip,
  }) {
    final fullText = 'clickable_text.terms_privacy.full_text'.tr();
    final termsText = 'clickable_text.terms_privacy.terms_of_use'.tr();
    final privacyText = 'clickable_text.terms_privacy.privacy_policy'.tr();

    return ClickableText(
      key: key,
      text: fullText,
      defaultStyle: defaultStyle,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      clickableSpans: [
        ClickableTextSpan(text: termsText, style: linkStyle, onTap: onTermsTap),
        ClickableTextSpan(text: privacyText, style: linkStyle, onTap: onPrivacyTap),
      ],
    );
  }

  /// Creates a localized clickable text for support documentation and contact
  factory ClickableText.localizedSupport({
    Key? key,
    required VoidCallback onDocumentationTap,
    required VoidCallback onContactSupportTap,
    TextStyle? defaultStyle,
    TextStyle? linkStyle,
    TextAlign textAlign = TextAlign.start,
    int? maxLines,
    TextOverflow overflow = TextOverflow.clip,
  }) {
    final fullText = 'clickable_text.support.full_text'.tr();
    final documentationText = 'clickable_text.support.documentation'.tr();
    final contactSupportText = 'clickable_text.support.contact_support'.tr();

    return ClickableText(
      key: key,
      text: fullText,
      defaultStyle: defaultStyle,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      clickableSpans: [
        ClickableTextSpan(text: documentationText, style: linkStyle, onTap: onDocumentationTap),
        ClickableTextSpan(text: contactSupportText, style: linkStyle, onTap: onContactSupportTap),
      ],
    );
  }

  /// Creates a localized clickable text for legal links (Terms, Privacy, Cookies, FAQ, Contact)
  factory ClickableText.localizedLegal({
    Key? key,
    required VoidCallback onTermsTap,
    required VoidCallback onPrivacyPolicyTap,
    required VoidCallback onCookiePolicyTap,
    required VoidCallback onFaqTap,
    required VoidCallback onContactUsTap,
    TextStyle? defaultStyle,
    TextStyle? linkStyle,
    TextAlign textAlign = TextAlign.start,
    int? maxLines,
    TextOverflow overflow = TextOverflow.clip,
  }) {
    final fullText = 'clickable_text.legal.full_text'.tr();
    final termsText = 'clickable_text.legal.terms'.tr();
    final privacyText = 'clickable_text.legal.privacy_policy'.tr();
    final cookieText = 'clickable_text.legal.cookie_policy'.tr();
    final faqText = 'clickable_text.legal.faq'.tr();
    final contactUsText = 'clickable_text.legal.contact_us'.tr();

    return ClickableText(
      key: key,
      text: fullText,
      defaultStyle: defaultStyle,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      clickableSpans: [
        ClickableTextSpan(text: termsText, style: linkStyle, onTap: onTermsTap),
        ClickableTextSpan(text: privacyText, style: linkStyle, onTap: onPrivacyPolicyTap),
        ClickableTextSpan(text: cookieText, style: linkStyle, onTap: onCookiePolicyTap),
        ClickableTextSpan(text: faqText, style: linkStyle, onTap: onFaqTap),
        ClickableTextSpan(text: contactUsText, style: linkStyle, onTap: onContactUsTap),
      ],
    );
  }

  /// Creates a clickable text with brush effect for highlighted terms
  factory ClickableText.withBrushEffect({
    Key? key,
    required String text,
    required List<String> brushTexts,
    required String brushImagePath,
    required List<VoidCallback?> onTaps,
    List<TextStyle?>? brushStyles,
    TextStyle? defaultStyle,
    TextAlign textAlign = TextAlign.start,
    int? maxLines,
    TextOverflow overflow = TextOverflow.clip,
  }) {
    assert(brushTexts.length == onTaps.length, 'brushTexts and onTaps must have the same length');
    assert(
      brushStyles == null || brushStyles.length == brushTexts.length,
      'brushStyles must have the same length as brushTexts',
    );

    final spans = <ClickableTextSpan>[];
    for (int i = 0; i < brushTexts.length; i++) {
      spans.add(
        ClickableTextSpan(
          text: brushTexts[i],
          style: brushStyles?[i],
          onTap: onTaps[i],
          brushImagePath: brushImagePath,
        ),
      );
    }

    return ClickableText(
      key: key,
      text: text,
      defaultStyle: defaultStyle,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      clickableSpans: spans,
    );
  }
}
