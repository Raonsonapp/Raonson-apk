import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:uuid/uuid.dart';

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  File? image;
  final caption = TextEditingController();

  chooseImage() async {
    final picker = ImagePicker();
    final file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      setState(() {
        image = File(file.path);
      });
    }
  }

  upload() async {
    if (image == null) return;

    final id = Uuid().v4();
    final ref = FirebaseStorage.instance
        .ref("posts")
        .child("$id.jpg");

    await ref.putFile(image!);
    final url = await ref.getDownloadURL();

    await FirebaseFirestore.instance.collection("posts").add({
      "image": url,
      "caption": caption.text,
      "time": FieldValue.serverTimestamp(),
    });

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Пост бор шуд!")));

    setState(() {
      image = null;
      caption.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Пост гузоштан")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            image == null
                ? Container(
                    height: 200,
                    color: Colors.grey[800],
                    child: Center(child: Text("Сурат интихоб кун")),
                  )
                : Image.file(image!),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: chooseImage, child: Text("Интихоб кардан")),
            TextField(
              controller: caption,
              decoration: InputDecoration(labelText: "Матн"),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: upload, child: Text("Бор кун"))
          ],
        ),
      ),
    );
  }
}
