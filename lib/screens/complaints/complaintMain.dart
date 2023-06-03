import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import '../../services/json.dart';
import 'package:get/get.dart';
import '../../styles/CommonSize.dart';
import '../../styles/CommonTextStyle.dart';
import '../../styles/common Color.dart';
import '../../widgets/divider.dart';
import 'beforeImage.dart';

class ComplaintMain extends StatefulWidget {
  const ComplaintMain({Key? key}) : super(key: key);

  @override
  State<ComplaintMain> createState() => _ComplaintMainState();
}

class _ComplaintMainState extends State<ComplaintMain> {
  final Json _json = Get.find<Json>();

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
            "Complaints",
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
          // height: displayHeight(context) * 0.77,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: _json.serviceRequests.length,
              itemBuilder: (BuildContext context, int index) {
                final data = _json.serviceRequests[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      bottomSheet(context, newBottomSheetButton());
                    },
                    child: Container(
                      // height: displayHeight(context) * 0.22,
                      width: displayWidth(context) * 0.80,
                      decoration: commonShadow,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 8.0, bottom: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Complain Code :${data['RequestNo']}',
                                style: cardTitle),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, right: 8.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Text('Contract ID',
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
                                      child: Text('Date', style: cardHeader),
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
                                        child: Text('Fee', style: cardHeader)),
                                    Expanded(
                                      flex: 1,
                                      child: Text(': ${data['PriorityLevel']}',
                                          style: cardBody),
                                    )
                                  ]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        )
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

  Future bottomSheet(context, Widget btn) {
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
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    // height: displayHeight(context) * 0.40,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('General Information', style: cardTitle),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, right: 8.0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Text('Complain Code',
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
                                    child: Text('Complain Date',
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
                                      child: Text('Complain Time',
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
                                      child:
                                          Text('Priority', style: cardHeader)),
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
                                      child: Text('Fee', style: cardHeader)),
                                  Expanded(
                                    flex: 1,
                                    child: Text(': ${data['callOutFee']}',
                                        style: cardBody),
                                  )
                                ]),
                          ),
                          const DividerWidget(),
                          Text('Complaint Description', style: cardTitle),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 4.0, right: 8.0),
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
                                      child: Text('Job', style: cardHeader)),
                                  Expanded(
                                    flex: 1,
                                    child: Text(': ${data['CustomerMobile']}',
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
                                      child: Text('Short Description',
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
                                      child: Text('Long Description',
                                          style: cardHeader)),
                                  Expanded(
                                    flex: 1,
                                    child: Text(': ${data['CustomerMobile']}',
                                        style: cardBody),
                                  )
                                ]),
                          ),
                          const DividerWidget(),
                          Text('Customer Details', style: cardTitle),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 4.0, right: 8.0),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Text('Name', style: cardHeader)),
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
                                      child: Text('Email', style: cardHeader)),
                                  Expanded(
                                    flex: 1,
                                    child: Text(': ${data['CustomerMobile']}',
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
                                      child: Text('Phone', style: cardHeader)),
                                  Expanded(
                                    flex: 1,
                                    child: Text(': ${data['CustomerName']}',
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
                                historyDialog();
                              },
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.history_rounded,
                                            color: secondaryColor),
                                        const SizedBox(width: 15),
                                        Text('History', style: mapBtn),
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
                  Align(alignment: Alignment.bottomCenter, child: btn),
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

  Widget newBottomSheetButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            minimumSize: const Size(170, 55),
            primary: primaryColor,
          ),
          onPressed: () => Navigator.pop(context),
          label: const Text('Reject', style: btnStyle),
          icon: const Icon(
            Icons.clear,
            color: secondaryColor,
          ),
        ),
        GradientButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
          increaseWidthBy: 55,
          increaseHeightBy: 13,
          callback: () => Navigator.pop(context),
          gradient: primaryGradient,
          shadowColor: Gradients.backToFuture.colors.last.withOpacity(0.25),
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
    );
  }

  Widget acceptBottomSheetButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        complaintDialog();
      },
      child: Container(
        width: double.infinity,
        height: 52,
        decoration: BoxDecoration(gradient: primaryGradient),
        child: Center(
          child: Text("Start", style: bottomFixedBtn),
        ),
      ),
    );
  }

  Future historyDialog() {
    final data = _json.serviceRequests[0];
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
                    height: displayHeight(context) * 0.5,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, left: 15.0, right: 8.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('History - OT100170-01',
                                style: btnStyle),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, right: 8.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Text('Request ID',
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
                                      child:
                                          Text('Service ID', style: cardHeader),
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
                                        child: Text('Contract ID',
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
                                        child: Text('Technician Name',
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
                                        child: Text('Contract Value',
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
                                  const EdgeInsets.only(top: 8.0, right: 8.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Text('Job Completed Date',
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
                                      child: Text(
                                          'Days from job completed date',
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
                                        child: Text('Remaining Days',
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
                                        child: Text(
                                            'Is the service eligible for free service',
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
                                        child: Text('Help Calls Eligible',
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
                                        child: Text('Balance available',
                                            style: cardHeader)),
                                    Expanded(
                                      flex: 1,
                                      child: Text(': ${data['callOutFee']}',
                                          style: cardBody),
                                    )
                                  ]),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                style: const ButtonStyle(
                                  overlayColor: MaterialStatePropertyAll(
                                      Colors.transparent),
                                ),
                                onPressed: () async {
                                  Navigator.of(ctx).pop();
                                },
                                child: Text("Close", style: gradientText),
                              ),
                            ),
                          ]),
                    )),
              ),
            ));
  }

  Future complaintDialog() {
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
            height: 180,
            width: displayWidth(context) * 0.08,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child:
                      Text("Time Tracking - Help Request", style: gradientText),
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
                          Get.to(const BeforeImage());
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
          // height: displayHeight(context) * 0.77,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: _json.serviceRequests.length,
              itemBuilder: (BuildContext context, int index) {
                final data = _json.serviceRequests[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      bottomSheet(context, acceptBottomSheetButton());
                    },
                    child: Container(
                      // height: displayHeight(context) * 0.22,
                      width: displayWidth(context) * 0.80,
                      decoration: commonShadow,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 8.0, bottom: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Complain Code :${data['RequestNo']}',
                                style: cardTitle),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, right: 8.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Text('Contract ID',
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
                                      child: Text('Date', style: cardHeader),
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
                                        child: Text('Fee', style: cardHeader)),
                                    Expanded(
                                      flex: 1,
                                      child: Text(': ${data['PriorityLevel']}',
                                          style: cardBody),
                                    )
                                  ]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }

  Widget tab3() {
    return Center(child: Text('No record found!', style: gradientText));
  }
}
