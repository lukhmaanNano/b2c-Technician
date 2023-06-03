import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../styles/CommonSize.dart';
import '../../styles/CommonTextStyle.dart';
import '../../styles/common Color.dart';
import '../../widgets/divider.dart';

class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  DateTime? selectedStartDate;

  @override
  void initState() {
    super.initState();
    selectedStartDate = DateTime.now();
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

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat("dd-MM-yyyy");
    final formattedDate = dateFormat.format(selectedStartDate!);
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
          "Schedules",
          style: appBar,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              // height: displayHeight(context) * 0.25,
              decoration: commonShadow,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 12.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Select Date",
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
                                      formattedDate,
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
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      child: DividerWidget(),
                    ),
                    ToggleSwitch(
                      minHeight: displayHeight(context) * 0.06,
                      minWidth: displayWidth(context) * 0.27,
                      labels: const [
                        'Day',
                        'Week',
                        'Month',
                      ],
                      cornerRadius: 12,
                      inactiveBgColor: Colors.white,
                      inactiveFgColor: Colors.black,
                      borderWidth: 1,
                      borderColor: [Colors.grey.shade300],
                      activeBgColors: const [
                        [
                          Color(0xff456FE8),
                          Color(0xff19B0EC),
                        ],
                        [
                          Color(0xff456FE8),
                          Color(0xff19B0EC),
                        ],
                        [
                          Color(0xff456FE8),
                          Color(0xff19B0EC),
                        ]
                      ],
                      onToggle: (index) {
                        print('switched to: $index');
                      },
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Container(
                height: displayHeight(context) * 0.07,
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
                      formattedDate,
                      style: gradientText,
                    )),
                  ),
                ),
              ),
            ),
            DefaultTabController(
              length: 2,
              child: Container(
                // height: displayHeight(context) * 0.5,
                width: double.infinity,
                decoration: commonShadow,
                child: Column(
                  children: [
                    TabBar(
                        indicatorWeight: 4,
                        dividerColor: Colors.grey.shade300,
                        indicatorColor: secondaryColor,
                        tabs: [
                          Tab(
                            child: Text(
                              "Site Survey (0)",
                              style: gradientTextTab,
                            ),
                          ),
                          Tab(
                              child: Text(
                            "Work Order(0)",
                            style: gradientTextTab,
                          ))
                        ]),
                    SizedBox(
                      height: displayHeight(context) * 0.4,
                      child: TabBarView(children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.folder_off,
                              size: 150,
                              color: Colors.grey.shade100,
                            ),
                            Text('No record found!', style: gradientText)
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.folder_off,
                              size: 150,
                              color: Colors.grey.shade100,
                            ),
                            Text('No record found!', style: gradientText)
                          ],
                        ),
                      ]),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
