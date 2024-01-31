import 'package:dinnytable/controller/firebase/add_pdf.dart';
import 'package:dinnytable/view/table_count.dart';
import 'package:dinnytable/widget.dart/card.dart';
import 'package:dinnytable/widget.dart/resuable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

RxList cardUrls = [].obs;
RxString pdfUrls = ''.obs;

class AddDocuments extends StatelessWidget {
  const AddDocuments({
    super.key,
    required this.resturentName,
    required this.ownerName,
    required this.address,
    required this.city,
    required this.totalSeats,
    required this.typeResturent,
    required this.imageUrls,
    required this.username,
    required this.password, 
    required  this.email,
    required this.startingtime, 
   required this.endingTime,
   
  });

  final String? resturentName;
  final String? ownerName;
  final String? address;
  final String? city;  
  final String? totalSeats;
  final String? typeResturent;
  final String? imageUrls;
  final String? username;
  final String? password;
  final String? email;
  final String? startingtime;
  final String? endingTime;


  @override
  Widget build(BuildContext context) {
      //  Clientcontroller regcontroller = Get.put(Clientcontroller());
    
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Add Documents",
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 90),
        child: Center(
          child: Column(
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        "assest/vector-folder-icon-removebg-preview.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              sized20,
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => pickImagesAndUpload(cardUrls),
                      child: Container(
                        width: 400,
                        height: 100,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(117, 149, 171, 157),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            "Menu Card img",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              sized30,
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => pickAndUploadPdf(pdfUrls),
                      child: Container(
                        width: 400,
                        height: 100,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(117, 149, 171, 157),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            "Add documents",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      
                    ),
                   
                  ],
                ),
              ),
               sized10,
                    const Text(" * Please provide a PDF containing your valid documentation."),
              sized30,
              ElevatedButton(
                onPressed: () async {
                   print(username);
                   print(password);
                    print(startingtime);
                    print(endingTime);
                    print(email);
                  Get.to(FrostedGlassScreen(
                            resturentName:  resturentName,
                             ownerName: ownerName, 
                             address: address, 
                             city: city,                            
                              totalSeats: totalSeats,
                               typeResturent: typeResturent,
                                imageUrls: imageUrls, 
                                username: username,
                                 password: password, 
                                 email: email, 
                                 endingTime:endingTime , 
                                 startingtime: startingtime,
                                  ));

                             
                              
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(206, 4, 52, 29)),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  fixedSize:
                      MaterialStateProperty.all<Size>(const Size(250, 50.5)),
                ),
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

 
}

  