import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/widgets/new_task_button.dart';

import '../services/firestore.dart';

class NewTaskPage extends StatelessWidget {

  final taskController = TextEditingController();
  final FirestoreService firestoreService = FirestoreService();

  NewTaskPage({super.key});
  
  void saveTask(BuildContext context){
    final String task = taskController.text;
    if (task == ""){
      final snackBar = SnackBar(
        content: Padding(
          padding: EdgeInsets.all(10.0),
          child: Text('Please create a task to save!', style: TextStyle(color: Colors.black),)
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Theme.of(context).colorScheme.background,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    else{
      firestoreService.addTask(task, false);
      taskController.clear();
      final snackBar = SnackBar(
        content: Padding(
            padding: EdgeInsets.all(10.0),
            child: Text('Task Saved!', style: TextStyle(color: Colors.black),)
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Theme.of(context).colorScheme.background,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
  
  void onCancel(){
    taskController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 250.w,
                height: 190.h,
                child: Card(
                  elevation: 10,
                  shadowColor: Colors.black,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Create a task',
                          style: GoogleFonts.lato(fontSize: 18.spMin),
                        ),
                        TextField(
                          controller: taskController,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: 'Eg: Write a mail',
                            focusColor: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MyButton(btnName: 'Save', btnAction: () => saveTask(context)),
                            MyButton(btnName: 'Cancel', btnAction: () => onCancel(),)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
