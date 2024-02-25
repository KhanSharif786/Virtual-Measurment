import 'package:body_measurment/guide.dart';
import 'package:flutter/material.dart';

class InstructionPage extends StatefulWidget {
  @override
  _InstructionPageState createState() => _InstructionPageState();
}

class _InstructionPageState extends State<InstructionPage> {
  String? _selectedOption;

  BoxDecoration _imageDecoration(String option) {
    if (_selectedOption == option) {
      return BoxDecoration(
        border: Border(
          left: BorderSide(width: 3, color: Colors.white),
          top: BorderSide(width: 3, color: Colors.white),
          right: BorderSide(width: 3, color: Colors.white),
          bottom: BorderSide(width: 3, color: Colors.white),
        ),
      );
    } else {
      return BoxDecoration();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF171254),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
        child: ListView(
          children: [
            // First container
            Container(
              decoration: BoxDecoration(
                color: Color(0x77FEFCFC),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Khan Sharif',
                          style: TextStyle(color: Color(0xFFF3AF48), fontSize: 20),
                        ),
                        SizedBox(height: 5),
                        Container(height: 3, width: 130, color: Colors.white),
                        SizedBox(height: 5),
                        Text(
                          '75kg     162cm',
                          style: TextStyle(color: Color(0xFFF3AF48), fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.person, color: Colors.white, size: 70),
                ],
              ),
            ),
            SizedBox(height: 50),
            // Second container
            Container(
              height: 450,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color(0x77FEFCFC),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'What are you wearing',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'For accurate measurement, we need to know what you are wearing',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedOption = 'Regular';
                            });
                          },
                          child: Container(
                            decoration: _imageDecoration('Regular'),
                            child: Column(
                              children: [
                                Container(
                                  width: 200,
                                  height: 200,
                                  child: Image.asset('assets/regular.png'),
                                ),
                                SizedBox(height: 10),
                                Text('Regular fit', style: TextStyle(color: Colors.white, fontSize: 16)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedOption = 'Tight';
                            });
                          },
                          child: Container(
                            decoration: _imageDecoration('Tight'),
                            child: Column(
                              children: [
                                Container(
                                  width: 200,
                                  height: 200,
                                  child: Image.asset('assets/tight.png'),
                                ),
                                SizedBox(height: 10),
                                Text('Tight fit', style: TextStyle(color: Colors.white, fontSize: 16)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 50),
            // Last container with the Next button
            ElevatedButton(
              onPressed: () {
                if (_selectedOption == null) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please select any one Fit')));

                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GuidePage()),
                  );
                  // Navigate to the next page or do something else
                }
              },
              child: Text('Next'),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFF3AF48),
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
