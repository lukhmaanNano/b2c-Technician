import 'package:b2ctechnician/styles/CommonSize.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../styles/CommonTextStyle.dart';
import '../../styles/common Color.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DateTime? selectedDate, selectedStartDate;

  @override
  void initState() {
    super.initState();
    selectedStartDate = DateTime.now();
    selectedDate = DateTime.now();
  }

  Future<void> startDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xff5fa8d3),
              onPrimary: Colors.white,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Color(0xff5fa8d3),
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedStartDate) {
      setState(() {
        selectedStartDate = picked;
      });
    }
  }

  Future<void> datePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xff5fa8d3),
              onPrimary: Colors.white,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Color(0xff5fa8d3),
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat("dd-MM-yyyy");
    final formattedStartDate = dateFormat.format(selectedStartDate!);
    final formattedEndDate = dateFormat.format(selectedDate!);
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
          "Dashboard",
          style: appBar,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: double.infinity,
              height: displayHeight(context) * 0.25,
              decoration: commonShadow,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Start Date",
                              style: dashboardCardTitle,
                            ),
                            InkWell(
                              onTap: () {
                                startDatePicker(context);
                              },
                              child: SizedBox(
                                height: displayHeight(context) * 0.08,
                                width: displayWidth(context) * 0.37,
                                child: Card(
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          formattedStartDate,
                                          style: dashboardTimeCard,
                                        ),
                                        const Icon(
                                          Icons.edit_calendar,
                                          color: secondaryColor,
                                        )
                                      ],
                                    ),
                                  )),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "End Date",
                              style: dashboardCardTitle,
                            ),
                            InkWell(
                              onTap: () {
                                datePicker(context);
                              },
                              child: SizedBox(
                                height: displayHeight(context) * 0.08,
                                width: displayWidth(context) * 0.37,
                                child: Card(
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          formattedEndDate,
                                          style: dashboardTimeCard,
                                        ),
                                        const Icon(
                                          Icons.edit_calendar,
                                          color: secondaryColor,
                                        )
                                      ],
                                    ),
                                  )),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      height: displayHeight(context) * 0.06,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: primaryGradient,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                              child: Text(
                            "Submit",
                            style: gradientText,
                          )),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: displayHeight(context) * 0.13,
                  width: displayWidth(context) * 0.44,
                  decoration: BoxDecoration(
                    gradient: primaryGradient,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: SizedBox(
                                height: displayHeight(context) * 0.05,
                                child: Image.asset(
                                  "assets/images/inbox.png",
                                  fit: BoxFit.cover,
                                )),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "05",
                              style: dashboardCount,
                            ),
                            Text(
                              "Received Jobs",
                              style: dashboardText,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: displayHeight(context) * 0.13,
                  width: displayWidth(context) * 0.44,
                  decoration: BoxDecoration(
                    gradient: primaryGradient,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: SizedBox(
                                height: displayHeight(context) * 0.05,
                                child: Image.asset(
                                  "assets/images/verify.png",
                                  fit: BoxFit.cover,
                                )),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "03",
                              style: dashboardCount,
                            ),
                            Text(
                              "Accepted Jobs",
                              style: dashboardText,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: displayHeight(context) * 0.13,
                  width: displayWidth(context) * 0.44,
                  decoration: BoxDecoration(
                    gradient: primaryGradient,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: SizedBox(
                                height: displayHeight(context) * 0.05,
                                child: Image.asset(
                                  "assets/images/sand.png",
                                  fit: BoxFit.cover,
                                )),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "02",
                              style: dashboardCount,
                            ),
                            Text(
                              "Pending Jobs",
                              style: dashboardText,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: displayHeight(context) * 0.13,
                  width: displayWidth(context) * 0.44,
                  decoration: BoxDecoration(
                    gradient: primaryGradient,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: SizedBox(
                                height: displayHeight(context) * 0.05,
                                child: Image.asset(
                                  "assets/images/block.png",
                                  fit: BoxFit.cover,
                                )),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "01",
                              style: dashboardCount,
                            ),
                            Text(
                              "Denied Jobs",
                              style: dashboardText,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: displayHeight(context) * 0.13,
                  width: displayWidth(context) * 0.44,
                  decoration: BoxDecoration(
                    gradient: primaryGradient,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: SizedBox(
                                height: displayHeight(context) * 0.05,
                                child: Image.asset(
                                  "assets/images/cross.png",
                                  fit: BoxFit.cover,
                                )),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "07",
                              style: dashboardCount,
                            ),
                            Text(
                              "Rejected Jobs",
                              style: dashboardText,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: displayHeight(context) * 0.13,
                  width: displayWidth(context) * 0.44,
                  decoration: BoxDecoration(
                    gradient: primaryGradient,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: SizedBox(
                                height: displayHeight(context) * 0.05,
                                child: Image.asset(
                                  "assets/images/tick.png",
                                  fit: BoxFit.cover,
                                )),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "06",
                              style: dashboardCount,
                            ),
                            Text(
                              "Confirmed Jobs",
                              style: dashboardText,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: double.infinity,
              height: displayHeight(context) * 0.13,
              decoration: BoxDecoration(
                gradient: primaryGradient,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: SizedBox(
                            height: displayHeight(context) * 0.05,
                            child: Image.asset('assets/images/usd.png')),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$63466',
                          style: dashboardCount,
                        ),
                        Text(
                          "Collected Amount",
                          style: dashboardText,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
