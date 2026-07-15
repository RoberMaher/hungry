// features/home/views/home_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:hungry/features/home/widgets/build_search_field.dart';
import 'package:hungry/features/home/widgets/card_item.dart';
import 'package:hungry/features/home/widgets/food_category.dart';
import 'package:hungry/features/home/widgets/user_header.dart';
import 'package:hungry/features/product/views/product_details_view.dart';

class HomeView extends StatefulWidget {
  static const String routeName = '/home';

  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<String> categories = ['All', 'Compo', 'Sliders', 'Classic'];

  int selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            /// Header
            SliverAppBar(
              elevation: 0,
              scrolledUnderElevation: 0,
              pinned: true,
              toolbarHeight: 160.h,
              backgroundColor: Colors.white,
              flexibleSpace: Padding(
                padding: EdgeInsets.only(top: 60.0.h, left: 20.w, right: 20.w),
                child: Column(
                  children: [UserHeader(), Gap(8.h), BuildSearchField()],
                ),
              ),
            ),

            /// Categories
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Gap(20.h),
                    FoodCategory(
                      categories: categories,
                      selectedIndex: selectedCategoryIndex,
                      onCategorySelected: (index) {
                        setState(() {
                          selectedCategoryIndex = index;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),

            /// Grid
            SliverPadding(
              padding: EdgeInsets.all(15.w),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Handle card tap
                      Navigator.pushNamed(
                        context,
                        ProductDetailsView.routeName,
                      );
                    },
                    child: CardItem(
                      image: 'assets/test/test1.png',
                      title: 'Cheeseburger',
                      description: "Wendy's Burger",
                      rating: 4.9,
                    ),
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
