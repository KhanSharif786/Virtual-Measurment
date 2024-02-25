import 'package:flutter/material.dart';

class GuidePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF171254),
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Color(0xFF171254),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // First Row
            Text(
              'Body Scan Guideline\'s',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 10),
            Text('Please ensure to follow the below requirements', style: TextStyle(color: Colors.white, fontSize: 15.5)),
            SizedBox(height: 40),

            // Second Row
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '1 ',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Must wear regular fit', style: TextStyle(fontSize: 20, color: Colors.white)),
                      Text('or tight fit outfit', style: TextStyle(fontSize: 20, color: Colors.white)),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container( // Outer colored circle
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.orangeAccent,  // Adjust the color as needed
                      ),
                    ),
                    Container( // Image circle
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/front.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),

            // Third Row
            Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.orangeAccent, // Adjust this color as needed
                      ),
                    ),
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/side.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    '2. Tie your hair',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),

            // Fourth Row
            // Fourth Row
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40.0, right: 15.0),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '3 ',
                            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          TextSpan(
                            text: 'Be bare foot',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.orangeAccent,
                      ),
                    ),
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/leg.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 40),

            // Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigation or any action
                },
                child: Text('Continue'),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFF3AF48),
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
