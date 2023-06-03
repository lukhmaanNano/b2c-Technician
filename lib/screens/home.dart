import 'dart:convert';
import 'package:b2ctechnician/screens/serviceRequest/serviceRequestMain.dart';
import 'package:b2ctechnician/screens/workorder/workorderMain.dart';
import 'package:b2ctechnician/styles/common%20Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import '../services/logOut.dart';
import '../styles/CommonSize.dart';
import '../styles/CommonTextStyle.dart';
import 'cancelRequest/cancelRequestMain.dart';
import 'complaints/complaintMain.dart';
import 'drawerScreens/dashboard.dart';
import 'drawerScreens/feedBack.dart';
import 'drawerScreens/schedule.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final LogoutControl logOutControl = Get.find<LogoutControl>();
  String? userName;
  List button = [
    {'icon': Icons.home_rounded, 'name': 'Home', 'id': 1},
    {'icon': Icons.grid_view_rounded, 'name': 'Dashboard', 'id': 2},
    {'icon': Icons.event_available_rounded, 'name': 'Schedule', 'id': 3},
    {'icon': Icons.article_rounded, 'name': 'Requests', 'id': 4},
    {'icon': Icons.work_rounded, 'name': 'Work Order', 'id': 5},
    {'icon': Icons.help, 'name': 'Help Requests', 'id': 6},
    {'icon': Icons.stars, 'name': 'Feedback', 'id': 7},
    {'icon': Icons.block, 'name': 'Cancelled Requests', 'id': 8},
  ];

  @override
  void initState() {
    super.initState();
    local();
  }

  void local() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('UserName')!;
    });
  }

  drawerRouting(int? value) {
    switch (value) {
      case 1:
        {
          return Get.to(const Home());
        }
      case 2:
        {
          return Get.to(const Dashboard());
        }
      case 3:
        {
          return Get.to(const Schedule());
        }
      case 4:
        {
          return Get.to(const ServiceRequestMain());
        }
      case 5:
        {
          return Get.to(const WorkOrderMain());
        }
      case 6:
        {
          return Get.to(const ComplaintMain());
        }
      case 7:
        {
          return Get.to(const FeedBack());
        }
      case 8:
        {
          return Get.to(const CancelRequestMain());
        }
      default:
        {
          return false;
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    String name = utf8.decode(base64.decode(userName!));
    return Scaffold(
        key: _key,
        backgroundColor: Colors.grey.shade100,
        drawer: Drawer(
          backgroundColor: primaryColor,
          width: displayWidth(context) * 0.70,
          child: Column(
            children: [
              const SizedBox(height: 60),
              CircleAvatar(
                radius: 45,
                child: Image.asset('assets/images/man.jpg', fit: BoxFit.cover),
              ),
              Text(
                name,
                style: nameStyle,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: button.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return ListTile(
                        onTap: () {
                          Navigator.pop(context);
                          drawerRouting(button[index]['id']);
                        },
                        leading: Icon(button[index]['icon'], color: iconColor),
                        title:
                            Text(button[index]['name'], style: sideMenuStyle));
                  }),
              SizedBox(height: displayHeight(context) * 0.05),
              GradientButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                increaseWidthBy: 45,
                increaseHeightBy: 13,
                callback: () {
                  logOutControl.logOut(context);
                },
                gradient: primaryGradient,
                shadowColor:
                    Gradients.backToFuture.colors.last.withOpacity(0.25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Logout'),
                    SizedBox(width: 10),
                    Icon(Icons.logout)
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Text('A Smart FM Product', style: versionStyle),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: displayHeight(context) * 0.25,
              child: Stack(clipBehavior: Clip.none, children: [
                Container(
                  height: displayHeight(context) * 0.17,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    gradient: primaryGradient,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10.0, bottom: 10.0, top: 45.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                _key.currentState!.openDrawer();
                              },
                              child: const Icon(Icons.menu_rounded,
                                  color: primaryColor, size: 32),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: SizedBox(
                                height: double.infinity,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Hello',
                                      style: styledHeading,
                                    ),
                                    Text(
                                      name,
                                      style: commonRoboto,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: const Icon(Icons.notifications_rounded,
                                  color: primaryColor, size: 32),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: const DecorationImage(
                                    image: AssetImage("assets/images/man.jpg"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 95,
                  left: 20,
                  child: Container(
                    height: displayHeight(context) * 0.11,
                    width: displayWidth(context) * 0.88,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        color: primaryColor,
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(4, 7),
                            spreadRadius: -4,
                            blurRadius: 19,
                            color: Color.fromRGBO(220, 220, 220, 1),
                          ),
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              '209',
                              style: TextStyle(color: red, fontSize: 20),
                            ),
                            Text(
                              'Open',
                              style: cardValue,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              '78',
                              style: TextStyle(color: green, fontSize: 20),
                            ),
                            Text('Closed', style: cardValue),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              '22',
                              style: TextStyle(
                                  color: secondaryColor, fontSize: 20),
                            ),
                            Text('Cancelled', style: cardValue),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            ),
            Container(
              height: displayHeight(context) * 0.15,
              width: displayWidth(context) * 0.90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: primaryGradient,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Today | 29 April2023', style: styledHeading),
                        Text('Your Work', style: commonRoboto),
                        Text('Progress', style: commonRoboto),
                      ],
                    ),
                  ),
                  SimpleCircularProgressBar(
                    valueNotifier: ValueNotifier<double>(50.5),
                    size: 70,
                    progressStrokeWidth: 10,
                    backStrokeWidth: 8,
                    backColor: primaryColor,
                    mergeMode: true,
                    fullProgressColor: Colors.green,
                    progressColors: const [green],
                    onGetText: (double value) {
                      return Text(
                        '${value.toInt()}%',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 19.0, top: 10.0),
                  child: Text('Modules', style: menuStyle),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () => Get.to(const ServiceRequestMain()),
                          child: Container(
                              height: displayHeight(context) * 0.18,
                              width: displayWidth(context) * 0.43,
                              decoration: commonShadow,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text('Service Request',
                                          style: textInputHeader),
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text('31', style: count),
                                          Image.asset(
                                              height: 60,
                                              width: 75,
                                              'assets/images/notes.png')
                                        ]),
                                  ])),
                        ),
                        InkWell(
                          onTap: () => Get.to(const WorkOrderMain()),
                          child: Container(
                              height: displayHeight(context) * 0.18,
                              width: displayWidth(context) * 0.43,
                              decoration: commonShadow,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text('Work Order',
                                          style: textInputHeader),
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text('16', style: count),
                                          Image.asset(
                                              height: 60,
                                              width: 75,
                                              'assets/images/suitcase.png')
                                        ]),
                                  ])),
                        ),
                      ])
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () => Get.to(const ComplaintMain()),
                          child: Container(
                              height: displayHeight(context) * 0.18,
                              width: displayWidth(context) * 0.43,
                              decoration: commonShadow,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text('Help Request',
                                          style: textInputHeader),
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text('25', style: count),
                                          Image.asset(
                                              height: 60,
                                              width: 75,
                                              'assets/images/file.png')
                                        ]),
                                  ])),
                        ),
                        InkWell(
                          onTap: () => Get.to(const CancelRequestMain()),
                          child: Container(
                              height: displayHeight(context) * 0.18,
                              width: displayWidth(context) * 0.43,
                              decoration: commonShadow,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text('Cancelled Request',
                                          style: textInputHeader),
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text('16', style: count),
                                          Image.asset(
                                              height: 60,
                                              width: 75,
                                              'assets/images/error.png')
                                        ]),
                                  ])),
                        ),
                      ])
                ],
              ),
            )
          ],
        ));
  }
}
