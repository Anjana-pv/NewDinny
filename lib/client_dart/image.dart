
import 'package:get/get.dart';

// class MyController extends GetxController {
//   Rx<File?> _image = Rx<File?>(null);
//   File? get image => _image.value;

//   Future<void> pickImage() async {
//     final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       // Read the picked image as bytes
//       final bytes = await pickedFile.readAsBytes();

//       // Decode the image
//       img.Image image = img.decodeImage(Uint8List.fromList(bytes))!;

//       // Crop the image to a square
//       int size = image.width < image.height ? image.width : image.height;
//       img.copyCrop(image, 0, 0, size, size);

//       // Save the cropped image to a file
//       Directory tempDir = await getTemporaryDirectory();
//       String tempPath = tempDir.path;
//       File tempFile = File('$tempPath/temp_image.png');
//       await tempFile.writeAsBytes(img.encodePng(image));

//       _image.value = tempFile;
//     }
//   }
// }
