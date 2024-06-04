// import 'dart:io';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:developer' as devtools show log;

class Apkdata {
  static int selectedIndex = 0;
  static String pimage = '';
  static String temppimage = '';

  static String pname = '';
  static var list = [];
  static var filteredList = [];
  static late Map<String, dynamic> searchList;
}

// XFile? _selectedImage;
// String? url;
// Future<void> pickImage() async {
//   final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

//   if (pickedFile != null) {
//     devtools.log(pickedFile.path);
//     _selectedImage = pickedFile;
//   }
// }

// //store the image in firebase storage
// Future<String> uploadImageToStorage() async {
//   final storage = FirebaseStorage.instance.ref();
//   devtools.log("1");
//   final storageRef = storage.child('profile_images').child('image.jpg');
//   devtools.log("2");
//   try {
//     final uploadTask = storageRef.putFile(File(_selectedImage!.path));
//     devtools.log("3");
//     devtools.log(uploadTask.toString());
//     final snapshot = await uploadTask.whenComplete(() {});
//     devtools.log("4");
//     final downloadUrl = await snapshot.ref.getDownloadURL();
//     devtools.log("5");
//     devtools.log(downloadUrl);
//     devtools.log("6");
//     return downloadUrl;
//   } catch (e) {
//     devtools.log(e.toString());
//   }
//   return url.toString();
// }
