// ignore_for_file: library_private_types_in_public_api, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, library_prefixes

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lab7/src/data/data.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff282626),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 255, 255, 0),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Center(
                child: const Text(
                  'Add New Post',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                ),
                onPressed: () async {
                  image = await _picker.pickImage(source: ImageSource.gallery);
                  setState(() {});
                },
                child: const Text('Upload your image'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(50),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: image == null
                    ? Image.asset(
                        "images/PlaceHolder.png",
                      )
                    : Image.file(File(image!.path)),
              ),
            ),
            Center(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                ),
                onPressed: () {
                  if (image != null) {
                    posts.add(image!);
                    Navigator.pop(context);
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        insetPadding: EdgeInsets.zero,
                        content: Text(
                          "Upload Image To Post",
                          style: const TextStyle(
                            fontSize: 30,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  }
                },
                child: const Text('Post It !'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
