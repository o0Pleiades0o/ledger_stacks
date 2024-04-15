import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ledger_stacks/constants/color.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 25.h),
      child: SizedBox(
        width: 60.w,
        height: 60.h,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: kYellow,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.r),
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class CreateFAB extends StatelessWidget {
  const CreateFAB({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      width: 60.w,
      child: FloatingActionButton(
        backgroundColor: kYellow,
        shape: const CircleBorder(),
        onPressed: onPressed,
        heroTag: 'create',
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

class EditeFAB extends StatelessWidget {
  const EditeFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10.w, top: 15.h),
      child: SizedBox(
        height: 45.h,
        width: 45.w,
        child: FloatingActionButton(
          backgroundColor: kYellow,
          shape: const CircleBorder(),
          onPressed: () {},
          heroTag: 'Edite',
          child: const Icon(
            Icons.edit,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
