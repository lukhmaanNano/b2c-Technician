import 'package:flutter/material.dart';
import '../styles/CommonTextStyle.dart';
import '../styles/common Color.dart';

Widget headerNonMandatoryName(String? val) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Text(val!, style: inputHeader1),
      ],
    ),
  );
}

Widget headerName(String? val) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Text(val!, style: inputHeader),
        const Text('*', style: TextStyle(color: red)),
      ],
    ),
  );
}
