// features/auth/views/profile_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/shared/custom_button.dart';
import 'package:hungry/shared/custom_text.dart';
import 'package:hungry/shared/custom_text_field.dart';

class ProfileView extends StatefulWidget {
  static const String routeName = '/profile';
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    nameController.text = 'John Doe';
    emailController.text = 'john.doe@example.com';
    addressController.text = '123 Main St, City, State';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white, size: 20.sp),
          ),
          actions: [
            IconButton(
              onPressed: () {
                // Handle edit action
              },
              icon: Icon(Icons.settings, color: Colors.white, size: 20.sp),
            ),
          ],
        ),

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Container(
                    width: 100.w,
                    height: 100.w,
                    margin: EdgeInsets.only(top: 20.h),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%2Fid%2FOIP.X6ZRtPf58NI2WBcA3zO7nAHaHa%3Fr%3D0%26pid%3DApi&f=1&ipt=fb89921cd83389a6d781c940d46578e492c3faeb90f4bb06f72758be6be0aa6f&ipo=images',
                        ),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(color: Colors.white, width: 3.w),
                      borderRadius: BorderRadius.circular(16.w),
                      color: Colors.white,
                    ),
                  ),
                ),
                Gap(40.h),
                CustomTextField(
                  controller: nameController,
                  color: Colors.transparent,
                  label: 'Name',
                ),
                Gap(20.h),
                CustomTextField(
                  controller: emailController,
                  color: Colors.transparent,
                  label: 'Email',
                ),
                Gap(20.h),
                CustomTextField(
                  controller: addressController,
                  color: Colors.transparent,
                  label: 'Delivery Address',
                ),
                Gap(20.h),
                Divider(color: Colors.white, thickness: 1.h),
                Gap(20.h),
                ListTile(
                  onTap: () {
                    setState(() => 'visa');
                  },
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 2.h,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  tileColor: Colors.white,
                  leading: Image.asset('assets/icons/visa.png', width: 60.w),
                  title: CustomText(
                    text: 'Visa card',
                    size: 15.sp,
                    weight: FontWeight.w400,
                    color: AppColors.primaryColor,
                  ),
                  subtitle: CustomText(
                    text: '**** **** **** 1234',
                    size: 12.sp,
                    weight: FontWeight.w400,
                    color: Colors.grey.shade600,
                  ),
                  trailing: CustomText(
                    text: 'Default',
                    size: 12.sp,
                    weight: FontWeight.w400,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Expanded(
                child: CustomButton(onPressed: () {}, text: 'Edit Profile', icon: Icons.edit),
              ),

              Gap(10.w),

              Expanded(
                child: CustomButton(onPressed: () {}, text: 'Logout', color: Colors.red, icon: Icons.logout),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
