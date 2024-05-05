import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {

  String btnName;
  final Function() btnAction;

  MyButton({super.key, required this.btnName, required this.btnAction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: btnAction,
        child: Container(
          width: 70.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          child: Center(
            child: Text(
              btnName,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 15.spMin,
              ),
            ),
          ),
        ),
      );
  }
}
