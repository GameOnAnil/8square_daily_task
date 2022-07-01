import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intern_task_week2/models/country_model.dart';

class CountryCodeTile extends StatelessWidget {
  final String selectedCountryCode;
  final Country country;
  final Function(Country country) onTap;
  const CountryCodeTile({
    Key? key,
    required this.country,
    required this.onTap,
    required this.selectedCountryCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(country),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(),
        child: Column(
          children: [
            Divider(color: Colors.black.withOpacity(.5)),
            Row(
              children: [
                const SizedBox(width: 20),
                ClipOval(
                  child: Image.asset(
                    country.url,
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 20),
                Text(
                  country.countryCode,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                const Expanded(child: SizedBox()),
                (selectedCountryCode == country.countryCode)
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
