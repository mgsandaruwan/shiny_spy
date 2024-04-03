import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';

class LiveSkinDetection extends StatefulWidget {
  @override
  _LiveSkinDetectionState createState() => _LiveSkinDetectionState();
}

class _LiveSkinDetectionState extends State<LiveSkinDetection> {
  late CameraController _controller;
  late List<CameraDescription> _cameras;
  late String _imagePath = '';
  late List _outputs = [];
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _loading = true;

    _initializeCamera().then((_) {
      setState(() {
        _loading = false;
      });
    });

    loadModel().then((_) {});
  }

  @override
  void dispose() {
    _controller.dispose();
    Tflite.close();
    super.dispose();
  }

  Future<void> _initializeCamera() async {
    WidgetsFlutterBinding.ensureInitialized();
    _cameras = await availableCameras();
    for (CameraDescription cameraDescription in _cameras) {
      if (cameraDescription.lensDirection == CameraLensDirection.front) {
        _controller =
            CameraController(cameraDescription, ResolutionPreset.medium);
        break;
      }
    }
    if (_controller == null) {
      _controller = CameraController(_cameras[0], ResolutionPreset.medium);
    }

    await _controller.initialize();
    if (!mounted) {
      return;
    }
    setState(() {});
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
      numThreads: 1,
    );
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      imageMean: 0.0,
      imageStd: 255.0,
      numResults: 2,
      threshold: 0.2,
      asynch: true,
    );

    if (output != null && output.isNotEmpty) {
      setState(() {
        _loading = false;
        _outputs = output;
      });
    } else {
      // Handle case where model output is empty or null
      print("Model output is empty or null");
    }
  }

  void _captureImage() async {
    if (!_controller.value.isInitialized) {
      return;
    }

    final XFile imageFile = await _controller.takePicture();
    final String filePath = imageFile.path;

    setState(() {
      _imagePath = filePath;
      _loading = true;
    });
    classifyImage(File(filePath));
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null || !_controller.value.isInitialized) {
      return Container();
    }

    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          'Live Skin Detection',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          CameraPreview(_controller),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: _captureImage,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                  Color(0xFFEFE8A2), // Background color of the button
                ),
                child: Container(
                  color: Color(0xFFEFE8A2), // Background color of the icon
                  child: Icon(Icons.camera_alt_outlined, color: Colors.black87),
                ),
              ),
            ),
          ),
          _loading
              ? Center(child: CircularProgressIndicator())
              : _outputs.isNotEmpty
                  ? Align(
                      alignment: Alignment.center,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFEFE8A2), width: 2.0),
                        ),
                        child: FittedBox(
                          child: Image.file(File(_imagePath)),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : Container(),
          _loading
              ? Container()
              : _outputs.isNotEmpty
                  ? Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          _outputs[0]["label"],
                          style:
                              TextStyle(color: Color(0xFFEFE8A2), fontSize: 20.0),
                        ),
                      ),
                    )
                  : Container(),
        ],
      ),
    );
  }
}
