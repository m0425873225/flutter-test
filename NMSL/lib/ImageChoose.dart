import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageChooseState{

  static Future<String> getImage({ImageSource source = ImageSource.camera}) async {
    File _image;
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: source);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }
  }
