
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

  class DBfuctions extends GetxController{

final CollectionReference collection = FirebaseFirestore.instance.collection('users');
  RxList<Map<String, dynamic>> itemList = <Map<String, dynamic>>[].obs;



  Future addUser(Map<String, dynamic> user)async{
  await collection.add(user);
 

  }

// Future<void> getdata(){
  
// }
// Future<void> update(){
  
// }
// Future<void> deleted(){
  
// }

  }
  


