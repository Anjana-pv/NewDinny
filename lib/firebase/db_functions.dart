
import 'package:cloud_firestore/cloud_firestore.dart';

class DbFunctions {
   final CollectionReference resturentDatas =
      FirebaseFirestore.instance.collection('resturents');
   Stream<QuerySnapshot> getResturentDatas() {
    final resturentStream = resturentDatas.snapshots(); 
    return resturentStream; 
  }
}
  Future  addUser(String username,String email,String password)async{
await FirebaseFirestore.instance.collection('users').add({
 'username':username,
 'email':email,
' password ':password,

});
  }
  Future<void>fetchdata()async{
    try{
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance.collection('users').get();
        if (querySnapshot.docs.isNotEmpty) {
           for (QueryDocumentSnapshot<Map<String, dynamic>> document
          in querySnapshot.docs) {
            String username = document.data()['username'];
        String email = document.data()['email'];
         print('Username: $username, Email: $email');
      }
    } else {
      print('No documents found in the "users" collection.');
    }
  } catch (e) {
    print('Error fetching data: $e');
  }
  }
 






