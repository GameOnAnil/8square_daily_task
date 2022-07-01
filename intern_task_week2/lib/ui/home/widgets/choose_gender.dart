import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intern_task_week2/ui/authentication/widgets/title_text.dart';
import 'package:intern_task_week2/utils/my_colors.dart';

class ChooseGender extends StatelessWidget {
  final Function() changeGender;
  final bool isMale;
  const ChooseGender({
    Key? key,
    required this.changeGender,
    required this.isMale,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0.r),
          child: TitleText(title: "Choose Gender", fontSize: 18.sp),
        ),
        Row(
          children: [
            Expanded(child: _maleButton()),
            SizedBox(width: 10.w),
            Expanded(child: _femaleButton()),
          ],
        )
      ],
    );
  }

  GestureDetector _maleButton() {
    return GestureDetector(
      onTap: () {
        changeGender();
      },
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
          border: Border.all(color: isMale ? mainBlue : Colors.black, width: 2),
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Center(
          child: Text(
            "Male",
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: isMale ? mainBlue : Colors.black),
          ),
        ),
      ),
    );
  }

  GestureDetector _femaleButton() {
    return GestureDetector(
      onTap: () {
        changeGender();
      },
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
          border:
              Border.all(color: !isMale ? mainBlue : Colors.black, width: 2.w),
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Center(
          child: Text(
            "Female",
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: !isMale ? mainBlue : Colors.black),
          ),
        ),
      ),
    );
  }
}
