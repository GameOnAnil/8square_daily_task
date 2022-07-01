import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextRow extends StatelessWidget {
  final String title;
  final String value;
  const CustomTextRow({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.lobster(
              color: const Color.fromARGB(255, 92, 27, 158),
              fontWeight: FontWeight.w400,
              fontSize: 24.sp,
              decoration: TextDecoration.underline),
          textAlign: TextAlign.center,
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Text(
            value,
            style: GoogleFonts.lobster(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 24.sp,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
