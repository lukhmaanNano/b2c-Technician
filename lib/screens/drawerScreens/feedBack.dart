import 'package:b2ctechnician/styles/CommonSize.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import '../../services/json.dart';
import '../../styles/CommonTextStyle.dart';
import '../../styles/common Color.dart';

class FeedBack extends StatefulWidget {
  const FeedBack({Key? key}) : super(key: key);

  @override
  State<FeedBack> createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  final Json _json = Get.find<Json>();

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
            "Feedback",
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
            SizedBox(
              height: displayHeight(context) * 0.77,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _json.serviceRequests.length,
                  itemBuilder: (BuildContext context, int index) {
                    final data = _json.serviceRequests[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          bottomSheet(context);
                        },
                        child: Container(
                          height: displayHeight(context) * 0.22,
                          width: displayWidth(context) * 0.80,
                          decoration: commonShadow,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, left: 8.0, bottom: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('WO No. ${data['RequestNo']}',
                                    style: cardTitle),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, right: 8.0),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text('Service Name',
                                                style: cardHeader)),
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                              ': ${data['ServiceName']}',
                                              style: cardBody),
                                        )
                                      ]),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 4.0, right: 8.0),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Text('Service Status',
                                              style: cardHeader),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                              ': ${data['PriorityLevel']}',
                                              style: cardBody),
                                        )
                                      ]),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 4.0, right: 8.0),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text('Feedback Status',
                                                style: cardHeader)),
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                              ': ${data['PriorityLevel']}',
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
        ));
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

  Future bottomSheet(context) {
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0)),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 14.0, horizontal: 10.0),
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
                                    "Your Feedback is valuable for us",
                                    style: gradientText,
                                  )),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 14.0),
                            child: Container(
                                decoration: commonShadow,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('WO No. OT100089-01',
                                          style: cardTitle),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, right: 8.0),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                      'Service Contract No.',
                                                      style: cardHeader)),
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                    ': ${data['ServiceName']}',
                                                    style: cardBody),
                                              )
                                            ]),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 4.0, right: 8.0),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                    'Service Requested Date',
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
                                    ],
                                  ),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 14.0),
                            child: Container(
                                width: double.infinity,
                                decoration: commonShadow,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('How would you rate our Service ?',
                                          style: cardTitle),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 10.0,
                                        ),
                                        child:
                                            Text('Ratings', style: cardTitle),
                                      ),
                                      RatingBar.builder(
                                        initialRating: 3,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        glowColor: Colors.yellow.shade300,
                                        itemPadding: const EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        itemBuilder: (context, _) => const Icon(
                                          Icons.star_rounded,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 10.0,
                                        ),
                                        child: Text(
                                            'Your comments here ( Optional )',
                                            style: cardTitle),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 12.0),
                                        child: SizedBox(
                                          height: displayHeight(context) * 0.15,
                                          child: Card(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: TextFormField(
                                                maxLines: 5,
                                                minLines: 1,
                                                decoration: const InputDecoration(
                                                    hintText:
                                                        "Write your Comments",
                                                    border: InputBorder.none),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 52,
                      decoration: BoxDecoration(gradient: primaryGradient),
                      child: Center(
                        child: Text("Submit", style: bottomFixedBtn),
                      ),
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
}
