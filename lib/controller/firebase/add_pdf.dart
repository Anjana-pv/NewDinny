 import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

Future<void> pickAndUploadPdf(RxString pdfUrls) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['pdf'],
  );

  if (result != null) {
    File pdfFile = File(result.files.single.path!);
    await uploadPdf(pdfFile, pdfUrls);
  }
}
Future<void> uploadPdf(File pdfFile, RxString pdf) async {
  try {
    final storage = FirebaseStorage.instance;
    String fileName = basename(pdfFile.path);
    Reference storageReference = storage.ref().child('pdfs/$fileName');
    final uploadImage = await storageReference.putFile(pdfFile);
    pdf.value = await storageReference.getDownloadURL();
    print('PDF uploaded successfully');
  } catch (e) {
    print('Error uploading PDF: $e');
  }
}
Future<void> pickImagesAndUpload(RxList cardUrls) async {
  List<File> pickedImages = [];

  final picker = ImagePicker();
  final pickedFileList = await picker.pickMultiImage();

  if (pickedFileList != null) {
    pickedImages =
        pickedFileList.map((pickedFile) => File(pickedFile.path)).toList();
    uploadImages(pickedImages, cardUrls);
  }
}
Future<void> uploadImages(List<File> imgFiles, RxList cardUrls) async {
  try {
    final storage = FirebaseStorage.instance;
    for (File imgFile in imgFiles) {
      String fileName = basename(imgFile.path);
      Reference storageReference = storage.ref().child('menuCards/$fileName');
      await storageReference.putFile(imgFile);
      cardUrls.add(await storageReference.getDownloadURL());
    }
    print('Images uploaded successfully');
  } catch (e) {
    print('Error uploading images: $e');
  }
}