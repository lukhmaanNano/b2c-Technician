import 'dart:io';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:image_picker/image_picker.dart';
import '../../services/json.dart';
import '../../styles/CommonSize.dart';
import '../../styles/CommonTextStyle.dart';
import '../../styles/common Color.dart';
import '../../widgets/divider.dart';
import '../../widgets/entry.dart';

class ServiceRequestDetails extends StatefulWidget {
  const ServiceRequestDetails({Key? key}) : super(key: key);

  @override
  State<ServiceRequestDetails> createState() => _ServiceRequestDetailsState();
}

class _ServiceRequestDetailsState extends State<ServiceRequestDetails> {
  final Json _json = Get.find<Json>();
  TextEditingController statusControl = TextEditingController(),
      requestControl = TextEditingController(),
      paymentControl = TextEditingController(),
      contractValueControl = TextEditingController();
  File? _imageFile;
  final _picker = ImagePicker();
  List statusData = [
    {"name": "Confirm Order"},
    {"name": "Reject"}
  ];
  List requestData = [
    {"name": "One Time Service"},
    {"name": "Contract Based Service"}
  ];
  List paymentData = [
    {"name": "Cash"},
    {"name": "Online"}
  ];

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
            "Request",
            style: appBar,
          ),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                // height: displayHeight(context) * 0.84,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Container(
                          height: displayHeight(context) * 0.28,
                          // width: displayWidth(context) * 0.90,
                          decoration: commonShadow,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, left: 8.0, bottom: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('General Information', style: cardTitle),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text('Request No',
                                                style: cardHeader)),
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                              ': ${_json.serviceRequests[0]['ServiceName']}',
                                              style: cardBody),
                                        )
                                      ]),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Text('Service Name',
                                              style: cardHeader),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                              ': ${_json.serviceRequests[0]['YourExceededDate&Time']}',
                                              style: cardBody),
                                        )
                                      ]),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text('Main Service',
                                                style: cardHeader)),
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                              ': ${_json.serviceRequests[0]['PriorityLevel']}',
                                              style: cardBody),
                                        )
                                      ]),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text('Customer Name',
                                                style: cardHeader)),
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                              ': ${_json.serviceRequests[0]['TargetTime']}',
                                              style: cardBody),
                                        )
                                      ]),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
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
                                  Text('Attach Site Survey Image',
                                      style: cardTitle),
                                  Card(
                                    shadowColor: Colors.grey.shade200,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: InkWell(
                                        onTap: () async => imageDialog(),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: const [
                                              Expanded(
                                                flex: 1,
                                                child: Icon(
                                                    Icons.photo_camera_rounded,
                                                    color: secondaryColor),
                                              ),
                                              Expanded(
                                                  flex: 3,
                                                  child: Text('Add / Capture')),
                                              Expanded(
                                                flex: 1,
                                                child: Icon(
                                                    Icons.add_circle_rounded,
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
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Container(
                          width: double.infinity,
                          decoration: commonShadow,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Service List', style: cardTitle),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text('Jobs & Est Bill',
                                                style: cardHeader)),
                                        Expanded(
                                            flex: 1,
                                            child: Text('Service Value',
                                                style: cardHeader))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('Installation',
                                                    style: cardHeader),
                                                Text('34.55-42.55',
                                                    style: cardBody)
                                              ],
                                            )),
                                        Expanded(
                                          flex: 1,
                                          child: PhysicalModel(
                                            elevation: 2.0,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: primaryColor,
                                            shadowColor: Colors.grey.shade200,
                                            child: TextFormField(
                                              keyboardType:
                                                  TextInputType.number,
                                              // readOnly: true,
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                              cursorColor: secondaryColor,
                                              decoration: inputBox('00'),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('Cleaning',
                                                    style: cardHeader),
                                                Text('8.00-10.00',
                                                    style: cardBody)
                                              ],
                                            )),
                                        Expanded(
                                          flex: 1,
                                          child: PhysicalModel(
                                            elevation: 2.0,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: primaryColor,
                                            shadowColor: Colors.grey.shade200,
                                            child: TextFormField(
                                              keyboardType:
                                                  TextInputType.number,
                                              // readOnly: true,
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                              cursorColor: secondaryColor,
                                              decoration: inputBox('00'),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('Servicing',
                                                    style: cardHeader),
                                                Text('16.50-19.50',
                                                    style: cardBody)
                                              ],
                                            )),
                                        Expanded(
                                          flex: 1,
                                          child: PhysicalModel(
                                            elevation: 2.0,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: primaryColor,
                                            shadowColor: Colors.grey.shade200,
                                            child: TextFormField(
                                              keyboardType:
                                                  TextInputType.number,
                                              // readOnly: true,
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                              cursorColor: secondaryColor,
                                              decoration: inputBox('00'),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('Repair',
                                                    style: cardHeader),
                                                Text('20.00-24.00',
                                                    style: cardBody)
                                              ],
                                            )),
                                        Expanded(
                                          flex: 1,
                                          child: PhysicalModel(
                                            elevation: 2.0,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: primaryColor,
                                            shadowColor: Colors.grey.shade200,
                                            child: TextFormField(
                                              keyboardType:
                                                  TextInputType.number,
                                              // readOnly: true,
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                              cursorColor: secondaryColor,
                                              decoration: inputBox('00'),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const DividerWidget(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                                'Sub Total Service Value(A)',
                                                style: cardHeader)),
                                        Expanded(
                                          flex: 1,
                                          child: PhysicalModel(
                                            elevation: 2.0,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: primaryColor,
                                            shadowColor: Colors.grey.shade200,
                                            child: TextFormField(
                                              keyboardType:
                                                  TextInputType.number,
                                              // readOnly: true,
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                              cursorColor: secondaryColor,
                                              decoration: inputBox('00'),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Container(
                          width: double.infinity,
                          decoration: commonShadow,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Material List', style: cardTitle),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                                'Sub Total Material Value(B)',
                                                style: cardHeader)),
                                        Expanded(
                                          flex: 1,
                                          child: PhysicalModel(
                                            elevation: 2.0,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: primaryColor,
                                            shadowColor: Colors.grey.shade200,
                                            child: TextFormField(
                                              keyboardType:
                                                  TextInputType.number,
                                              // readOnly: true,
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                              cursorColor: secondaryColor,
                                              decoration: inputBox('00'),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text('Callout Fee',
                                                style: cardHeader)),
                                        Expanded(
                                          flex: 1,
                                          child: PhysicalModel(
                                            elevation: 2.0,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: primaryColor,
                                            shadowColor: Colors.grey.shade200,
                                            child: TextFormField(
                                              keyboardType:
                                                  TextInputType.number,
                                              // readOnly: true,
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                              cursorColor: secondaryColor,
                                              decoration: inputBox('00'),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text('Discounted Value',
                                                style: cardHeader)),
                                        Expanded(
                                          flex: 1,
                                          child: PhysicalModel(
                                            elevation: 2.0,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: primaryColor,
                                            shadowColor: Colors.grey.shade200,
                                            child: TextFormField(
                                              keyboardType:
                                                  TextInputType.number,
                                              // readOnly: true,
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                              cursorColor: secondaryColor,
                                              decoration: inputBox('00'),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const DividerWidget(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                                'Total Contract Value(A+B)',
                                                style: cardHeader)),
                                        Expanded(
                                          flex: 1,
                                          child: PhysicalModel(
                                            elevation: 2.0,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: primaryColor,
                                            shadowColor: Colors.grey.shade200,
                                            child: TextFormField(
                                              keyboardType:
                                                  TextInputType.number,
                                              // readOnly: true,
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                              cursorColor: secondaryColor,
                                              decoration: inputBox('00'),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Container(
                          height: displayHeight(context) * 0.25,
                          decoration: commonShadow,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0, vertical: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Service Comments', style: cardTitle),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text('Comments', style: cardTitle),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: SizedBox(
                                  // height: displayHeight(context) * 0.15,
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: TextFormField(
                                        maxLines: 5,
                                        minLines: 1,
                                        decoration: const InputDecoration(
                                            hintText: "Write your observation",
                                            border: InputBorder.none),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Container(
                          decoration: commonShadow,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0, vertical: 16),
                                child:
                                    Text('Payment Details', style: cardTitle),
                              ),
                              status(
                                  double.infinity, displayWidth(context) * 0.1),
                              requestType(
                                  double.infinity, displayWidth(context) * 0.1),
                              payment(
                                  double.infinity, displayWidth(context) * 0.1),
                              contractValue(
                                  double.infinity, displayWidth(context) * 0.1),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GradientButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
                increaseWidthBy: double.infinity,
                increaseHeightBy: 16,
                callback: () {
                  Navigator.pop(context);
                  // Get.to(const ServiceRequestDetails());
                },
                gradient: primaryGradient,
                shadowColor:
                    Gradients.backToFuture.colors.last.withOpacity(0.25),
                child: const Text('Get Approval'),
              ),
            ]));
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

  Widget status(double val, double height) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: val,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  headerName('Status'),
                  if (statusControl.text.isNotEmpty)
                    InkWell(
                        onTap: () {
                          setState(() {
                            statusControl.clear();
                          });
                        },
                        child: const Icon(Icons.clear, size: 14, color: red))
                ],
              )),
          SizedBox(
            height: height,
            width: val,
            child: PhysicalModel(
              elevation: 2.0,
              borderRadius: BorderRadius.circular(10),
              color: primaryColor,
              shadowColor: Colors.grey.shade200,
              child: TextFormField(
                readOnly: true,
                style: const TextStyle(
                    fontSize: 14, overflow: TextOverflow.ellipsis),
                controller: statusControl,
                cursorColor: secondaryColor,
                decoration: inputBox('00'),
                onTap: () async {
                  singleFieldBottomSheet(statusData, statusControl, 'name',
                      (selectedValue) {
                    setState(() {
                      statusControl.text = selectedValue;
                    });
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget requestType(double val, double height) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: val,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  headerName('Request Type'),
                  if (requestControl.text.isNotEmpty)
                    InkWell(
                        onTap: () {
                          setState(() {
                            requestControl.clear();
                          });
                        },
                        child: const Icon(Icons.clear, size: 14, color: red))
                ],
              )),
          SizedBox(
            height: height,
            width: val,
            child: PhysicalModel(
              elevation: 2.0,
              borderRadius: BorderRadius.circular(10),
              color: primaryColor,
              shadowColor: Colors.grey.shade200,
              child: TextFormField(
                readOnly: true,
                style: const TextStyle(
                    fontSize: 14, overflow: TextOverflow.ellipsis),
                controller: requestControl,
                cursorColor: secondaryColor,
                decoration: inputBox('00'),
                onTap: () async {
                  singleFieldBottomSheet(requestData, requestControl, 'name',
                      (selectedValue) {
                    setState(() {
                      requestControl.text = selectedValue;
                    });
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget payment(double val, double height) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: val,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  headerName('Mode of Payment *'),
                  if (paymentControl.text.isNotEmpty)
                    InkWell(
                        onTap: () {
                          setState(() {
                            paymentControl.clear();
                          });
                        },
                        child: const Icon(Icons.clear, size: 14, color: red))
                ],
              )),
          SizedBox(
            height: height,
            width: val,
            child: PhysicalModel(
              elevation: 2.0,
              borderRadius: BorderRadius.circular(10),
              color: primaryColor,
              shadowColor: Colors.grey.shade200,
              child: TextFormField(
                readOnly: true,
                style: const TextStyle(
                    fontSize: 14, overflow: TextOverflow.ellipsis),
                controller: paymentControl,
                cursorColor: secondaryColor,
                decoration: inputBox('00'),
                onTap: () async {
                  singleFieldBottomSheet(paymentData, paymentControl, 'name',
                      (selectedValue) {
                    setState(() {
                      paymentControl.text = selectedValue;
                    });
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget contractValue(double val, double height) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: val, child: headerName('Contract Value *')),
          SizedBox(
            height: height,
            width: val,
            child: PhysicalModel(
              elevation: 2.0,
              borderRadius: BorderRadius.circular(10),
              color: primaryColor,
              shadowColor: Colors.grey.shade200,
              child: TextFormField(
                readOnly: true,
                style: const TextStyle(
                    fontSize: 14, overflow: TextOverflow.ellipsis),
                controller: contractValueControl,
                cursorColor: secondaryColor,
                decoration: inputBox('Material Cost'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> singleFieldBottomSheet(List data, TextEditingController name,
      String dataName, Function(String)? onSelect) {
    return showModalBottomSheet<void>(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      backgroundColor: Colors.white,
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10), topLeft: Radius.circular(10))),
          height: 200,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SizedBox(
                  height: 190,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                          onTap: () {
                            // setState(() {
                            //   name.text = data[index][dataName];
                            // });
                            onSelect!(data[index][dataName].toString());
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(-1, -1),
                                    spreadRadius: -11,
                                    blurRadius: 12,
                                    color: Color.fromRGBO(159, 159, 159, 1.0),
                                  )
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Center(
                                  child: Text(
                                    data[index][dataName] ?? '',
                                    style: gradientText,
                                  ),
                                ),
                              ),
                            ),
                          ));
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
