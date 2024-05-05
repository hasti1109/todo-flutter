import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../services/firestore.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  final FirestoreService firestoreService = FirestoreService();
  int numberOfUnifinishedTasks = 5;

  void changeCount() async{
    int count = await firestoreService.getIncompleteTasksCount();
    setState(() {
      numberOfUnifinishedTasks = count;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "All Tasks",
            style: GoogleFonts.ubuntu(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold
            ),
          ),

          SizedBox(height: 10.h,),

          Text(
            "You have ${numberOfUnifinishedTasks} unfinished tasks.",
            style: GoogleFonts.ubuntu(
                fontSize: 15.spMin,
            ),
          )
        ],
      ),
    );
  }
}
