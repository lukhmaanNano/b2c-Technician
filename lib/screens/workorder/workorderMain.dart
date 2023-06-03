import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:b2ctechnician/screens/workorder/workorderDetails.dart';
import 'package:b2ctechnician/services/json.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import '../../styles/CommonSize.dart';
import '../../styles/CommonTextStyle.dart';
import '../../styles/common Color.dart';
import '../../widgets/divider.dart';

class WorkOrderMain extends StatefulWidget {
  const WorkOrderMain({Key? key}) : super(key: key);

  @override
  State<WorkOrderMain> createState() => _WorkOrderMainState();
}

class _WorkOrderMainState extends State<WorkOrderMain> {
  final Json json = Get.find<Json>();
  final Completer<GoogleMapController> _controller = Completer();
  List data = [
    {"id": "1", "lat": 11.0022371, "lng": 76.9527723},
    {"id": "2", "lat": 11.016844, "lng": 76.955833}
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
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
          "Work Order",
          style: appBar,
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 60,
            color: Colors.white,
            child: search(),
          ),
          ListView.builder(
            itemCount: json.workOrder.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: InkWell(
                  onTap: () {
                    bottomSheet1(context);
                  },
                  child: Container(
                    decoration: commonShadow,
                    width: double.infinity,
                    height: displayHeight(context) * 0.2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                json.workOrder[index]['WONo'],
                                style: cardTitle,
                              ),
                              Container(
                                width: 84,
                                height: 24,
                                decoration: BoxDecoration(
                                  gradient: primaryGradient,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      bottomLeft: Radius.circular(5)),
                                ),
                                child: Center(
                                    child: Text(
                                  json.workOrder[index]['status'],
                                  style: statusCard,
                                )),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                    'Service Name',
                                    style: cardHeader,
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                    ': ${json.workOrder[index]['ServiceName']}',
                                    style: cardBody,
                                  ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                    'Client Status',
                                    style: cardHeader,
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                    ': ${json.workOrder[index]['ClientStatus']}',
                                    style: cardBody,
                                  ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                    'Service Status',
                                    style: cardHeader,
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                    ': ${json.workOrder[index]['ServiceStatus']}',
                                    style: cardBody,
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Widget search() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 45,
        width: double.infinity,
        child: Container(
            decoration: const BoxDecoration(
                color: Color(0xffAAAAAA),
                borderRadius: BorderRadius.all(Radius.circular(50))),
            padding: const EdgeInsets.all(4.5),
            child: Container(
              padding: EdgeInsets.zero,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.white, blurRadius: 10, spreadRadius: 10)
                  ]),
              width: double.infinity,
              height: 45,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Center(
                      child: Icon(
                        Icons.search,
                        size: 25,
                        color: grey100,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12.0, left: 8.0),
                      child: TextFormField(
                        inputFormatters: [LengthLimitingTextInputFormatter(80)],
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(color: grey100),
                          border: InputBorder.none,
                          hintText: 'Search',
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }

  Future bottomSheet1(context) {
    final data = json.workOrder[0];
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0))),
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Stack(clipBehavior: Clip.none, children: [
          SizedBox(
            height: displayHeight(context) * 0.50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(40.0),
                              topRight: Radius.circular(40.0)),
                          child: SizedBox(
                              height: displayHeight(context) * 0.15,
                              width: double.infinity,
                              child: map()),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child:
                              Text('Wo No: ${data['WONo']}', style: cardTitle),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16, bottom: 16),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Text('Service Requested Date',
                                        style: cardHeader)),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                      ': ${data['ServiceRequestedDate']}',
                                      style: cardBody),
                                )
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16, bottom: 16),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child:
                                      Text('Requested Type', style: cardHeader),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(': ${data['RequestedType']}',
                                      style: cardBody),
                                )
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16, bottom: 16),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Text('Service Requested',
                                        style: cardHeader)),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                      ': ${data['ServiceRequestedDate']}',
                                      style: cardBody),
                                )
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16, bottom: 16),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Text('Client Status',
                                        style: cardHeader)),
                                Expanded(
                                  flex: 1,
                                  child: Text(': ${data['ClientStatus']}',
                                      style: cardBody),
                                )
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16, bottom: 16),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Text('Provider Status',
                                        style: cardHeader)),
                                Expanded(
                                  flex: 1,
                                  child: Text(': ${data['ProviderStatus']}',
                                      style: cardBody),
                                )
                              ]),
                        ),
                        const DividerWidget(),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text('Customer Details', style: cardTitle),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16, bottom: 16),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Text(' Name', style: cardHeader)),
                                Expanded(
                                  flex: 1,
                                  child: Text(': ${data['Name']}',
                                      style: cardBody),
                                )
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16, bottom: 16),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Text('Address', style: cardHeader)),
                                Expanded(
                                  flex: 1,
                                  child: Text(': ${data['Address']}',
                                      style: cardBody),
                                )
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16, bottom: 16),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Text('Contact Information',
                                        style: cardHeader)),
                                Expanded(
                                  flex: 1,
                                  child: Text(': ${data['ContactInformation']}',
                                      style: cardBody),
                                )
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    serviceDialog();
                  },
                  child: Container(
                    width: double.infinity,
                    height: 52,
                    decoration: BoxDecoration(gradient: primaryGradient),
                    child: Center(
                      child: Text("Process", style: bottomFixedBtn),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: -70,
            right: 0,
            left: 0,
            child: FloatingActionButton.small(
                backgroundColor: primaryColor,
                foregroundColor: Colors.black,
                onPressed: () => Navigator.pop(context),
                child: const Icon(Icons.close_rounded, color: secondaryColor)),
          )
        ]);
      },
    );
  }

  Widget map() {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(data[0]['lat'], data[0]['lng']),
        zoom: 14.0,
      ),
      scrollGesturesEnabled: false,
      mapType: MapType.normal,
      // myLocationEnabled: true,
      myLocationButtonEnabled: false,
      markers: <Marker>{
        Marker(
            infoWindow: const InfoWindow(title: "Destination"),
            markerId: MarkerId(data[0]['id']),
            position: LatLng(data[0]['lat'], data[0]['lng']))
      },
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }

  Future serviceDialog() {
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, top: 20),
                  child:
                      Text("Time Tracking - Work Order", style: gradientText),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 18.0, horizontal: 18.0),
                  child: Text(
                      "Time tracking will commence from this moment onward. Please proceed if you are prepared to undertake the task at the customer's location.",
                      style: cardValue),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        style: const ButtonStyle(
                          overlayColor:
                              MaterialStatePropertyAll(Colors.transparent),
                        ),
                        onPressed: () async {
                          Navigator.of(ctx).pop();
                        },
                        child: Text("Cancel", style: gradientText),
                      ),
                      TextButton(
                        style: const ButtonStyle(
                          overlayColor:
                              MaterialStatePropertyAll(Colors.transparent),
                        ),
                        onPressed: () async {
                          Navigator.of(ctx).pop();
                          Get.to(const WorkOrderDetails());
                        },
                        child: Text("Proceed", style: gradientText),
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
