import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intern_task_week2/models/success_model.dart';
import 'package:intern_task_week2/ui/home/widgets/custom_text_row.dart';
import 'package:intern_task_week2/utils/background_painter.dart';
import 'package:intern_task_week2/utils/my_colors.dart';

class SuccessPage extends StatelessWidget {
  final Success successModel;
  const SuccessPage({
    Key? key,
    required this.successModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomPaint(
        painter: BackgroundPainter3(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildCard(),
              const SizedBox(height: 16),
              _buildGoBackButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Card _buildCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: mainBlueLight,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CustomTextRow(
                title: "Full Name:",
                value: successModel.namePerId,
              ),
              CustomTextRow(
                title: "Prefered Name:",
                value: successModel.name,
              ),
              CustomTextRow(
                title: "ID:",
                value: successModel.id,
              ),
              CustomTextRow(
                title: "Date Of Birth:",
                value: successModel.dob,
              ),
              CustomTextRow(
                title: "Gender:",
                value: successModel.gender,
              ),
              CustomTextRow(
                title: "Email:",
                value: successModel.email,
              ),
              CustomTextRow(
                title: "Phone:",
                value: successModel.phone,
              ),
              CustomTextRow(
                title: "Maden Name:",
                value: successModel.madenName,
              ),
              (successModel.promo != null)
                  ? CustomTextRow(
                      title: "Promo:",
                      value: successModel.promo!,
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _buildGoBackButton(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: MediaQuery.of(context).size.width * .7,
      child: ElevatedButton(
        onPressed: () async {
          Navigator.pop(context);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(mainBlue),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
          ),
        ),
        child: const Text("Go Back"),
      ),
    );
  }
}
