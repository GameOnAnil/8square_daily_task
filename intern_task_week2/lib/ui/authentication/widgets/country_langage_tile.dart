import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intern_task_week2/models/language_model.dart';
import 'package:intern_task_week2/providers/locale_notifier.dart';

class CountryLanguageTile extends ConsumerWidget {
  final String selectedLanguage;
  final LanguageModel languageModel;
  final Function(String language) onTap;
  const CountryLanguageTile({
    Key? key,
    required this.selectedLanguage,
    required this.languageModel,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        onTap(languageModel.language);
        ref.read(localeProvider).setLocale(Locale(languageModel.locale));
      },
      child: Container(
        decoration: const BoxDecoration(),
        child: Column(
          children: [
            Divider(color: Colors.black.withOpacity(.5)),
            Row(
              children: [
                const SizedBox(width: 20),
                ClipOval(
                  child: Image.asset(
                    languageModel.url,
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 20),
                Text(
                  languageModel.language,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                const Expanded(child: SizedBox()),
                (selectedLanguage == languageModel.language)
                    ? const Icon(Icons.check)
                    : const SizedBox(),
                SizedBox(width: 20.w),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
