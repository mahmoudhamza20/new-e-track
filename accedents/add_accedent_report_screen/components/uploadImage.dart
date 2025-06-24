import 'dart:convert';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:etrack/helper/file_picker_manager.dart';
import 'package:etrack/utility/app_colors.dart';
import 'package:etrack/utility/app_fonts.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class UploadImage extends StatelessWidget {
  const UploadImage(
      {Key? key, required this.afterUpload, this.isfromGallery = true})
      : super(key: key);
  final Function afterUpload;
  final bool isfromGallery;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: GestureDetector(
        onTap: () async {
          if (isfromGallery) {
            FilePickerManager.pickFile(
                toDo: (String img64, String imageName, PlatformFile file) {
              print(file.path);
              afterUpload(img64, file);
            });
          } else {
            final ImagePicker picker = ImagePicker();
            final XFile? image = await picker.pickImage(
                source: ImageSource.camera, imageQuality: 25);

            if (image != null) {
              final bytes = File(image.path.toString()).readAsBytesSync();
              String img64 = base64Encode(bytes);
              afterUpload(
                  img64,
                  PlatformFile(
                      bytes: bytes,
                      size: 1,
                      name: image.name,
                      path: image.path));
            }
          }
        },
        child: DottedBorder(
          borderType: BorderType.RRect,
          radius: Radius.circular(12.r),
          strokeWidth: 1.5,
          strokeCap: StrokeCap.butt,
          color: AppColors.skyColor.withOpacity(0.5),
          padding: EdgeInsets.zero,
          dashPattern: const [3],
          child: Container(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            decoration: BoxDecoration(
                color: AppColors.skyColor.withOpacity(.1),
                borderRadius: BorderRadius.circular(10.r)),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/upload_image.svg',
                  width: 25.w,
                  color: AppColors.skyColor,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'upload Image',
                  style: TextStyle(
                      color: AppColors.skyColor,
                      fontFamily: AppFonts.mainfont,
                      fontSize: 12.sp),
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}
