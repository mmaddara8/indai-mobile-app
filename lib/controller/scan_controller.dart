import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class ScanController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    initCamera();
    initTFLite();
  }

  @override
  void dispose() {
    super.dispose();
    cameraController.dispose();
  }

  late CameraController cameraController;
  late List<CameraDescription> cameras;
  late List recognitionsList = [];

  var isCameraInitialized = false.obs;
  var cameraCount = 0;

  var x = 0.0, y = 0.0, w = 0.0, h = 0.0;
  var label = "";

  initCamera() async {
    if (await Permission.camera.request().isGranted) {
      cameras = await availableCameras();

      cameraController = CameraController(
        cameras[0],
        ResolutionPreset.max,
      );
      await cameraController.initialize().then((value) {
        cameraController.startImageStream((image) {
          cameraCount++;
          if (cameraCount % 10 == 0) {
            cameraCount = 0;
            objectDetector(image);
          }
          update();
        });
      });
      isCameraInitialized(true);
      update();
    } else {
      print("Permission denied.");
    }
  }

  initTFLite() async {
    await Tflite.loadModel(
      model: "assets/durian.tflite",
      labels: "assets/durian.txt",
      isAsset: true,
      numThreads: 2,
      useGpuDelegate: false,
    );
  }

  objectDetector(CameraImage image) async {
    final results = await Tflite.detectObjectOnFrame(
      bytesList: image.planes.map((plane) {
        return plane.bytes;
      }).toList(),
      asynch: true,
      imageHeight: image.height,
      imageWidth: image.width,
      numResultsPerClass: 5,
      imageMean: 128,
      imageStd: 128,
      threshold: 0.9,
      numBoxesPerBlock: 1,
    );

    if (results != null) {
      recognitionsList = List.from(results);
// print("Objects detected are $recognitionsList");
    } else {
      recognitionsList = [];
    }
    update();
  }
}
