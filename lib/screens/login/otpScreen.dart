import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pinput/pinput.dart';
import '../../services/branding.dart';
import '../../services/verifyOtp.dart';
import '../../styles/CommonTextStyle.dart';
import '../../styles/common Color.dart';
import 'changePassword.dart';
import 'package:get/get.dart';

class OtpScreen extends StatefulWidget {
  String? email;
  OtpScreen({Key? key, this.email}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final BrandingControl _brandingControl = Get.find<BrandingControl>();
  final OTPController _otpController = Get.find<OTPController>();
  final focusNode = FocusNode();
  String? otp;
  final _formKey = GlobalKey<FormState>();
  final controller = TextEditingController();
  List<dynamic> brandingData = [];

  @override
  void initState() {
    super.initState();
    brandingFunc();
  }

  Future<void> brandingFunc() async {
    final response = _brandingControl.brandingData;
    setState(() {
      brandingData = response;
    });
  }

  Future<void> opt() async {
    final response = await _otpController.otpApi(context, widget.email, otp);
    if (response.statusCode == 200) {
      changePass();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  Future<void> changePass() async {
    Navigator.push(
        context,
        PageTransition(
            ctx: context,
            inheritTheme: true,
            type: PageTransitionType.fade,
            child: const ChangePassword()));
  }

  @override
  Widget build(BuildContext context) {
    return mobile();
  }

  Widget mobile() {
    return SafeArea(
      child: Scaffold(
          body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: primaryColor,
          image: DecorationImage(
            image: AssetImage("assets/images/loginBackground.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(Icons.arrow_back,
                      color: primaryColor, size: 32),
                ),
              ),
              SizedBox(
                height: 160,
                child: Center(
                  child: CircleAvatar(
                      backgroundColor: primaryColor,
                      radius: 60,
                      child: Image.asset(
                        width: 80,
                        'assets/images/otp.png',
                        fit: BoxFit.fill,
                      )),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
                child: Text('2.Enter OTP', style: headerStyle),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
                child: Text(
                    'Please enter the 4 digit code sent to your email address.',
                    style: secondaryHeader),
              ),
              Center(child: otpField(Colors.white)),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, right: 10.0),
                child: verifyBtn(130, 25.0),
              ),
            ],
          ),
        ),
      )),
    );
  }

  Widget otpField(Color color) {
    const length = 4;
    final defaultPinTheme = PinTheme(
      width: 50,
      height: 55,
      margin: const EdgeInsets.all(3.0),
      textStyle: GoogleFonts.poppins(
        fontSize: 22,
        color: const Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(63, 91, 220, 0.66),
            blurRadius: 6.0,
            spreadRadius: 0.2,
            offset: Offset(
              3.0,
              5.0,
            ),
          )
        ],
        color: color,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.transparent),
      ),
    );
    return Form(
      key: _formKey,
      child: Pinput(
        length: length,
        controller: controller,
        focusNode: focusNode,
        defaultPinTheme: defaultPinTheme,
        onCompleted: (pin) {
          setState(() => otp = pin);
        },
        focusedPinTheme: defaultPinTheme.copyWith(
          height: 68,
          width: 64,
          decoration: defaultPinTheme.decoration!.copyWith(
            border: Border.all(color: secondaryColor),
          ),
        ),
        errorPinTheme: defaultPinTheme.copyWith(
          decoration: BoxDecoration(
            color: red,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  Widget verifyBtn(double width, double radius) {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(width, 45),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          primary: primaryColor,
        ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            opt();
          }
        },
        child: const Text("Verify OTP", style: btnStyle),
      ),
    );
  }
}
