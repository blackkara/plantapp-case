import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:plantapp_case/design_system/widgets/text/clickable_text.dart';

@widgetbook.UseCase(
  name: 'Terms and Privacy',
  type: ClickableText,
)
Widget clickableTextTermsAndPrivacy(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: ClickableText.termsAndPrivacy(
      fullText: 'By tapping next, you are agreeing to PlantID Terms of Use & Privacy Policy.',
      onTermsTap: () {
        debugPrint('Terms of Use tapped');
      },
      onPrivacyTap: () {
        debugPrint('Privacy Policy tapped');
      },
      defaultStyle: const TextStyle(
        fontSize: 14,
        color: Colors.grey,
        fontFamily: 'Roboto',
      ),
      linkStyle: const TextStyle(
        fontSize: 14,
        color: Colors.blue,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        decoration: TextDecoration.underline,
      ),
      textAlign: TextAlign.center,
    ),
  );
}

@widgetbook.UseCase(
  name: 'Custom Clickable Text',
  type: ClickableText,
)
Widget clickableTextCustom(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: ClickableText.custom(
      text: 'Welcome to PlantID! Please read our documentation and contact support for help.',
      clickableTexts: ['documentation', 'contact support'],
      onTaps: [
        () => debugPrint('Documentation tapped'),
        () => debugPrint('Contact support tapped'),
      ],
      clickableStyles: [
        const TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
        ),
        const TextStyle(
          color: Colors.orange,
          fontWeight: FontWeight.w600,
          decoration: TextDecoration.underline,
        ),
      ],
      defaultStyle: const TextStyle(
        fontSize: 16,
        color: Colors.black87,
        fontFamily: 'Roboto',
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Multi Clickable Text',
  type: ClickableText,
)
Widget clickableTextMulti(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: ClickableText(
      text: 'By using this app, you agree to our Terms, Privacy Policy, and Cookie Policy. For questions, visit our FAQ or contact us.',
      defaultStyle: const TextStyle(
        fontSize: 14,
        color: Color(0xFF616161),
        fontFamily: 'Roboto',
        height: 1.4,
      ),
      clickableSpans: [
        ClickableTextSpan(
          text: 'Terms',
          style: const TextStyle(
            fontSize: 14,
            color: Colors.blue,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.underline,
          ),
          onTap: () => debugPrint('Terms tapped'),
        ),
        ClickableTextSpan(
          text: 'Privacy Policy',
          style: const TextStyle(
            fontSize: 14,
            color: Colors.blue,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.underline,
          ),
          onTap: () => debugPrint('Privacy Policy tapped'),
        ),
        ClickableTextSpan(
          text: 'Cookie Policy',
          style: const TextStyle(
            fontSize: 14,
            color: Colors.blue,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.underline,
          ),
          onTap: () => debugPrint('Cookie Policy tapped'),
        ),
        ClickableTextSpan(
          text: 'FAQ',
          style: const TextStyle(
            fontSize: 14,
            color: Colors.green,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),
          onTap: () => debugPrint('FAQ tapped'),
        ),
        ClickableTextSpan(
          text: 'contact us',
          style: const TextStyle(
            fontSize: 14,
            color: Colors.orange,
            fontWeight: FontWeight.w600,
            decoration: TextDecoration.underline,
          ),
          onTap: () => debugPrint('Contact us tapped'),
        ),
      ],
      textAlign: TextAlign.left,
    ),
  );
}

@widgetbook.UseCase(
  name: 'Localized Terms and Privacy',
  type: ClickableText,
)
Widget clickableTextLocalizedTermsPrivacy(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: ClickableText.localizedTermsAndPrivacy(
      onTermsTap: () => debugPrint('Localized Terms of Use tapped'),
      onPrivacyTap: () => debugPrint('Localized Privacy Policy tapped'),
      defaultStyle: const TextStyle(
        fontSize: 14,
        color: Colors.grey,
        fontFamily: 'Roboto',
      ),
      linkStyle: const TextStyle(
        fontSize: 14,
        color: Colors.blue,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        decoration: TextDecoration.underline,
      ),
      textAlign: TextAlign.center,
    ),
  );
}

@widgetbook.UseCase(
  name: 'Localized Support',
  type: ClickableText,
)
Widget clickableTextLocalizedSupport(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: ClickableText.localizedSupport(
      onDocumentationTap: () => debugPrint('Localized Documentation tapped'),
      onContactSupportTap: () => debugPrint('Localized Contact Support tapped'),
      defaultStyle: const TextStyle(
        fontSize: 16,
        color: Colors.black87,
        fontFamily: 'Roboto',
      ),
      linkStyle: const TextStyle(
        fontSize: 16,
        color: Colors.green,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.underline,
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Localized Legal',
  type: ClickableText,
)
Widget clickableTextLocalizedLegal(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: ClickableText.localizedLegal(
      onTermsTap: () => debugPrint('Localized Terms tapped'),
      onPrivacyPolicyTap: () => debugPrint('Localized Privacy Policy tapped'),
      onCookiePolicyTap: () => debugPrint('Localized Cookie Policy tapped'),
      onFaqTap: () => debugPrint('Localized FAQ tapped'),
      onContactUsTap: () => debugPrint('Localized Contact Us tapped'),
      defaultStyle: const TextStyle(
        fontSize: 14,
        color: Color(0xFF616161),
        fontFamily: 'Roboto',
        height: 1.4,
      ),
      linkStyle: const TextStyle(
        fontSize: 14,
        color: Colors.blue,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        decoration: TextDecoration.underline,
      ),
      textAlign: TextAlign.left,
    ),
  );
}

@widgetbook.UseCase(
  name: 'Brush Effect Text',
  type: ClickableText,
)
Widget clickableTextBrushEffect(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: ClickableText.withBrushEffect(
      text: 'Discover amazing plants with our AI-powered identification!',
      brushTexts: ['amazing plants', 'AI-powered'],
      brushImagePath: 'assets/images/brush_stroke.png',
      onTaps: [
        () => debugPrint('Amazing plants tapped'),
        () => debugPrint('AI-powered tapped'),
      ],
      defaultStyle: const TextStyle(
        fontSize: 16,
        color: Colors.black87,
        fontFamily: 'Roboto',
        height: 1.4,
      ),
      brushStyles: [
        const TextStyle(
          fontSize: 16,
          color: Colors.green,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.bold,
        ),
        const TextStyle(
          fontSize: 16,
          color: Colors.purple,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w600,
        ),
      ],
      textAlign: TextAlign.center,
    ),
  );
}

@widgetbook.UseCase(
  name: 'Brush Effect EN',
  type: ClickableText,
)
Widget clickableTextBrushEN(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: ClickableText.withBrushEffect(
      text: 'By tapping next, you are agreeing to PlantID Terms of Use & Privacy Policy.',
      brushTexts: ['Terms of Use', 'Privacy Policy'],
      brushImagePath: 'assets/images/brush_stroke.png',
      onTaps: [
        () => debugPrint('Terms of Use tapped'),
        () => debugPrint('Privacy Policy tapped'),
      ],
      defaultStyle: const TextStyle(
        fontSize: 14,
        color: Colors.grey,
        fontFamily: 'Roboto',
      ),
      brushStyles: [
        const TextStyle(
          fontSize: 14,
          color: Colors.green,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.bold,
        ),
        const TextStyle(
          fontSize: 14,
          color: Colors.blue,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w600,
        ),
      ],
      textAlign: TextAlign.center,
    ),
  );
}

@widgetbook.UseCase(
  name: 'Brush Effect TR',
  type: ClickableText,
)
Widget clickableTextBrushTR(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: ClickableText.withBrushEffect(
      text: 'İleri\'ye dokunarak PlantID Kullanım Koşulları ve Gizlilik Politikası\'nı kabul etmiş olursunuz.',
      brushTexts: ['Kullanım Koşulları', 'Gizlilik Politikası'],
      brushImagePath: 'assets/images/brush_stroke.png',
      onTaps: [
        () => debugPrint('Kullanım Koşulları tapped'),
        () => debugPrint('Gizlilik Politikası tapped'),
      ],
      defaultStyle: const TextStyle(
        fontSize: 14,
        color: Colors.grey,
        fontFamily: 'Roboto',
      ),
      brushStyles: [
        const TextStyle(
          fontSize: 14,
          color: Colors.green,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.bold,
        ),
        const TextStyle(
          fontSize: 14,
          color: Colors.blue,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w600,
        ),
      ],
      textAlign: TextAlign.center,
    ),
  );
}

@widgetbook.UseCase(
  name: 'Brush Effect AR',
  type: ClickableText,
)
Widget clickableTextBrushAR(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: ClickableText.withBrushEffect(
      text: 'بالنقر على التالي، فإنك توافق على شروط الاستخدام وسياسة الخصوصية الخاصة بـ PlantID.',
      brushTexts: ['شروط الاستخدام', 'سياسة الخصوصية'],
      brushImagePath: 'assets/images/brush_stroke.png',
      onTaps: [
        () => debugPrint('شروط الاستخدام tapped'),
        () => debugPrint('سياسة الخصوصية tapped'),
      ],
      defaultStyle: const TextStyle(
        fontSize: 14,
        color: Colors.grey,
        fontFamily: 'Roboto',
      ),
      brushStyles: [
        const TextStyle(
          fontSize: 14,
          color: Colors.green,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.bold,
        ),
        const TextStyle(
          fontSize: 14,
          color: Colors.blue,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w600,
        ),
      ],
      textAlign: TextAlign.center,
    ),
  );
}

@widgetbook.UseCase(
  name: 'Support EN',
  type: ClickableText,
)
Widget clickableTextSupportEN(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: ClickableText.withBrushEffect(
      text: 'Welcome to PlantID! Please read our documentation and contact support for help.',
      brushTexts: ['documentation', 'contact support'],
      brushImagePath: 'assets/images/brush_stroke.png',
      onTaps: [
        () => debugPrint('Documentation tapped'),
        () => debugPrint('Contact support tapped'),
      ],
      defaultStyle: const TextStyle(
        fontSize: 16,
        color: Colors.black87,
        fontFamily: 'Roboto',
      ),
      brushStyles: [
        const TextStyle(
          fontSize: 16,
          color: Colors.purple,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.bold,
        ),
        const TextStyle(
          fontSize: 16,
          color: Colors.orange,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w600,
        ),
      ],
      textAlign: TextAlign.left,
    ),
  );
}

@widgetbook.UseCase(
  name: 'Support TR',
  type: ClickableText,
)
Widget clickableTextSupportTR(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: ClickableText.withBrushEffect(
      text: 'PlantID\'ye hoş geldiniz! Lütfen dokümantasyonumuzu okuyun ve yardım için destek ekibimizle iletişime geçin.',
      brushTexts: ['dokümantasyonumuzu', 'destek ekibimizle iletişime geçin'],
      brushImagePath: 'assets/images/brush_stroke.png',
      onTaps: [
        () => debugPrint('dokümantasyonumuzu tapped'),
        () => debugPrint('destek ekibimizle iletişime geçin tapped'),
      ],
      defaultStyle: const TextStyle(
        fontSize: 16,
        color: Colors.black87,
        fontFamily: 'Roboto',
      ),
      brushStyles: [
        const TextStyle(
          fontSize: 16,
          color: Colors.purple,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.bold,
        ),
        const TextStyle(
          fontSize: 16,
          color: Colors.orange,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w600,
        ),
      ],
      textAlign: TextAlign.left,
    ),
  );
}

@widgetbook.UseCase(
  name: 'Support AR',
  type: ClickableText,
)
Widget clickableTextSupportAR(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: ClickableText.withBrushEffect(
      text: 'مرحباً بكم في PlantID! يرجى قراءة الوثائق والاتصال بالدعم للمساعدة.',
      brushTexts: ['الوثائق', 'الاتصال بالدعم'],
      brushImagePath: 'assets/images/brush_stroke.png',
      onTaps: [
        () => debugPrint('الوثائق tapped'),
        () => debugPrint('الاتصال بالدعم tapped'),
      ],
      defaultStyle: const TextStyle(
        fontSize: 16,
        color: Colors.black87,
        fontFamily: 'Roboto',
      ),
      brushStyles: [
        const TextStyle(
          fontSize: 16,
          color: Colors.purple,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.bold,
        ),
        const TextStyle(
          fontSize: 16,
          color: Colors.orange,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w600,
        ),
      ],
      textAlign: TextAlign.right,
    ),
  );
}