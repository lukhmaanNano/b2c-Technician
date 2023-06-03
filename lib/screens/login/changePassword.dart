import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../services/branding.dart';
import '../../services/changePassword.dart';
import '../../styles/CommonTextStyle.dart';
import '../../styles/common Color.dart';
import 'login.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final confirmPass = TextEditingController();
  final newPassController = TextEditingController();
  final BrandingControl _brandingControl = Get.find<BrandingControl>();
  final ChangePasswordController _changePassController =
      Get.find<ChangePasswordController>();
  bool _isObscure = true;
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

  Future<void> savePass(String newPass, confirmPass) async {
    final response = await _changePassController.changePasswordApi(
        context, newPass, confirmPass);
    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
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
        height: double.infinity,
        decoration: const BoxDecoration(
          color: primaryColor,
          image: DecorationImage(
            image: AssetImage("assets/images/loginBackground.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: SingleChildScrollView(
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
                            'assets/images/newPass.png',
                            fit: BoxFit.fill,
                          )),
                    ),
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.only(left: 20.0, top: 10.0, bottom: 2.0),
                    child: Text('3.Create New Password', style: headerStyle),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16.0, bottom: 10.0),
                    child: newPassword(Colors.white),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0, bottom: 2.0),
                    child: Text('Must be at least 8 characters.',
                        style: TextStyle(
                            color: grey100,
                            fontSize: 15,
                            fontWeight: FontWeight.w500)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16.0, bottom: 5.0),
                    child: confirmPassword(Colors.white),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0, bottom: 8.0),
                    child: Text('Both password must match.',
                        style: TextStyle(
                            color: grey100,
                            fontSize: 15,
                            fontWeight: FontWeight.w500)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, right: 16.0),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: saveButton(130, 25.0)),
                  ),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }

  Widget newPassword(Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text('New Password', style: inputHeader),
        ),
        TextFormField(
          validator: (String? value) {
            if (value != null && value.isEmpty) {
              return "New Password should not be empty";
            } else {
              return null;
            }
          },
          cursorColor: secondaryColor,
          controller: newPassController,
          obscureText: _isObscure,
          decoration: InputDecoration(
            fillColor: color,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            hoverColor: lightShade,
            filled: true,
            focusColor: secondaryColor,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelText: 'Enter your new password.',
            labelStyle: const TextStyle(color: grey100),
            suffixIcon: IconButton(
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.white,
              splashColor: Colors.transparent,
              icon: Icon(
                _isObscure ? Icons.visibility_off : Icons.visibility,
                color: grey100,
              ),
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget confirmPassword(Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text('Confirm Password', style: inputHeader),
        ),
        TextFormField(
          // inputFormatters: [
          //   FilteringTextInputFormatter.allow(
          //     RegExp(r"[a-zA-Z]+|\s"),
          //   )
          // ],
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return "Confirm password should not be empty";
            } else {
              if (newPassController.text == confirmPass.text) {
                return null;
              } else {
                return "New password and confirm password isn't same";
              }
            }
          },
          cursorColor: secondaryColor,
          controller: confirmPass,
          obscureText: _isObscure,
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
            labelText: 'Confirm password',
            suffixIcon: IconButton(
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.white,
              splashColor: Colors.transparent,
              icon: Icon(
                _isObscure ? Icons.visibility_off : Icons.visibility,
                color: grey100,
              ),
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget saveButton(double width, double radius) {
    return ElevatedButton(
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
          savePass(
              confirmPass.text.toString(), newPassController.text.toString());
        }
      },
      child: const Text("Save", style: btnStyle),
    );
  }
}
