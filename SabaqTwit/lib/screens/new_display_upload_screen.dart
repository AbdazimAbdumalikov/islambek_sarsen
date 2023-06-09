import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class DisplayUpload extends StatefulWidget {
  const DisplayUpload({Key? key}) : super(key: key);

  @override
  State<DisplayUpload> createState() => _DisplayUploadState();
}

class _DisplayUploadState extends State<DisplayUpload> {
  PlatformFile? pickedFile;
  UploadTask? uploadTask;

  Future selectedFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
  }

  Future uploadFile() async {
    final path = 'files/${pickedFile!.name}';
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putFile(file);

    final snapshot = await uploadTask!.whenComplete(() {});

    final urlDownload = await snapshot.ref.getDownloadURL();
    print('Download link: $urlDownload');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (pickedFile!=null)
              Expanded(
                  child: Container(
                    color: Colors.blue,
                    child: Center(
                      child: Image.file(
                        File(pickedFile!.path!),
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )
                    ),
                  )
              ),
            const SizedBox(height: 32),
            ElevatedButton(
                onPressed: selectedFile,
                child: Text('Тандау')
            ),
            ElevatedButton(
                onPressed: uploadFile,
                child: Text('Жүктеп салу')
            ),
            const SizedBox(height: 32),
            buildProgress(),
          ],
        ),
      ),
    );
  }

  Widget buildProgress() => StreamBuilder<TaskSnapshot>(
      stream: uploadTask?.snapshotEvents,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data!;
          double progress = data.bytesTransferred/data.totalBytes;
          
          return SizedBox(
            height: 50,
            child: Stack(
              fit: StackFit.expand,
              children: [
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey,
                  color: Colors.green,
                ),
                Center(
                  child: Text(
                    '${(100*progress).roundToDouble()}%',
                    style: const TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          );
        } else {
          return const SizedBox(height: 50,);
        }
      });
}
