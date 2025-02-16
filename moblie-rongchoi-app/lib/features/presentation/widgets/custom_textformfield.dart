import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rongchoi_application/core/config/app_dimensions.dart';
import 'package:rongchoi_application/core/config/app_typography.dart';
import 'package:rongchoi_application/core/constants/corlos.dart';

Widget customTextFormField(
    {required String label,
    String? svgUrl,
    String? Function(String?)? validator,
    required TextEditingController controller}) {
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.fromLTRB(30, 3, 20, 0),
    margin: EdgeInsets.only(left: 10, right: 10),
    height: 50,
    decoration: BoxDecoration(
        color: AppColors.iceBlueBackgroupTf, borderRadius: BorderRadius.circular(10)),
    child: TextFormField(
      cursorColor: AppColors.deepTeal,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      controller: controller,
      style: AppText.b3,
      decoration: InputDecoration(
          prefixIcon: svgUrl == null
              ? null
              : Padding(
                  padding: EdgeInsets.only(
                      right: AppDimensions.normalize(10),
                      top: AppDimensions.normalize(1)),
                  child: SvgPicture.asset(
                    svgUrl,
                    colorFilter: const ColorFilter.mode(
                        AppColors.deepTeal, BlendMode.srcIn),
                  ),
                ),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          errorStyle: AppText.l1b?.copyWith(color: Colors.red),
          errorMaxLines: 3,
          hintText: label,
          labelStyle: AppText.b1?.copyWith(color: AppColors.blueHazeTextTf)),
    ),
  );
}
