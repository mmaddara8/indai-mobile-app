import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:indai/controller/scan_controller.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              GetBuilder<ScanController>(
                init: ScanController(),
                builder: (controller) {
                  if (controller.isCameraInitialized.value) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Stack(
                          children: [
                            CameraPreview(controller.cameraController),
                            if (controller.recognitionsList != null)
                              ...displayBoxesAroundRecognizedObjects(
                                controller.recognitionsList,
                                const Size(392.7, 700),
                              ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return const Text("Loading Preview...");
                  }
                },
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      iconSize: 40,
                      icon: const FaIcon(
                        FontAwesomeIcons.solidMap,
                        color: Color(0xFFE1BD27),
                        size: 24,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      iconSize: 60,
                      icon: const FaIcon(
                        FontAwesomeIcons.camera,
                        color: Color(0xFFE1BD27),
                        size: 40,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      iconSize: 40,
                      icon: const FaIcon(
                        FontAwesomeIcons.volumeHigh,
                        color: Color(0xFFE1BD27),
                        size: 24,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> displayBoxesAroundRecognizedObjects(
  List recognitionsList,
  Size screen,
) {
  if (recognitionsList == null) return [];

  double factorX = screen.width;
  double factorY = screen.height;

  return recognitionsList.map((result) {
    return Positioned(
      left: result["rect"]["x"] * factorX,
      top: result["rect"]["y"] * factorY,
      width: result["rect"]["w"] * factorX,
      height: result["rect"]["h"] * factorY,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red, width: 2.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Text(result['detectedClass'],
                  style: const TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }).toList();
}
