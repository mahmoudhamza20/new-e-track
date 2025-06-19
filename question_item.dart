import 'dart:math';

import 'package:etrack/utility/app_colors.dart';
import 'package:etrack/utility/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuestionItem extends StatefulWidget {
  const QuestionItem({Key? key, required this.title, required this.description})
      : super(key: key);
  final String title, description;

  @override
  State<QuestionItem> createState() => _QuestionItemState();
}

class _QuestionItemState extends State<QuestionItem> {
  bool isCollapse = true;
  double height = 50;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isCollapse = !isCollapse;
        });
      },
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(isCollapse ? 200.r : 10.r)),
        child: AnimatedContainer(
          constraints: const BoxConstraints(minHeight: 50, maxHeight: 800),
          width: double.infinity,
          decoration: BoxDecoration(
              color: const Color(0XFFF7F7FA),
              borderRadius: BorderRadius.circular(isCollapse ? 200.r : 10.r)),
          duration: const Duration(milliseconds: 200),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                    right: 15.w, left: 15.w, top: 15.h, bottom: 15.h),
                child: Row(
                  children: [
                    SizedBox(
                      width: .7.sw,
                      child: Text(
                        widget.title,
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontFamily: AppFonts.mainfont,
                          fontWeight: FontWeight.bold,
                          fontSize: 13.sp,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Transform(
                        alignment: Alignment.center,
                        transform: isCollapse
                            ? Matrix4.rotationX(0)
                            : Matrix4.rotationX(pi),
                        child: Icon(
                          Icons.expand_more,
                          size: 15.sp,
                        ))
                  ],
                ),
              ),
              if (!isCollapse)
                Container(
                    padding: EdgeInsets.all(10.sm),
                    child: Text(
                      widget.description,
                      style: TextStyle(
                          fontFamily: AppFonts.mainfont,
                          height: 1.5,
                          fontSize: 11.sp,
                          color: AppColors.mainColor),
                    ))
            ],
          ),
        ),
      ),
    );
  }
}
