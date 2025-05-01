import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prokoders_login_task/core/util/styles.dart';
import 'package:prokoders_login_task/features/authentication/view/widgets/custom_text_button.dart';

class ToggleRow extends StatelessWidget {
  const ToggleRow({
    super.key,
     required this.text, required this.buttonText, required this.onTap,
  });
  final String text;
  final String buttonText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: AppStyles.allertaStencilNormal15(context),
        ),
        SizedBox(width: 4.w),
        CustomTextButton(
          onPressed: onTap,
          text: Text(
            buttonText,
            style: AppStyles.allertaStencilSemiBold15(context),
          ),
        ),
      ],
    );
  }
}
