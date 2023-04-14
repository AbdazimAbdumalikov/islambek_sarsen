import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';

class UploadFiles extends StatefulWidget {
  const UploadFiles({Key? key}) : super(key: key);

  @override
  State<UploadFiles> createState() => _UploadFilesState();
}

class _UploadFilesState extends State<UploadFiles> {
  late Future<ListResult> futureFiles;
  Map<int, double> downloadProgress = {};

  @override
  void initState() {
    super.initState();

    futureFiles = FirebaseStorage.instance.ref('/files').listAll();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<ListResult>(
        future: futureFiles,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final files = snapshot.data!.items;
            return ListView.builder(
              itemCount: files.length,
                itemBuilder: (context, index) {
                  final file = files[index];
                  double? progress = downloadProgress[index];
                  return ListTile(
                    title: Text(file.name),
                    subtitle: progress != null
                      ? LinearProgressIndicator(
                      value: progress,
                      backgroundColor: Colors.black38,
                    )
                        : null,
                    trailing: IconButton(
                      icon: Icon(Icons.download),
                      onPressed: () => downloadFile(index, file),
                    ),
                  );
                }
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error Occured'),);
          } else {
            return const Center(child: CircularProgressIndicator(),);
          }
        }
      ),
    );
  }

  Future downloadFile(int index, Reference ref) async {
    final url = await ref.getDownloadURL();

    final tempDir = await getTemporaryDirectory();
    final path = '${tempDir.path}/${ref.name}';
    await Dio().download(
        url,
        path,
        onReceiveProgress: (received, total) {
          double progress = received / total;

          setState(() {
            downloadProgress[index] = progress;
          });
    }
    );

    if (url.contains('.mp4')) {
      await GallerySaver.saveVideo(path, toDcim: true);
    } else if (url.contains('.jpg')) {
      await GallerySaver.saveVideo(path, toDcim: true);
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Downloaded ${ref.name}')),
    );
  }
}
