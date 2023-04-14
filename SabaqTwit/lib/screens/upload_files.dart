import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({Key? key}) : super(key: key);

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerQuantity = TextEditingController();

  GlobalKey<FormState> key = GlobalKey();

  CollectionReference _reference = FirebaseFirestore.instance.collection('saqta_list');

  String imageUrl = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          TextFormField(
            controller: _controllerName,
            decoration:
            InputDecoration(hintText: 'Enter the name of the item'),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the item name';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _controllerQuantity,
            decoration:
            InputDecoration(hintText: 'Enter the quantity of the item'),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the item quantity';
              }
              return null;
            },
          ),
          IconButton(onPressed: () async {
            ImagePicker imagePicker = ImagePicker();
            XFile? file = await imagePicker.pickImage(source: ImageSource.camera);
            print('${file?.path}');

            if(file==null) return;

            String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();

            Reference referenceRoot = FirebaseStorage.instance.ref();
            Reference referenceDirImages = referenceRoot.child('images');
            Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);

            try {
              await referenceImageToUpload.putFile(File(file!.path));
              imageUrl = await referenceImageToUpload.getDownloadURL();
            } catch(error){

            }
          },
              icon: Icon(Icons.camera)),
          ElevatedButton(onPressed: () async {
            if(imageUrl.isEmpty)
              {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please upload image')));
                return;
              }

            if(key.currentState!.validate())
              {
                String itemName = _controllerName.text;
                String itemQuantity = _controllerQuantity.text;

                Map<String, String> dataToSend = {
                  'name':itemName,
                  'quantity':itemQuantity,
                  'image':imageUrl,
                };

                _reference.add(dataToSend);
              }
          },
              child: Text('Submit')
          ),
        ],
      ),
    );
  }
}
