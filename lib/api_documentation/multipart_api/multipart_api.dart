import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tutorial/api_documentation/api_services/api_services.dart';
import 'package:flutter_tutorial/api_documentation/models/response/upload_media_response.dart';
import 'package:image_picker/image_picker.dart';

class ViewMultipartApi extends StatefulWidget {
  const ViewMultipartApi({super.key});

  @override
  State<ViewMultipartApi> createState() => _ViewMultipartApiState();
}

class _ViewMultipartApiState extends State<ViewMultipartApi>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  File? selectedImage;
  bool isLoading = false;
  UploadMediaResponse uploadMediaResponse = UploadMediaResponse();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Multipart Api Integration"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.00),
        child: Column(
          children: [
            GestureDetector(
              onTap: () async {
                final ImagePicker picker = ImagePicker();
                final XFile? image = await picker.pickImage(
                  source: ImageSource.gallery,
                );
                if (image != null) {
                  selectedImage = File(image.path);
                }
              },
              child: Container(
                height: 250,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child:
                    selectedImage == null
                        ? Text("Select Image")
                        : ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: SizedBox(
                            height: 250,
                            width: double.infinity,
                            child: Image.file(
                              selectedImage!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.purple,
                ),
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  try {
                    uploadMediaResponse =
                        (await ApiServices().uploadMedia(selectedImage!))!;
                    print("Data == ${uploadMediaResponse.location}");
                    setState(() {
                      isLoading = false;
                    });
                  } catch (e) {
                    print(e.toString());
                  }
                },
                child:
                    isLoading
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text("Upload"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
