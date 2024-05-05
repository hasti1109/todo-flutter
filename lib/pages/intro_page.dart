import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: 10.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300.w,
                height: 300.h,
                child: Lottie.network('https://lottie.host/0aaafe9c-35e2-41f9-8ba2-f07c16465582/lYPU489SuZ.json'),
              ),
            ],
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Organize your life',
                style: GoogleFonts.lato(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 20.h),
                child: Text(
                  'ToDo is a simple and effective todo list and task manager app which helps you organize your day-to-day activities and save time.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.signikaNegative(
                      fontSize: 18.spMin,
                      color: Colors.grey.shade600
                  ),
                ),
              ),
            ],
          ),

          GestureDetector(
            onTap: () => {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage())
              )
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                padding: EdgeInsets.symmetric(horizontal:20.w, vertical: 20.h),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Get Started',
                        style: GoogleFonts.lexend(
                          color: Colors.white,
                          fontSize: 17.spMin,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(width: 10.w,),

                      Icon(Icons.arrow_forward, color: Colors.white,)
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
