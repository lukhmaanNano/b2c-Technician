import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../../services/branding.dart';
import '../../services/emailService.dart';
import '../../styles/CommonTextStyle.dart';
import '../../styles/common Color.dart';
import 'otpScreen.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();
  final BrandingControl _brandingControl = Get.find<BrandingControl>();
  final EmailController _emailController = Get.find<EmailController>();
  final _formKey = GlobalKey<FormState>();
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

  Future<void> mail() async {
    final response =
        await _emailController.emailApi(context, emailController.text);

    print(response);
    if (response.statusCode == 200) {
      print(response);
      Navigator.push(
          context,
          PageTransition(
              ctx: context,
              inheritTheme: true,
              type: PageTransitionType.fade,
              child: OtpScreen(email: emailController.text)));
    }
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
                          'assets/images/forgot.png',
                          fit: BoxFit.fill,
                        )),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 16.0, top: 10.0),
                  child: Text('1.Forgot Password', style: headerStyle),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                      'Please enter the email address associated whit you account.',
                      style: secondaryHeader),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16),
                  child: mailId(Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, right: 16.0),
                  child: otpBtn(130, 25.0),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget mailId(Color color) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text('Email id', style: inputHeader),
          ),
          TextFormField(
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Email should not be empty";
              } else {
                return null;
              }
            },
            cursorColor: secondaryColor,
            controller: emailController,
            decoration: InputDecoration(
              fillColor: color,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              hoverColor: lightShade,
              focusColor: secondaryColor,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              filled: true,
              labelStyle: const TextStyle(color: grey100),
              labelText: 'Enter your email address',
              suffixIcon: const Icon(Icons.mail, color: grey100),
            ),
          ),
        ],
      ),
    );
  }

  Widget otpBtn(double width, double radius) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(width, 45),
            // maximumSize: const Size(110, 45),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
            primary: primaryColor,
          ),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              mail();
            }
          },
          child: const Text("Get OTP", style: btnStyle),
        ),
      ),
    );
  }
}
