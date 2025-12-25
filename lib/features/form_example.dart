import 'dart:ffi';

import 'package:flutter/material.dart';

class FormExample extends StatefulWidget {
  const FormExample({super.key});

  @override
  State<FormExample> createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController fieldOneValue = TextEditingController(text: "");
  final TextEditingController fieldTwoValue = TextEditingController(text: "");

  String value1 = "";
  String value2 = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Input filed 1
              TextFormField(
                controller: fieldOneValue,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value?.isEmpty ?? false) {
                    return "Cannot be empty";
                  }

                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    value1 = value;
                  });
                },
              ),
              // Input field 2
              TextFormField(
                controller: fieldTwoValue,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value?.isEmpty ?? false) {
                    return "Cannot be empty";
                  }

                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    value2 = value;
                  });
                },
              ),
              // Action Button
              OutlinedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final demo1 = fieldOneValue.text;
                    final demo2 = int.parse(fieldTwoValue.text);
                    setState(() {
                      value1 = demo1;
                      value2 = (100 + demo2).toString();
                    });
                  }
                },
                child: Text("Submit"),
              ),

              Column(children: [Text(value1), Text(value2)]),
            ],
          ),
        ),
      ),
    );
  }
}
