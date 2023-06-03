import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import '../../services/json.dart';
import '../../styles/CommonSize.dart';
import '../../styles/CommonTextStyle.dart';
import '../../styles/common Color.dart';

class WorkOrderPayment extends StatefulWidget {
  const WorkOrderPayment({Key? key}) : super(key: key);

  @override
  State<WorkOrderPayment> createState() => _WorkOrderPaymentState();
}

enum PaymentType { cash, online }

class _WorkOrderPaymentState extends State<WorkOrderPayment> {
  PaymentType? _paymentType = PaymentType.cash;

  bool isClicked = true;

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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Container(
                          height: displayHeight(context) * 0.1,
                          width: double.infinity,
                          decoration: commonShadow,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, left: 8.0, bottom: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Payment Type', style: cardTitle),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14.0),
                        child: Container(
                          height: displayHeight(context) * 0.1,
                          width: double.infinity,
                          decoration: commonShadow,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Cash',
                                  style: cardHeader,
                                ),
                                Radio<PaymentType>(
                                    value: PaymentType.cash,
                                    groupValue: _paymentType,
                                    onChanged: (PaymentType? value) {
                                      setState(() {
                                        _paymentType = value;
                                      });
                                    })
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14.0, vertical: 14.0),
                        child: Container(
                          height: displayHeight(context) * 0.15,
                          width: double.infinity,
                          decoration: commonShadow,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Total Amount Payable',
                                      style: cardHeader,
                                    ),
                                    Card(
                                      child: SizedBox(
                                        height: displayHeight(context) * 0.04,
                                        width: displayWidth(context) * 0.25,
                                        child: const Center(
                                          child: Text('17.00'),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Enter Amount',
                                      style: cardHeader,
                                    ),
                                    Card(
                                      child: SizedBox(
                                        height: displayHeight(context) * 0.04,
                                        width: displayWidth(context) * 0.25,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 22.0, bottom: 8.0),
                                          child: TextFormField(
                                            keyboardType: const TextInputType
                                                    .numberWithOptions(
                                                decimal: true),
                                            inputFormatters: <
                                                TextInputFormatter>[
                                              FilteringTextInputFormatter.allow(
                                                  RegExp(
                                                      r'[0-9]+[,.]{0,1}[0-9]*')),
                                              TextInputFormatter.withFunction(
                                                (oldValue, newValue) =>
                                                    newValue.copyWith(
                                                  text: newValue.text
                                                      .replaceAll(',', '.'),
                                                ),
                                              ),
                                            ],
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              // hintText: "Enter Amount",
                                            ),
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
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14.0),
                        child: Container(
                          height: displayHeight(context) * 0.1,
                          width: double.infinity,
                          decoration: commonShadow,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Online',
                                  style: cardHeader,
                                ),
                                Radio<PaymentType>(
                                    activeColor: secondaryColor,
                                    value: PaymentType.online,
                                    groupValue: _paymentType,
                                    onChanged: (value) {
                                      setState(() {
                                        _paymentType = value;
                                      });
                                    })
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: GradientButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  increaseWidthBy: double.infinity,
                  increaseHeightBy: 13,
                  callback: () {
                    Get.to(const WorkOrderPayment());
                  },
                  gradient: primaryGradient,
                  shadowColor:
                      Gradients.backToFuture.colors.last.withOpacity(0.25),
                  child: const Text('Get Approval'),
                ),
              ),
            ]));
  }
}
