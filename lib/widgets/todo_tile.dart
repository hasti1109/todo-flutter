import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoTile extends StatelessWidget {

  String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function() onDelete;

  TodoTile({super.key, required this.taskName, required this.taskCompleted, required this.onChanged, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        tileColor: Colors.white,
        leading: Checkbox(
          value: taskCompleted,
          onChanged: onChanged,
          checkColor: Colors.white,
          activeColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        title: Text(
            taskName,
          style: GoogleFonts.lato(
            fontSize: 16.spMin,
            decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none
          ),
        ),
        trailing: GestureDetector(
            onTap: onDelete,
            child: Icon(Icons.delete, color: Colors.red)
        )
      ),
    );
  }
}
