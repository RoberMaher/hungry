// features/home/views/home_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/home/widgets/build_search_field.dart';
import 'package:hungry/features/home/widgets/card_item.dart';
import 'package:hungry/features/home/widgets/user_header.dart';
import 'package:hungry/shared/custom_text.dart';

class HomeView extends StatefulWidget {
  static const String routeName = '/home';

  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<String> categories = const ['All', 'Compo', 'Sliders', 'Classic'];

  int selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            /// 🔹 AppBar
            SliverAppBar(
              backgroundColor: Colors.white,
              pinned: true,
              stretch: true,
              expandedHeight: 100.h,
              elevation: 0,
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: const UserHeader(),
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(15.w),
                child: const BuildSearchField(),
              ),
            ),

            /// 🔹 Categories
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: SizedBox(
                  height: 45.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    separatorBuilder: (_, __) => Gap(10.w),
                    itemBuilder: (context, index) {
                      final isSelected = selectedCategoryIndex == index;

                      return GestureDetector(
                        onTap: () {
                          setState(() => selectedCategoryIndex = index);
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          padding: EdgeInsets.symmetric(
                            vertical: 10.h,
                            horizontal: 20.w,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.primaryColor
                                : Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: CustomText(
                            text: categories[index],
                            color: isSelected
                                ? Colors.white
                                : AppColors.primaryColor,
                            weight: FontWeight.w600,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            /// 🔹 Grid
            SliverPadding(
              padding: EdgeInsets.all(15.w),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return const CardItem(
                    image: 'assets/test/test1.png',
                    title: 'Cheeseburger',
                    description: "Wendy's Burger",
                    rating: 4.9,
                  );
                }, childCount: 6),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.h,
                  crossAxisSpacing: 10.w,
                  childAspectRatio: 0.7,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
