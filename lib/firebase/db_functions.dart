
import 'package:cloud_firestore/cloud_firestore.dart';

class DbFunctions {
   final CollectionReference resturentDatas =
      FirebaseFirestore.instance.collection('resturents');
   Stream<QuerySnapshot> getResturentDatas() {
    final resturentStream = resturentDatas.snapshots(); 
    return resturentStream; 
  }
}
