import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/widgets/header.dart';
import 'package:todo/widgets/no_task_widget.dart';
import 'package:todo/widgets/todo_tile.dart';

import '../services/firestore.dart';

class TasksPage extends StatefulWidget {
  TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {

  final FirestoreService firestoreService = FirestoreService();

  void checkBoxChanged(bool? value, bool taskCompleted, String docID){
    firestoreService.updateTask(docID, taskCompleted);
  }
  
  void onDelete(String docID){
    firestoreService.deleteTask(docID);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header(),

          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: firestoreService.getTasksStream(),
              builder: (context, snapshot) {

                if (snapshot.hasData && snapshot.data!.docs.isNotEmpty){
                  List tasksList = snapshot.data!.docs;

                  return ListView.builder(
                    itemCount: tasksList.length,
                    itemBuilder: (context, index){
                      //get individual doc
                      DocumentSnapshot document = tasksList[index];
                      String docID = document.id;

                      //get task from each doc
                      Map <String, dynamic> data = document.data() as Map<String,dynamic>;
                      String taskText = data["task"];
                      bool taskCompleted = data["taskCompleted"];

                      return TodoTile(
                        taskName: taskText,
                        taskCompleted: taskCompleted,
                        onChanged: (value) => checkBoxChanged(value, !taskCompleted ,docID),
                        onDelete: () => onDelete(docID),
                      );
                    },
                  );
                }
                else{
                  return Center(child: NoTasksWidget());
                }
              }
            ),
          ),
        ]
      ),
    );
  }
}
