import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import '../../styles/CommonSize.dart';
import '../../styles/CommonTextStyle.dart';
import '../../styles/common Color.dart';
import '../../widgets/entry.dart';
import 'package:get/get.dart';
import 'afterImage.dart';

class Description extends StatefulWidget {
  const Description({Key? key}) : super(key: key);

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  TextEditingController needMaterialControl = TextEditingController(),
      materialNameControl = TextEditingController(),
      materialCostControl = TextEditingController(),
      materialQuantityControl = TextEditingController(),
      totalMaterialCostControl = TextEditingController();
  bool needMaterialProperty = false;
  List needMaterial = [
    {"name": "Yes"},
    {"name": "No"}
  ];

  List materialData = [
    {"name": "Aluminium Door Handle"},
    {"name": "Gypsom board"},
    {"name": "Aluminium Door Lock"}
  ];

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
          SizedBox(
            height: displayHeight(context) * 0.84,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: displayHeight(context) * 0.25,
                      decoration: commonShadow,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 16),
                            child: Text('Observation', style: cardTitle),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: SizedBox(
                              height: displayHeight(context) * 0.15,
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
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: displayHeight(context) * 0.25,
                      decoration: commonShadow,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 16),
                            child: Text('Root Cause', style: cardTitle),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: SizedBox(
                              height: displayHeight(context) * 0.15,
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: TextFormField(
                                    maxLines: 5,
                                    minLines: 1,
                                    decoration: const InputDecoration(
                                        hintText: "Write the root cause",
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
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: displayHeight(context) * 0.25,
                      decoration: commonShadow,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 16),
                            child: Text('Work Carried Out', style: cardTitle),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: SizedBox(
                              height: displayHeight(context) * 0.15,
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: TextFormField(
                                    maxLines: 5,
                                    minLines: 1,
                                    decoration: const InputDecoration(
                                        hintText: "Write the work carried out",
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
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        decoration: commonShadow,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 16),
                              child: Text('Select Material', style: cardTitle),
                            ),
                            materialNeed(
                                double.infinity, displayWidth(context) * 0.1),
                            Visibility(
                              visible: needMaterialProperty,
                              child: materialName(
                                  double.infinity, displayWidth(context) * 0.1),
                            ),
                            Visibility(
                              visible: needMaterialProperty,
                              child: materialCost(
                                  double.infinity, displayWidth(context) * 0.1),
                            ),
                            Visibility(
                              visible: needMaterialProperty,
                              child: materialQuantity(
                                  double.infinity, displayWidth(context) * 0.1),
                            ),
                            Visibility(
                              visible: needMaterialProperty,
                              child: totalMaterialCost(
                                  double.infinity, displayWidth(context) * 0.1),
                            ),
                            Visibility(
                              visible: needMaterialProperty,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GradientButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  increaseWidthBy: 45,
                                  increaseHeightBy: 6,
                                  callback: () {},
                                  gradient: primaryGradient,
                                  shadowColor: Gradients
                                      .backToFuture.colors.last
                                      .withOpacity(0.25),
                                  child: const Text('Save & Add Material'),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                          gradient: primaryGradient,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              Text('Material Details', style: bottomFixedBtn),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                        decoration: table,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 4.0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Text("Name", style: cardHeader)),
                                    Expanded(
                                        flex: 1,
                                        child: Text("QTY", style: cardHeader)),
                                    Expanded(
                                        flex: 1,
                                        child: Text("Unit Price",
                                            style: cardHeader)),
                                    Expanded(
                                        flex: 1,
                                        child: Text("Material Value",
                                            style: cardHeader)),
                                  ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Text("Gypsum Board",
                                            style: cardBody)),
                                    Expanded(
                                        flex: 1,
                                        child: Text("01", style: cardBody)),
                                    Expanded(
                                        flex: 1,
                                        child: Text("1.200", style: cardBody)),
                                    Expanded(
                                        flex: 1,
                                        child: Text("1.20", style: cardBody)),
                                  ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Text("Aluminium Door Handle",
                                            style: cardBody)),
                                    Expanded(
                                        flex: 1,
                                        child: Text("01", style: cardBody)),
                                    Expanded(
                                        flex: 1,
                                        child: Text("0.850", style: cardBody)),
                                    Expanded(
                                        flex: 1,
                                        child: Text("0.85", style: cardBody)),
                                  ]),
                            ),
                          ],
                        )),
                  )
                ],
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
              Get.to(const AfterImage());
            },
            gradient: primaryGradient,
            shadowColor: Gradients.backToFuture.colors.last.withOpacity(0.25),
            child: const Text('Next'),
          ),
        ],
      ),
    );
  }

  Widget materialNeed(double val, double height) {
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
                  headerNonMandatoryName('Need Material ?'),
                  if (needMaterialControl.text.isNotEmpty)
                    InkWell(
                        onTap: () {
                          setState(() {
                            needMaterialControl.clear();
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
                controller: needMaterialControl,
                cursorColor: secondaryColor,
                decoration: inputBox('Material'),
                onTap: () async {
                  setState(() {
                    needMaterialProperty = true;
                  });
                  singleFieldBottomSheet(
                      needMaterial, needMaterialControl, 'name',
                      (selectedValue) {
                    setState(() {
                      needMaterialControl.text = selectedValue;
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

  Widget materialName(double val, double height) {
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
                  headerNonMandatoryName('Material Name'),
                  if (materialNameControl.text.isNotEmpty)
                    InkWell(
                        onTap: () {
                          setState(() {
                            materialNameControl.clear();
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
                controller: materialNameControl,
                cursorColor: secondaryColor,
                decoration: inputBox('Material Name'),
                onTap: () async {
                  singleFieldBottomSheet(
                      materialData, materialNameControl, 'name',
                      (selectedValue) {
                    setState(() {
                      materialNameControl.text = selectedValue;
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

  Widget materialCost(double val, double height) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: val, child: headerNonMandatoryName('Material Cost')),
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
                controller: materialCostControl,
                cursorColor: secondaryColor,
                decoration: inputBox('Material Cost'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget materialQuantity(double val, double height) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: val,
              child: headerNonMandatoryName('Material Quantity Required')),
          SizedBox(
            height: height,
            width: val,
            child: PhysicalModel(
              elevation: 2.0,
              borderRadius: BorderRadius.circular(10),
              color: primaryColor,
              shadowColor: Colors.grey.shade200,
              child: TextFormField(
                keyboardType: TextInputType.number,
                // readOnly: true,
                style: const TextStyle(
                    fontSize: 14, overflow: TextOverflow.ellipsis),
                controller: materialQuantityControl,
                cursorColor: secondaryColor,
                decoration: inputBox('Material Quantity'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget totalMaterialCost(double val, double height) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: val, child: headerNonMandatoryName('Total Material Cost')),
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
                controller: totalMaterialCostControl,
                cursorColor: secondaryColor,
                decoration: inputBox('Total'),
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
