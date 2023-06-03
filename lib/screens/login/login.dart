import 'dart:convert';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:b2ctechnician/services/branding.dart';
import '../../services/loginService.dart';
import '../../styles/CommonTextStyle.dart';
import '../../styles/common Color.dart';
import '../../widgets/snackBar.dart';
import '../home.dart';
import 'forgotPassword.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final BrandingControl _brandingControl = Get.find<BrandingControl>();
  final LoginController _loginControl = Get.find<LoginController>();
  final _formKey = GlobalKey<FormState>();
  String? ip;
  bool _isObscure = true, remember = false;
  List<dynamic> brandingData = [];

  @override
  void initState() {
    super.initState();
    brandingFunc();
    local();
  }

  Future<void> brandingFunc() async {
    final response = _brandingControl.brandingData;
    setState(() {
      brandingData = response;
    });
  }

  Future<void> local() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      ip = prefs.getString('ip');
    });
  }

  Future<void> login(String userName, password) async {
    final response = await _loginControl.loginApi(context, userName, password);
    if (response.statusCode == 200) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
      String val = ('Success');
      StackDialog.show(val, 'You are successfully logged in',
          Icons.verified_outlined, orange);
    } else {
      // user already logged in
      _loginControl.loggedID;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: primaryColor,
          image: DecorationImage(
            image: AssetImage("assets/images/loginBackground.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, left: 16.0, right: 16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 180,
                            child: Center(
                                child: Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 60,
                                    child: Image.asset(
                                      width: 100,
                                      'assets/images/b2clogo.png',
                                      fit: BoxFit.fill,
                                    )),
                                const Text('Welcome', style: headerStyle),
                                const Text('Login to your account',
                                    style: secondaryHeader)
                              ],
                            )),
                          ),
                          userName(Colors.white),
                          password(Colors.white),
                          const SizedBox(height: 10),
                          forgotBtn(),
                          Align(
                              alignment: Alignment.centerRight,
                              child: loginBtn(130, 25.0)),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image.asset(
                          height: 100, width: 80, 'assets/images/lognano.png'),
                      Image.asset(
                          height: 100, width: 80, 'assets/images/b2clogo.png'),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget userName(Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Username', style: inputHeader),
        ),
        TextFormField(
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return "Username should not be empty";
            } else {
              return null;
            }
          },
          cursorColor: secondaryColor,
          controller: userNameController,
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
            labelText: 'Enter your username',
            suffixIcon: const Icon(Icons.person, color: grey100),
          ),
        ),
      ],
    );
  }

  Widget password(Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Password', style: inputHeader),
        ),
        TextFormField(
          validator: (String? value) {
            if (value != null && value.isEmpty) {
              return "Password should not be empty";
            } else {
              return null;
            }
          },
          onFieldSubmitted: (value) {
            if (_formKey.currentState!.validate()) {
              login(userNameController.text.toString(),
                  passwordController.text.toString());
            }
          },
          cursorColor: secondaryColor,
          controller: passwordController,
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
            labelText: 'Enter your password.',
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

                setState(() {
                  _isObscure;
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget forgotBtn() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                flex: 1,
                child: Checkbox(
                    value: remember,
                    onChanged: (value) => setState(() {
                          remember = !remember;
                        })),
              ),
              const Text('Remember Me',
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 13,
                      overflow: TextOverflow.clip,
                      fontWeight: FontWeight.w600)),
            ],
          ),
        ),
        Flexible(
          flex: 2,
          child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        ctx: context,
                        inheritTheme: true,
                        type: PageTransitionType.fade,
                        child: const ForgotPassword()));
              },
              child: const Text('Forgot Password',
                  style: TextStyle(
                      color: primaryColor, fontWeight: FontWeight.w600))),
        ),
      ],
    );
  }

  Widget loginBtn(double val, double radius) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(val, 45),
          // maximumSize: const Size(110, 45),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          primary: primaryColor,
        ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            login(userNameController.text.toString(),
                passwordController.text.toString());
          }
        },
        icon: const Icon(Icons.login, size: 18, color: secondaryColor),
        label: const Text("Login", style: btnStyle),
      ),
    );
  }
}
