import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionItemBuilder extends StatelessWidget {
  const SectionItemBuilder({
    super.key,
    required this.section,
    required this.selected,
    required this.onTap
  });

  final String section;
  final bool selected;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: selected? Color(0xffE9EEFA) :Colors.white,
          borderRadius: BorderRadius.circular(50.r),
          border: Border.all(color: Color(0xffE9EEFA)),
        ),
        padding: REdgeInsets.symmetric(
          horizontal: 24, vertical: 6
        ),
        child: Text(section, style: TextStyle(
          color: Color(0xff231F20),
          fontSize: 14.sp,
          fontWeight: FontWeight.bold
        ),),
      ),
    );
  }
}
