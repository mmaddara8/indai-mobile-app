import 'package:flutter/material.dart';
import 'package:indai/screens/Home.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/bg2.jpg',
                ).image,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/images/indai_logo.png',
                          width: 300,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(
                              0xFFE1BD27), // Set the button's background color
                          elevation: 5, // Set the button's elevation
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                12), // Set the button's border radius
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 24, horizontal: 24),
                          minimumSize: const Size(250, 55),
                        ),
                        child: const Text(
                          'Ripeness Classifier',
                          style: TextStyle(
                            fontFamily: 'Helvetica',
                            color: Color(0xFF333333),
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to Home.dart
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Home(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(
                              0xFFE1BD27), // Set the button's background color
                          elevation: 5, // Set the button's elevation
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                12), // Set the button's border radius
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 24, horizontal: 24),
                          minimumSize: const Size(250, 55),
                        ),
                        child: const Text(
                          'Quality Classifier',
                          style: TextStyle(
                            fontFamily: 'Helvetica',
                            color: Color(0xFF333333),
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(
                              0xFFE1BD27), // Set the button's background color
                          elevation: 5, // Set the button's elevation
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                12), // Set the button's border radius
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 24, horizontal: 24),
                          minimumSize: const Size(250, 55),
                        ),
                        child: const Text(
                          'Manage Farm',
                          style: TextStyle(
                            fontFamily: 'Helvetica',
                            color: Color(0xFF333333),
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
