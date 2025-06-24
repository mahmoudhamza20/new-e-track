import 'dart:io';

import 'package:etrack/components/back_button.dart';
import 'package:etrack/utility/app_colors.dart';
import 'package:etrack/utility/app_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_player/video_player.dart';

class ImageContainer extends StatefulWidget {
  const ImageContainer({Key? key, required this.path, required this.deleteItem})
      : super(key: key);
  final String path;
  final Function deleteItem;

  @override
  State<ImageContainer> createState() => _ImageContainerState();
}

class _ImageContainerState extends State<ImageContainer> {
  late VideoPlayerController videoShowController;

  @override
  void initState() {
    videoShowController = VideoPlayerController.file(File(widget.path))
      ..initialize().then((value) {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: Colors.grey.shade100),
      height: 70.h,
      width: 100.w,
      child: Stack(
        children: [
          SizedBox(
              width: 100.w,
              height: 70.h,
              child: widget.path.endsWith('.mp4')
                  ? GestureDetector(
                      onTap: displayVideo,
                      child: VideoPlayer(videoShowController))
                  : Image.file(File(widget.path), fit: BoxFit.cover)),
          if (isArabic)
            Positioned(
              top: 5.h,
              right: 7.w,
              child: GestureDetector(
                onTap: () {
                  widget.deleteItem();
                },
                child: Container(
                  width: 18.h,
                  height: 18.h,
                  padding: EdgeInsets.all(6.sp),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.r),
                      color: AppColors.unselectedColor),
                  child: SvgPicture.asset(
                    'assets/images/cancel.svg',
                    color: AppColors.mainTitleColor,
                  ),
                ),
              ),
            ),
          if (!isArabic)
            Positioned(
              top: 5.h,
              left: 7.w,
              child: GestureDetector(
                onTap: () {
                  widget.deleteItem();
                },
                child: Container(
                  width: 18.h,
                  height: 18.h,
                  padding: EdgeInsets.all(6.sp),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.r),
                      color: AppColors.unselectedColor),
                  child: SvgPicture.asset(
                    'assets/images/cancel.svg',
                    color: AppColors.mainTitleColor,
                  ),
                ),
              ),
            ),
          if (widget.path.endsWith('.mp4'))
            Positioned(
                right: 35,
                top: 20.h,
                child: GestureDetector(
                  onTap: displayVideo,
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.r),
                          color: Colors.black54),
                      padding: const EdgeInsets.all(3),
                      child: const Icon(
                        Icons.play_circle,
                        size: 30,
                        color: Colors.white,
                      )),
                ))
        ],
      ),
    );
  }

  displayVideo() async {
    VideoPlayerController videoController =
        VideoPlayerController.file(File(widget.path))
          ..initialize().then((value) {});
    videoController.play();

    await showDialog(
        context: context,
        builder: (contex) {
          return Container(
            color: Colors.white,
            child: Stack(
              children: [
                SizedBox(
                  width: 1.sw,
                  height: 1.sh,
                  child: VideoPlayer(videoController),
                ),
                Container(
                  width: 1.sw,
                  height: 1.sh,
                  padding: EdgeInsets.only(left: .05.sw, right: .05.sw),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15.h,
                      ),
                      const BackButtonCustom(isDark: false)
                    ],
                  ),
                )
              ],
            ),
          );
        });
    videoController.removeListener(() {});
    videoController.dispose();
  }
}
