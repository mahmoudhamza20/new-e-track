import 'package:etrack/utility/app_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterItemOption extends StatelessWidget {
  const FilterItemOption(
      {Key? key,
      required this.isSelected,
      required this.onSelect,
      required this.title,
      this.selectedBackgroundColor})
      : super(key: key);

  final bool isSelected;
  final String title;
  final void Function()? onSelect;
  final Color? selectedBackgroundColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Container(
        margin: EdgeInsets.only(
            left: isArabic ? 5.w : 0, right: isArabic ? 0.w : 5.w, top: 10.h),
        decoration: BoxDecoration(
            color: isSelected
                ? selectedBackgroundColor ?? const Color(0xff0080B7)
                : const Color(0xffF7F7FA),
            borderRadius: BorderRadius.circular(200.r)),
        padding:
            EdgeInsets.only(top: 10.h, bottom: 7.h, right: 20.w, left: 20.w),
        child: Center(
            child: Text(
          title,
          style: TextStyle(
              color: isSelected ? Colors.white : const Color(0xff8A8AA5),
              fontSize: 13.sp,
              fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
