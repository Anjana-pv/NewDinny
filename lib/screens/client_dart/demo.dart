// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'dart:io';

// class ScreenUpload extends StatefulWidget {

//   const ScreenUpload({
//     Key? key,
 
//   }) : super(key: key);

//   @override
//   _ScreenUploadState createState() => _ScreenUploadState();
// }

// class _ScreenUploadState extends State<ScreenUpload> {
//   List<PlatformFile> pickedFiles = [];
//   List<UploadTask?> uploadTasks = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Select Image or PDF'),
//       ),
//       body: Center(
//         child: Card(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               buildProgress(uploadTasks),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     pickedFiles.isEmpty
//                         ? TextButton.icon(
//                             label: const Text('Select Files'),
//                             onPressed: () => selectedFiles(context),
//                             icon: const Icon(Icons.add),
//                           )
//                         : TextButton.icon(
//                             onPressed: () => uploadFiles(context, pickedFiles),
//                             label: const Text('Upload Files'),
//                             icon: const Icon(Icons.upload),
//                           ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: pickedFiles.isNotEmpty
//                     ? GridView.builder(
//                         padding: const EdgeInsets.all(5),
//                         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 3,
//                           crossAxisSpacing: 5,
//                           mainAxisSpacing: 5,
//                         ),
//                         itemCount: pickedFiles.length,
//                         itemBuilder: (context, index) {
//                           final file = pickedFiles[index];
//                           return buildFileWidget(file);
//                         },
//                       )
//                     : const Center(child: Text('No file selected')),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildFileWidget(PlatformFile file) {
//     if (file.extension == 'pdf') {
//       return const Text('PDF file selected');
//     } else if (file.extension == 'jpg' ||
//         file.extension == 'jpeg' ||
//         file.extension == 'png') {
//       return Image.file(
//         File(file.path!),
//         width: double.infinity,
//         fit: BoxFit.cover,
//       );
//     } else {
//       return const Text(
//         'Unsupported file format. You can only upload PDF or image files.',
//       );
//     }
//   }

//   Future selectedFiles(BuildContext context) async {
//     final result = await FilePicker.platform.pickFiles(
//       allowMultiple: true,
//     );
//     if (result == null) return;

//     final platformFiles = result.files;
//     setState(() {
//       pickedFiles = platformFiles
//           .where((file) =>
//               file.extension == 'pdf' ||
//               file.extension == 'jpg' ||
//               file.extension == 'jpeg' ||
//               file.extension == 'png')
//           .toList();
//     });
//   }

//   Future uploadFiles(BuildContext context, List<PlatformFile> pickedFiles) async {
//     for (var pickedFile in pickedFiles) {
//       if (pickedFile == null) {
//         continue;
//       }

//       final path = 'files/${pickedFile.name}';
//       final file = File(pickedFile.path!);
//       final ref = FirebaseStorage.instance.ref().child(path);
//       final uploadTask = ref.putFile(file);

//       setState(() {
//         uploadTasks.add(uploadTask);
//       });

//       try {
//         await uploadTask.whenComplete(() {});
//         final urlDownload = await ref.getDownloadURL();
//         print('Download Link : $urlDownload');
//       } catch (error) {
//         print('Error uploading file: $error');
//       } finally {
//         setState(() {
//           uploadTasks.remove(uploadTask);
//         });
//       }
//     }
//   }

//   Widget buildProgress(List<UploadTask?> uploadTasks) => Column(
//         children: uploadTasks.map((uploadTask) {
//           return StreamBuilder<TaskSnapshot>(
//             stream: uploadTask?.snapshotEvents,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 final data = snapshot.data!;
//                 double progress = data.bytesTransferred / data.totalBytes;
//                 return Padding(
//                   padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
//                   child: LinearProgressIndicator(
//                     value: progress,
//                     backgroundColor: Colors.white,
//                   ),
//                 );
//               } else {
//                 return const SizedBox(
//                   height: 50,
//                 );
//               }
//             },
//           );
//         }).toList(),
//       );
// }
