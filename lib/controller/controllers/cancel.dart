import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cancelcontroller extends GetxController {
  final Rx<Stream<QuerySnapshot<Object?>>> cancelStream =
      Rx<Stream<QuerySnapshot<Object?>>>(const Stream.empty());

  @override
  void onInit() {
    super.onInit();
    fetchDatas();
  }

  Stream<QuerySnapshot<Object?>> getCancelData(String id) {
    final CollectionReference studentCollection = FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .collection('cancel_booking');
    final studentsStream = studentCollection.snapshots();
    return studentsStream;
  }

  Future<void> fetchDatas() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final id = prefs.getString('resturent_id');

    cancelStream.value = getCancelData(id!);
  }
}
