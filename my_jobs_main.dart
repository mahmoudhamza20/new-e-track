import 'package:etrack/components/no_result_found.dart';
import 'package:etrack/components/tab_bar_custom.dart';
import 'package:etrack/model/job/applied_jobs_model.dart';
import 'package:etrack/model/work_offer_model.dart';
import 'package:etrack/screens/my_jobs/components/applied_job_item.dart';
import 'package:etrack/screens/my_jobs/components/saved_job_item.dart';
import 'package:etrack/utility/app_colors.dart';
import 'package:etrack/utility/image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class MyJobsMain extends StatelessWidget {
  MyJobsMain({
    Key? key,
  }) : super(key: key);

  PagingController<int, WorkOfferModelData> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 1);
  PagingController<int, AppliedJobsModelData> appliedJobPagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 1);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<DrawerState>(
        valueListenable: ZoomDrawer.of(context)!.stateNotifier,
        builder: (context, state, child) {
          return AbsorbPointer(
            absorbing: state != DrawerState.closed,
            child: child,
          );
        },
        child: Stack(
          alignment: AlignmentDirectional.topStart,
          children: [
            WillPopScope(
              onWillPop: () async {
                // goToWithRemoveRoute(screenName: Data.home, context: context);
                return false;
              },
              child: Scaffold(
                appBar: AppBar(
                  leading: Container(),
                  backgroundColor: Colors.transparent,
                  toolbarHeight: 0,
                ),
                backgroundColor: AppColors.mainColor,
                body: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: .05.sw, left: .05.sw),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  ZoomDrawer.of(context)?.toggle.call();
                                },
                                child: Container(
                                  height: 30.h,
                                  width: 30.h,
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(.1),
                                      borderRadius: BorderRadius.circular(7.r)),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      AppImages.square,
                                      width: 17.sp,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Text(
                                'وظائفي',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22.sp,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: .025.sh,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Expanded(
                      child: Container(
                        width: 1.sw,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15.r),
                                topLeft: Radius.circular(15.r))),
                        child: SizedBox(
                          width: .9.sw,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 15, left: 4, right: 4),
                            child: TabBarCustom(
                              tabNames: const [
                                'الوظائف المقدم عليها',
                                'الوظائف المحفوظة'
                              ],
                              children: [
                                PagedListView<int, AppliedJobsModelData>(
                                    pagingController:
                                        appliedJobPagingController,
                                    builderDelegate: PagedChildBuilderDelegate<
                                            AppliedJobsModelData>(
                                        noItemsFoundIndicatorBuilder:
                                            (context) {
                                      return const Center(
                                          child: NoResultFound());
                                    }, itemBuilder: (context, item, index) {
                                      return AppliedJobItem(
                                        offer: item,
                                      );
                                    })),
                                PagedListView<int, WorkOfferModelData>(
                                    pagingController: pagingController,
                                    builderDelegate: PagedChildBuilderDelegate<
                                            WorkOfferModelData>(
                                        noItemsFoundIndicatorBuilder:
                                            (context) {
                                      return const NoResultFound();
                                    }, itemBuilder: (context, item, index) {
                                      return SavedJobItem(
                                        offer: item,
                                      );
                                    })),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
