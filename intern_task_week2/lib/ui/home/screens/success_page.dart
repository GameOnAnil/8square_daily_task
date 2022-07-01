import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intern_task_week2/utils/background_painter.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomPaint(
        painter: BackgroundPainter(),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 8.h),
              Text(
                'User Registered',
                style: GoogleFonts.lobster(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 32.sp,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'Successfully',
                style: GoogleFonts.lobster(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 32.sp,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
