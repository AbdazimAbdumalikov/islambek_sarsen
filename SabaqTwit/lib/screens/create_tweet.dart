import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sabaqtwit/screens/bottom_nav.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sabaqtwit/models/tweet.dart';

class CreateTweetScreen extends StatefulWidget {
  const CreateTweetScreen({Key? key}) : super(key: key);

  @override
  State<CreateTweetScreen> createState() => _CreateTweetScreenState();
}

class _CreateTweetScreenState extends State<CreateTweetScreen> {
  late String _tweetText;
  late File _pickedImage;
  // handleImageFromGallery() async {
  //   try{
  //     File imageFile = (await ImagePicker.pickImage(source: ImageSource.gallery)) as File;
  //     if(imageFile! = null) {
  //       setState(() {
  //         _pickedImage = imageFile;
  //       });
  //     }
  //   } catch(e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 20,),
            TextField(
              maxLength: 280,
              maxLines: 7,
              decoration: InputDecoration(
                  hintText: 'Enter your tweet'
              ),
              onChanged: (value) {
                _tweetText = value;
              },
            ),
            SizedBox(height: 10,),
            _pickedImage == null?
                SizedBox.shrink():
                Column(
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: FileImage(_pickedImage),
                        )
                      ),
                    ),
                    GestureDetector(
                      // onTap: handleImageFromGallery,
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.blue,
                            width: 2
                          )
                        ),
                        child: Icon(Icons.camera, size: 50, color: Colors.blue),
                      ),
                    )
                  ],
                )
          ],
        ),
      ),
    );
  }
}
