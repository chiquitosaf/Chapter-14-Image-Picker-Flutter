
//Image Picker Chiquito 1301210284
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  File? _image;

  Future getImageGallery() async{
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image == null) return;

    final imageTemporary = File(image.path);

    setState(() {
      this._image = imageTemporary;
    });
  }

  Future getImageCamera() async{
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if(image == null) return;

    final imageTemporary = File(image.path);

    setState(() {
      this._image = imageTemporary;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chiquito 1301210284 \n Image Picker'),
      ),
      body: Center(
        child: Column(children: [
          SizedBox(height: 20,),
          Container(
            height: 300,
            width: 300,
            child: _image != null ? Image.file(_image!, width: 250, height: 250, fit: BoxFit.cover,): Image.asset('assets/insert_image.png'),
          ),
          SizedBox(height: 20,),
          CustomButton(title: 'Pick from gallery', icon: Icons.image_outlined, onClick: getImageGallery),
          CustomButton(title: 'Pick from camera', icon: Icons.camera, onClick: getImageCamera),
        ],

        ),
      ),
    );
  }
}

Widget CustomButton({
  required String title,
  required IconData icon,
  required void Function() onClick,
}) {
  return Container(
    width: 280,
    child: ElevatedButton(
      onPressed: onClick,
      child: Row(
        children: [
          Icon(icon),
          SizedBox(
            width: 20,
          ),
          Text(title)
        ],
      ),
    ),
  );
}

