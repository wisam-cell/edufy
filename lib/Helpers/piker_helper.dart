import 'dart:io';


import 'package:image_picker/image_picker.dart';
mixin PickerHelper {
  Future<File?> pickImage({ImageSource =ImageSource.gallery})async{
   var file =  await ImagePicker().pickImage(source:ImageSource );
   return file != null ? File(file.path) : null;

  }




}