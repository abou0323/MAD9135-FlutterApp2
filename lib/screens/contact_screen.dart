import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();

  MyData _data = MyData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formStateKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Want something? Tell us!',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16.0),
                // Name
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'Enter your name',
                    labelText: 'Name',
                  ),
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  onSaved: (value) {
                    _data.name = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                // Email
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    hintText: 'Enter your email',
                    labelText: 'Email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  onSaved: (value) {
                    _data.email = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(
                            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                        .hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 24.0),
                // Message
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.message),
                    hintText: 'Enter your message',
                    labelText: 'Message',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  maxLines: 3,
                  onSaved: (value) {
                    _data.message = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your message';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 32.0),
                ElevatedButton(
                    onPressed: () {
                      if (_formStateKey.currentState!.validate()) {
                        _formStateKey.currentState!.save();
                        //
                      }
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.send),
                        SizedBox(width: 12.0),
                        Text('Submit'),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyData {
  String name = '';
  String email = '';
  String message = '';
}
