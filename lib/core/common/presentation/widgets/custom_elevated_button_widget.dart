import 'package:flutter/material.dart';
import 'package:tt_clone/core/common/presentation/widgets/custom_text.dart';
import 'package:tt_clone/core/utils/constants/app_sizes.dart';
import 'package:tt_clone/core/utils/constants/colors.dart';

class CustomElevatedButtonWidget extends StatelessWidget {
  const CustomElevatedButtonWidget({
    super.key,
    required this.buttonTitle,
    this.onPressed,
  });

  final String buttonTitle;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: AppColors.primary, width: getWidth(1)),
          ),
        ),
        onPressed: onPressed,
        child: CustomText(
          text: buttonTitle,
          fontWeight: FontWeight.w500,
          fontSize: getWidth(15),
          color: AppColors.textWhite,
        ),
      ),
    );
  }
}
