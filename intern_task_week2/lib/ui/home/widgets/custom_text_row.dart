import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intern_task_week2/utils/my_colors.dart';

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
        ConstrainedBox(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width * .45),
          child: Text(
            title,
            style: GoogleFonts.lobster(
                color: mainBlue,
                fontWeight: FontWeight.w400,
                fontSize: 24.sp,
                decoration: TextDecoration.underline),
            textAlign: TextAlign.start,
          ),
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
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
