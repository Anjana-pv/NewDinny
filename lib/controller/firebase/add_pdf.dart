import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

const int maxPdfSize = 10 * 1024 * 1024;

Future<void> pickAndUploadPdf(RxString pdfUrls) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['pdf'],
  );

  if (result != null) {
    File pdfFile = File(result.files.single.path!);
    if (pdfFile.lengthSync() > maxPdfSize) {
      Get.snackbar(
        'Sized of PDF',
        "'PDF file exceeds the maximum allowed size",
        colorText: Colors.white,
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM,
      );

      return;
    }

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

Future pickImagesAndUpload(RxList cardUrls) async {
  List<File> pickedImages = [];

  final picker = ImagePicker();
  final pickedFileList = await picker.pickMultiImage();

  if (pickedFileList != null) {
    pickedImages =
        pickedFileList.map((pickedFile) => File(pickedFile.path)).toList();
    uploadImages(pickedImages, cardUrls);
  }
}

Future uploadImages(List<File> imgFiles, RxList cardUrls) async {
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
