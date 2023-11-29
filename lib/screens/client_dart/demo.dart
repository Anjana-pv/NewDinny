
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dinnytable/firebase/db_functions.dart';
import 'package:flutter/material.dart';

class Demo extends StatelessWidget {
  const Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return 
  
StreamBuilder(
        stream: DbFunctions().getResturentDatas(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            List resturentList = snapshot.data!.docs;
            return Scaffold(
                body: ListView.separated(
                    itemBuilder: (context, index) {
                      DocumentSnapshot document = resturentList[index];
                      Map<String, dynamic> data =
                          document.data() as Map<String, dynamic>;
                      return ListTile(
                        title:Text( data['name']),
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: resturentList.length));
          } else {
            return const SizedBox(
              child: Center(
                child: Text('Something went wrong'),
              ),
            );
          }
        });
  }
}