import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? suhu;

  final myController = TextEditingController();

  List<String> suhuOptions = ['Kelvin', 'Reamur'];

  String result = '';

  /*void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        result = 'masukan: $masukan';
      });
    }
  } */

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konverter Suhu'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                  labelText: 'Suhu dalam Celcius',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Suhu tidak boleh kosong';
                  }
                  return null;
                },
                /*onSaved: (value) {
                  masukan = value;
                }, */
                controller: myController,
              ),
              SizedBox(
                height: 20.0,
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(),
                value: suhu,
                items: suhuOptions.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (changeValue) {},
              ),
              SizedBox(
                height: 20.0,
                width: 200.0,
              ),
              Align(
                alignment: Alignment.center,
                child: FloatingActionButton(
                  // When the user presses the button, show an alert dialog containing
                  // the text that the user has entered into the text field.
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          // Retrieve the text the that user has entered by using the
                          // TextEditingController.
                          content: Text(myController.text),
                        );
                      },
                    );
                  },
                  tooltip: 'Show me the value!',
                  child: const Icon(Icons.text_fields),
                  shape: RoundedRectangleBorder(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
