import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:get/get.dart';
import '../../styles/CommonSize.dart';
import '../../styles/CommonTextStyle.dart';
import '../../styles/common Color.dart';
import 'complaintPayment.dart';
import 'discription.dart';

class AfterImage extends StatefulWidget {
  const AfterImage({Key? key}) : super(key: key);

  @override
  State<AfterImage> createState() => _AfterImageState();
}

class _AfterImageState extends State<AfterImage> {
  File? _imageFile;
  final _picker = ImagePicker();

  Future<void> _pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() => _imageFile = File(pickedFile.path));
    }
  }

  Future<void> _pickImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() => _imageFile = File(pickedFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: primaryGradient),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.sync_rounded, color: Colors.white))
          ],
          title: Text(
            "Help Request",
            style: appBar,
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(
                height: displayHeight(context) * 0.42,
                width: double.infinity,
                decoration: commonShadow,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Take Complete Picture', style: cardTitle),
                        Card(
                          shadowColor: Colors.grey.shade200,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: InkWell(
                              onTap: () async => imageDialog(),
                              child:const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children:  [
                                    Expanded(
                                      flex: 1,
                                      child: Icon(Icons.photo_camera_rounded,
                                          color: secondaryColor),
                                    ),
                                    Expanded(
                                        flex: 3, child: Text('Add / Capture')),
                                    Expanded(
                                      flex: 1,
                                      child: Icon(Icons.add_circle_rounded,
                                          color: secondaryColor),
                                    )
                                  ]),
                            ),
                          ),
                        ),
                        if (_imageFile == null)
                          SizedBox(
                              height: displayHeight(context) * 0.2,
                              width: double.infinity,
                              child: Center(
                                  child: Image.asset(
                                      height: 60,
                                      width: 60,
                                      "assets/images/folder.png")))
                        else
                          SizedBox(
                            height: displayHeight(context) * 0.3,
                            width: double.infinity,
                            child: Card(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.file(
                                _imageFile!,
                                fit: BoxFit.cover,
                              ),
                            )),
                          )
                      ]),
                ),
              ),
            ),
            GradientButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
              ),
              increaseWidthBy: double.infinity,
              increaseHeightBy: 13,
              callback: () {
                Get.to(const ComplaintPayment());
              },
              gradient: primaryGradient,
              shadowColor: Gradients.backToFuture.colors.last.withOpacity(0.25),
              child: const Text('Next'),
            ),
          ],
        ));
  }

  Future imageDialog() {
    return showDialog(
      context: context,
      builder: (ctx) => ElasticIn(
        child: Dialog(
          backgroundColor: primaryColor,
          elevation: 13,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: SizedBox(
            height: 200,
            width: displayWidth(context) * 0.08,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Upload Image From",
                    style: TextStyle(
                        fontSize: 18,
                        letterSpacing: 0.4,
                        fontWeight: FontWeight.w400,
                        color: Colors.black)),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0, right: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          _pickImageFromGallery();
                          Navigator.of(ctx).pop();
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: const DecorationImage(
                                  image:
                                      AssetImage("assets/images/gallery.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text("Gallery", style: mapBtn)
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _pickImageFromCamera();
                          Navigator.of(ctx).pop();
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: const DecorationImage(
                                  image: AssetImage(
                                      "assets/images/photograph.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text("Camera", style: mapBtn)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
