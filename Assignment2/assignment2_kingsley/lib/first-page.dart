// ignore_for_file: avoid_print, use_key_in_widget_constructors, file_names, todo, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:robbinlaw/widgets/mysnackbar.dart';

// Do not change the structure of this files code.
// Just add code at the TODO's.

final formKey = GlobalKey<FormState>();

// We must make the variable firstName nullable.
String? firstName;
final TextEditingController textEditingController = TextEditingController();

class MyFirstPage extends StatefulWidget {
  @override
  MyFirstPageState createState() => MyFirstPageState();
}

class MyFirstPageState extends State<MyFirstPage> {
  bool enabled = false;
  int timesClicked = 0;
  String msg1 = 'Click Me';
  String msg2 = 'Reset';
  bool isInputValid = false;

  void _validateInput(String input) {
    setState(() {
      if (input.isNotEmpty && input.length <= 20) {
        isInputValid = true;
      } else {
        isInputValid = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A2 - User Input'),
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //TODO: Replace this Text Widget
              // and build the label and switch here
              // as children of the row.
              //Text('testing 1 2 3 '),
              const Text('Enable Buttons: '),
              Switch(
                value: enabled,
                onChanged: (bool value) {
                  setState(() {
                    enabled = value;
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //TODO: Build the two buttons here
              // as children of the row.
              // For each button use a
              // "Visibility Widget" and its child
              // will be an "ElevatedButton"
              Visibility(
                visible: enabled,
                child: ElevatedButton(
                  onPressed: enabled
                      ? () {
                          setState(() {
                            timesClicked++;
                            msg1 = 'Clicked $timesClicked times';
                          });
                        }
                      : null,
                  child: Text(msg1),
                ),
              ),
              const SizedBox(width: 10),
              Visibility(
                visible: enabled,
                child: ElevatedButton(
                  onPressed: enabled
                      ? () {
                          setState(() {
                            timesClicked = 0;
                            msg1 = 'Click Me';
                            textEditingController.clear();
                            isInputValid = false;
                          });
                        }
                      : null,
                  child: Text(msg2),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  //TODO: Build the text form field
                  // here as the first
                  // child of the column.
                  // Include as the second child
                  // of the column
                  // a submit button that will show a
                  // snackbar with the "firstName"
                  // if validation is satisfied.
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: textEditingController,
                          onChanged: (value) {
                            _validateInput(value);
                          },
                          onFieldSubmitted: (text) {
                            print('Submitted First Name Text = $text');
                            if (formKey.currentState!.validate()) {
                              print('the first name input is now valid');
                            }
                          },
                          validator: (input) {
                            return input != null &&
                                    input.length >= 1 &&
                                    input.length <= 20
                                ? null
                                : 'min 1, max 20 chars please';
                          },
                          onSaved: (input) {
                            print('onSaved first name = $input');
                            firstName = input;
                          },
                          maxLength: 20,
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.hourglass_top,
                              color: isInputValid
                                  ? Theme.of(context).colorScheme.primary
                                  : null,
                            ),
                            hintText: 'first name',
                            border: OutlineInputBorder(),
                            errorMaxLines: 3,
                            helperText: 'min 1, max 20',
                            suffixIcon: Icon(
                              Icons.check_circle,
                              color: isInputValid
                                  ? Theme.of(context).colorScheme.primary
                                  : null,
                            ),
                            counterText:
                                '${textEditingController.text.length}/20',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        'Hello there, your name is ${textEditingController.text}!'),
                    duration: const Duration(seconds: 5),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        print('Snackbar action tapped');
                      },
                    ),
                  ),
                );
              }
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
