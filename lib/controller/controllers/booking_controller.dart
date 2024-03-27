
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookingController extends GetxController{
  @override
  void onInit() {
    super.onInit();
    fetchDatas();
  }

  final Rx<Stream<QuerySnapshot<Object?>>> bookingStream =
      Rx<Stream<QuerySnapshot<Object?>>>(const Stream.empty());
  
   Stream<QuerySnapshot<Object?>> getbooking(String id) {
    final CollectionReference bookingCollection = FirebaseFirestore.instance
        .collection('approvedOne')
        .doc(id)
        .collection('bookings');
    final bookingStream = bookingCollection.snapshots();
    return bookingStream;
  }
    Future<void> fetchDatas() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    final id = prefs.getString('resturent_id');
    if(id==null){
      return ;
    }else{
     bookingStream.value = getbooking(id!);
    }
  }

}