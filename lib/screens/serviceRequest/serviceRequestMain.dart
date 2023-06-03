import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:b2ctechnician/screens/serviceRequest/serviceRequestDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import '../../services/json.dart';
import '../../styles/CommonSize.dart';
import '../../styles/CommonTextStyle.dart';
import '../../styles/common Color.dart';
import 'package:get/get.dart';
import '../../widgets/divider.dart';

class ServiceRequestMain extends StatefulWidget {
  const ServiceRequestMain({Key? key}) : super(key: key);

  @override
  State<ServiceRequestMain> createState() => _ServiceRequestMainState();
}

class _ServiceRequestMainState extends State<ServiceRequestMain> {
  final Json _json = Get.find<Json>();
  final Completer<GoogleMapController> _controller = Completer();
  List data = [
    {"id": "1", "lat": 11.0022371, "lng": 76.9527723},
    {"id": "2", "lat": 11.016844, "lng": 76.955833}
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
            "Service Request",
            style: appBar,
          ),
          bottom: const TabBar(
            indicatorColor: primaryColor,
            labelStyle: tab,
            unselectedLabelStyle: disableTab,
            tabs: [
              Tab(text: 'New (20)'),
              Tab(text: 'Accepted (12)'),
              Tab(text: 'Denied (08)'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            tab1(),
            tab2(),
            tab3(),
          ],
        ), // TabBarView
      ),
    );
  }

  Widget tab1() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 60,
          color: Colors.white,
          child: search(),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _json.serviceRequests.length,
            itemBuilder: (BuildContext context, int index) {
              final data = _json.serviceRequests[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // height: displayHeight(context) * 0.39,
                  width: displayWidth(context) * 0.80,
                  decoration: commonShadow,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, left: 8.0, bottom: 8.0),
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
                          padding: const EdgeInsets.only(top: 8.0, right: 8.0),
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
                          padding: const EdgeInsets.only(top: 4.0, right: 8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          padding: const EdgeInsets.only(top: 4.0, right: 8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          padding: const EdgeInsets.only(top: 4.0, right: 8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child:
                                        Text('Target Time', style: cardHeader)),
                                Expanded(
                                  flex: 1,
                                  child: Text(': ${data['TargetTime']}',
                                      style: cardBody),
                                )
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0, right: 8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child:
                                        Text('Callout Fee', style: cardHeader)),
                                Expanded(
                                  flex: 1,
                                  child: Text(': ${data['callOutFee']}',
                                      style: cardBody),
                                )
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0, right: 8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          padding: const EdgeInsets.only(top: 4.0, right: 8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              bottomSheet1(context);
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
                        const DividerWidget(),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  minimumSize: const Size(160, 40),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  primary: denyBtn,
                                ),
                                onPressed: () {},
                                label: Text('Deny', style: denyTxtBtn),
                                icon: const Icon(
                                  Icons.clear,
                                  color: denyTxt,
                                ),
                              ),
                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  minimumSize: const Size(160, 40),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  primary: acceptBtn,
                                ),
                                onPressed: () {},
                                label: Text('Accept', style: acceptTxtBtn),
                                icon: const Icon(
                                  Icons.done_rounded,
                                  color: green,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10)
      ],
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
    final data = _json.serviceRequests[0];
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
                              height: displayHeight(context) * 0.2,
                              width: double.infinity,
                              child: map()),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text('Request No: ${data['RequestNo']}',
                              style: cardTitle),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 10.0, right: 8.0),
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
                          padding: const EdgeInsets.only(
                              top: 4.0, left: 10.0, right: 8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 10.0, right: 8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 10.0, right: 8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child:
                                        Text('Target Time', style: cardHeader)),
                                Expanded(
                                  flex: 1,
                                  child: Text(': ${data['TargetTime']}',
                                      style: cardBody),
                                )
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 10.0, right: 8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child:
                                        Text('Callout Fee', style: cardHeader)),
                                Expanded(
                                  flex: 1,
                                  child: Text(': ${data['callOutFee']}',
                                      style: cardBody),
                                )
                              ]),
                        ),
                        const DividerWidget(),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text('Customer Details', style: cardTitle),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 10.0, right: 8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 10.0, right: 8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        minimumSize: const Size(170, 55),
                        primary: primaryColor,
                      ),
                      onPressed: () => Navigator.pop(context),
                      label: const Text('Deny', style: btnStyle),
                      icon: const Icon(
                        Icons.clear,
                        color: secondaryColor,
                      ),
                    ),
                    GradientButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      increaseWidthBy: 60,
                      increaseHeightBy: 13,
                      callback: () => Navigator.pop(context),
                      gradient: primaryGradient,
                      shadowColor:
                          Gradients.backToFuture.colors.last.withOpacity(0.25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.done_rounded),
                          SizedBox(width: 10),
                          Text('Accept')
                        ],
                      ),
                    ),
                  ],
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

  Widget tab2() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 60,
          color: Colors.white,
          child: search(),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _json.serviceRequests.length,
            itemBuilder: (BuildContext context, int index) {
              final data = _json.serviceRequests[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // height: displayHeight(context) * 0.36,
                  width: displayWidth(context) * 0.80,
                  decoration: commonShadow,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, left: 8.0, bottom: 8.0),
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
                          padding: const EdgeInsets.only(top: 8.0, right: 8.0),
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
                          padding: const EdgeInsets.only(top: 4.0, right: 8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          padding: const EdgeInsets.only(top: 4.0, right: 8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          padding: const EdgeInsets.only(top: 4.0, right: 8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child:
                                        Text('Target Time', style: cardHeader)),
                                Expanded(
                                  flex: 1,
                                  child: Text(': ${data['TargetTime']}',
                                      style: cardBody),
                                )
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0, right: 8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child:
                                        Text('Callout Fee', style: cardHeader)),
                                Expanded(
                                  flex: 1,
                                  child: Text(': ${data['callOutFee']}',
                                      style: cardBody),
                                )
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0, right: 8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          padding: const EdgeInsets.only(top: 4.0, right: 8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        ),
        const SizedBox(height: 10)
      ],
    );
  }

  Future bottomSheet2(context) {
    final data = _json.serviceRequests[0];
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
                              height: displayHeight(context) * 0.2,
                              width: double.infinity,
                              child: map()),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text('Request No: ${data['RequestNo']}',
                              style: cardTitle),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 10.0, right: 8.0),
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
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 10.0, right: 8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 10.0, right: 8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 10.0, right: 8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child:
                                        Text('Target Time', style: cardHeader)),
                                Expanded(
                                  flex: 1,
                                  child: Text(': ${data['TargetTime']}',
                                      style: cardBody),
                                )
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 10.0, right: 8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child:
                                        Text('Callout Fee', style: cardHeader)),
                                Expanded(
                                  flex: 1,
                                  child: Text(': ${data['callOutFee']}',
                                      style: cardBody),
                                )
                              ]),
                        ),
                        const DividerWidget(),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text('Customer Details', style: cardTitle),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 10.0, right: 8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 10.0, right: 8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      ],
                    ),
                  ),
                ),
                GradientButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  increaseWidthBy: double.infinity,
                  increaseHeightBy: 15,
                  callback: () {
                    Navigator.pop(context);
                    serviceDialog();
                  },
                  gradient: primaryGradient,
                  shadowColor:
                      Gradients.backToFuture.colors.last.withOpacity(0.25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.done_rounded),
                      SizedBox(width: 10),
                      Text('Process')
                    ],
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
            height: 170,
            width: displayWidth(context) * 0.08,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child:
                      Text("Time Tracking - Site Survey", style: gradientText),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 10.0),
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
                          Get.to(const ServiceRequestDetails());
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

  Widget tab3() {
    return Center(child: Text('No record found!', style: gradientText));
  }
}
