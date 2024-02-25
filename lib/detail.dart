import 'package:body_measurment/instruction.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final _ageController = TextEditingController();
  String? _selectedGender;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF171254),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 15.0),
          child: Text('Check Your Detail', style: TextStyle(color: Colors.white, fontSize: 30)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Khan Sharif! text above the body
                Text(
                  'Khan Sharif',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                SizedBox(height: 20), // spacing after the text
                Form(
                  key: _formKey,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                    decoration: BoxDecoration(
                      color: Color(0x88FEFCFC),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        buildInputField(label: "Height", controller: _heightController, hint: "Enter Height"),
                        SizedBox(height: 20),
                        buildInputField(label: "Weight", controller: _weightController, hint: "Enter Weight"),
                        SizedBox(height: 20),
                        buildInputField(label: "Age", controller: _ageController, hint: "Enter Age"),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Gender",
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xFFF3AF48),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                _buildGenderButton("Male"),
                                SizedBox(width: 16),
                                _buildGenderButton("Female"),
                                SizedBox(width: 18),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Container(
                          width: 120,
                          height: 45,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFFF3AF48),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate() && _selectedGender != null) {
                                _formKey.currentState!.save();
                                // Navigate to next screen
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => InstructionPage()),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Please fill in all details'),
                                  ),
                                );
                              }
                            },
                            child: Text('Next'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInputField({
    required String label,
    required TextEditingController controller,
    required String hint,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 20,
            color: Color(0xFFF3AF48),
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          width: 200,
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hint,
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return '$hint should not be empty';
              } else if (!RegExp(r"^[0-9]+$").hasMatch(value)) {
                return 'Please enter a valid number';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildGenderButton(String gender) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: _selectedGender == gender ? Colors.orange : Colors.grey,
      ),
      onPressed: () {
        setState(() {
          _selectedGender = gender;
        });
      },
      child: Text(gender),
    );
  }
}
