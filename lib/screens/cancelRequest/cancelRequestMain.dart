import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../services/json.dart';
import '../../styles/CommonSize.dart';
import '../../styles/CommonTextStyle.dart';
import '../../styles/common Color.dart';
import '../../widgets/divider.dart';

class CancelRequestMain extends StatefulWidget {
  const CancelRequestMain({Key? key}) : super(key: key);

  @override
  State<CancelRequestMain> createState() => _CancelRequestMainState();
}

class _CancelRequestMainState extends State<CancelRequestMain> {
  final Json json = Get.find<Json>();
  final Completer<GoogleMapController> _controller = Completer();
  List data = [
    {"id": "1", "lat": 11.0022371, "lng": 76.9527723},
    {"id": "2", "lat": 11.016844, "lng": 76.955833}
  ];

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
          "Cancelled Requests",
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
          Expanded(
            child: ListView.builder(
              itemCount: json.workOrder.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                final data = json.serviceRequests[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    // height: displayHeight(context) * 0.38,
                    width: displayWidth(context) * 0.80,
                    decoration: commonShadow,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, left: 8.0, bottom: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(data['RequestNo'], style: cardTitle),
                                Container(
                                  width: 84,
                                  height: 24,
                                  decoration: const BoxDecoration(
                                    color: cardStatus,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        bottomLeft: Radius.circular(5)),
                                  ),
                                  child: Center(
                                      child: Text(
                                    data['status'],
                                    style: statusCard,
                                  )),
                                ),
                              ]),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, right: 8.0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Text('Service Name',
                                          style: cardHeader)),
                                  Expanded(
                                    flex: 1,
                                    child: Text(': ${data['ServiceName']}',
                                        style: cardBody),
                                  )
                                ]),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 4.0, right: 8.0),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text('Your Exceeded Date & Time',
                                        style: cardHeader),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                        ': ${data['YourExceededDate&Time']}',
                                        style: cardBody),
                                  )
                                ]),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 4.0, right: 8.0),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Text('Priority Level',
                                          style: cardHeader)),
                                  Expanded(
                                    flex: 1,
                                    child: Text(': ${data['PriorityLevel']}',
                                        style: cardBody),
                                  )
                                ]),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 4.0, right: 8.0),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Text('Target Time',
                                          style: cardHeader)),
                                  Expanded(
                                    flex: 1,
                                    child: Text(': ${data['TargetTime']}',
                                        style: cardBody),
                                  )
                                ]),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 4.0, right: 8.0),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Text('Callout Fee',
                                          style: cardHeader)),
                                  Expanded(
                                    flex: 1,
                                    child: Text(': ${data['callOutFee']}',
                                        style: cardBody),
                                  )
                                ]),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 4.0, right: 8.0),
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
                                    child: Text(': ${data['CustomerName']}',
                                        style: cardBody),
                                  )
                                ]),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 4.0, right: 8.0),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Text('Customer Mobile',
                                          style: cardHeader)),
                                  Expanded(
                                    flex: 1,
                                    child: Text(': ${data['CustomerMobile']}',
                                        style: cardBody),
                                  )
                                ]),
                          ),
                          const DividerWidget(),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, bottom: 8.0, right: 8.0),
                            child: InkWell(
                              onTap: () {
                                bottomSheet2(context);
                              },
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.place,
                                            color: secondaryColor),
                                        const SizedBox(width: 15),
                                        Text('View on map', style: mapBtn),
                                      ],
                                    ),
                                    const Icon(Icons.arrow_forward_ios_rounded,
                                        color: secondaryColor)
                                  ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
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

  Future bottomSheet2(context) {
    final data = json.serviceRequests[0];
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0)),
                    child: SizedBox(
                      height: displayHeight(context) * 0.2,
                      child: map(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.timer,
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                            "Expected by 05-04-2023 (5:00PM to 8:00 PM)",
                            style: cardHeader,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('Request No: ${data['RequestNo']}',
                        style: cardTitle),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, top: 8.0, right: 8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Text('Service Name', style: cardHeader)),
                          Expanded(
                            flex: 1,
                            child: Text(': ${data['ServiceName']}',
                                style: cardBody),
                          )
                        ]),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, top: 4.0, right: 8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text('Main Service', style: cardHeader),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(': ${data['YourExceededDate&Time']}',
                                style: cardBody),
                          )
                        ]),
                  ),
                  const DividerWidget(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('Customer Details', style: cardTitle),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, top: 4.0, right: 8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Text('Customer Name', style: cardHeader)),
                          Expanded(
                            flex: 1,
                            child: Text(': ${data['CustomerName']}',
                                style: cardBody),
                          )
                        ]),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, top: 4.0, right: 8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Text('Customer Contact No.',
                                  style: cardHeader)),
                          Expanded(
                            flex: 1,
                            child: Text(': ${data['CustomerMobile']}',
                                style: cardBody),
                          )
                        ]),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, top: 4.0, right: 8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              flex: 1,
                              child:
                                  Text('Customer Location', style: cardHeader)),
                          Expanded(
                            flex: 1,
                            child: Text(': ${data['CustomerMobile']}',
                                style: cardBody),
                          )
                        ]),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, top: 4.0, right: 8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              flex: 1, child: Text('Floor', style: cardHeader)),
                          Expanded(
                            flex: 1,
                            child: Text(': ${data['CustomerMobile']}',
                                style: cardBody),
                          )
                        ]),
                  ),
                  const DividerWidget(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('Customer Requirements', style: cardTitle),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, top: 4.0, right: 8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Text('Description', style: cardHeader)),
                          Expanded(
                            flex: 1,
                            child: Text(': ${data['CustomerName']}',
                                style: cardBody),
                          )
                        ]),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, top: 4.0, right: 8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Text('Installation', style: cardHeader)),
                          Expanded(
                            flex: 1,
                            child: Text(': ${data['CustomerMobile']}',
                                style: cardBody),
                          )
                        ]),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, top: 4.0, right: 8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Text('Cleaning', style: cardHeader)),
                          Expanded(
                            flex: 1,
                            child: Text(': ${data['CustomerMobile']}',
                                style: cardBody),
                          )
                        ]),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, top: 4.0, right: 8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Text('Servicing', style: cardHeader)),
                          Expanded(
                            flex: 1,
                            child: Text(': ${data['CustomerMobile']}',
                                style: cardBody),
                          )
                        ]),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, top: 4.0, right: 8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Text('Repair', style: cardHeader)),
                          Expanded(
                            flex: 1,
                            child: Text(': ${data['CustomerMobile']}',
                                style: cardBody),
                          )
                        ]),
                  ),
                  const DividerWidget(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('Billing', style: cardTitle),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, top: 4.0, right: 8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Text('Callout Fee', style: cardHeader)),
                          Expanded(
                            flex: 1,
                            child: Text(': ${data['CustomerName']}',
                                style: cardBody),
                          )
                        ]),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, top: 4.0, right: 8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Text('Estimated Bill', style: cardHeader)),
                          Expanded(
                            flex: 1,
                            child: Text(': ${data['CustomerMobile']}',
                                style: cardBody),
                          )
                        ]),
                  ),
                ],
              ),
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
}
