import 'package:flutter/material.dart';

// 1. Build a form
// 2. Implement Validaton
// 3. Implement
// 4. Parse string

class FormExampleTwo extends StatefulWidget {
  const FormExampleTwo({super.key});

  @override
  State<FormExampleTwo> createState() => _FormExampleTwoState();
}

class _FormExampleTwoState extends State<FormExampleTwo> {
  final _formKey = GlobalKey<FormState>();

  final ageController = TextEditingController(text: "");
  final nameController = TextEditingController(text: "");

  int age = 0;
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: ageController,
                onChanged: (value) {
                  setState(() {});
                },
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value?.isEmpty ?? false) {
                    return "Age cannot be empty";
                  }

                  return null;
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: nameController,
                onChanged: (value) {},
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value?.isEmpty ?? false) {
                    return "Name cannot be empty";
                  }

                  return null;
                },
              ),

              SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      age = int.parse(ageController.text);
                      name = nameController.text;
                    });
                  }
                },
                child: Text("Submit"),
              ),
              Column(children: [Text("Age :: $age"), Text("Name :: $name")]),
            ],
          ),
        ),
      ),
    );
  }
}
