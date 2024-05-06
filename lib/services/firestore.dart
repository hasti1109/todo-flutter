import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService{
  final CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');

  //create
  Future<void> addTask(String task, bool taskCompleted){
    return tasks.add({
      'task': task,
      'taskCompleted': taskCompleted
    });
  }

  Stream<QuerySnapshot> getTasksStream(){
    final tasksStream = tasks.snapshots();
    return tasksStream;
  }

  Future<void> updateTask(String docID, bool taskCompleted){
    return tasks.doc(docID).update({
      "taskCompleted": taskCompleted
    });
  }

  Future<void> deleteTask(String docID) {
    return tasks.doc(docID).delete();
  }

}