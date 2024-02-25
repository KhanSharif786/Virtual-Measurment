import 'package:body_measurment/detail.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween(begin: -1.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF171254),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Text('Hey! Sharif', style: TextStyle(color: Colors.white, fontSize: 30)),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0, top: 15.0),
            child: Transform.scale(
              scale: 2.5,
              child: IconButton(
                icon: Icon(Icons.person, color: Color(0xFFF3AF48)),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailPage()),
              );
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.transparent, width: 3.0),
                  ),
                  child: Image.asset('assets/body.png'),
                ),
                Positioned(
                  top: 0,
                  left: 70,
                  child: CustomPaint(
                    painter: CornerPainter(),
                    child: Container(width: 30, height: 30),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 70,
                  child: CustomPaint(
                    painter: CornerPainter(isTopRight: true),
                    child: Container(width: 30, height: 30),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 70,
                  child: CustomPaint(
                    painter: CornerPainter(isBottomLeft: true),
                    child: Container(width: 30, height: 30),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 70,
                  child: CustomPaint(
                    painter: CornerPainter(isBottomRight: true),
                    child: Container(width: 30, height: 30),
                  ),
                ),
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Positioned(
                      top: _animation.value * 380,
                      child: Container(
                        width: 200,
                        height: 8,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Spacer(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xB55952A6),
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 40),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, size: 40),
            label: '3D',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 40),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class CornerPainter extends CustomPainter {
  final bool isTopRight;
  final bool isBottomLeft;
  final bool isBottomRight;

  CornerPainter({
    this.isTopRight = false,
    this.isBottomLeft = false,
    this.isBottomRight = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    if (isTopRight) {
      canvas.drawLine(Offset(size.width, 0), Offset(size.width - 100, 0), paint);
      canvas.drawLine(Offset(size.width, 0), Offset(size.width, 100), paint);
    } else if (isBottomLeft) {
      canvas.drawLine(Offset(0, size.height), Offset(100, size.height), paint);
      canvas.drawLine(Offset(0, size.height), Offset(0, size.height - 100), paint);
    } else if (isBottomRight) {
      canvas.drawLine(Offset(size.width, size.height), Offset(size.width - 100, size.height), paint);
      canvas.drawLine(Offset(size.width, size.height), Offset(size.width, size.height - 100), paint);
    } else {
      canvas.drawLine(Offset(0, 0), Offset(100, 0), paint);
      canvas.drawLine(Offset(0, 0), Offset(0, 100), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: Text('DetailPage')),
    );
  }
}
