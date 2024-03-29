import 'dart:io';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'signUpscreen.dart';

class PopupScreen extends StatefulWidget {
  @override
  _PopupScreenState createState() => _PopupScreenState();
}

class _PopupScreenState extends State<PopupScreen> {
  CameraController? _controller;
  bool _isReady = false;
  String? _oilinessLevel = 'Unknown';

  @override
  void initState() {
    super.initState();
    _initializeCamera();
    _loadModel();
  }

  void _loadModel() async {
    try {
      String? res = await Tflite.loadModel(
        model: 'assets/model_unquant.tflite',
        labels: 'assets/labels.txt',
      );
      if (res != null) {
        print('Model loaded successfully: $res');
      } else {
        print('Failed to load model.');
      }
    } catch (e) {
      print('Failed to load model: $e');
    }
  }


  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final camera = cameras.first;

    _controller = CameraController(camera, ResolutionPreset.medium);
    await _controller!.initialize();

    if (!mounted) return;

    setState(() {
      _isReady = true;
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    Tflite.close();
    super.dispose();
  }


  Future<void> _runInference(CameraImage cameraImage) async {
    if (!_isReady) return;

    final List<dynamic>? recognitions = await Tflite.runModelOnFrame(
      bytesList: cameraImage.planes.map((plane) {
        return plane.bytes;
      }).toList(),
      imageHeight: cameraImage.height,
      imageWidth: cameraImage.width,
      imageMean: 127.5,
      imageStd: 127.5,
      rotation: 90,
      numResults: 1,
      threshold: 0.1,
      asynch: true, // Set this to true for asynchronous inference
    );

    if (recognitions != null && recognitions.isNotEmpty) {
      setState(() {
        _oilinessLevel = recognitions[0]['label'] ?? 'Unknown';
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  Widget contentBox(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
          margin: EdgeInsets.only(top: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 10),
              Container(
                width: 294,
                height: 294,
                decoration: BoxDecoration(
                  color: Colors.grey, // You can change the color of the rectangle
                ),
                child: _isReady
                    ? CameraPreview(_controller!)
                    : Center(child: CircularProgressIndicator()),
              ),
              SizedBox(height: 30),
              Text(
                'Your oiliness level is',
                style: TextStyle(fontSize: 16, color: Color(0xFFFFFFFF)),
              ),
              SizedBox(height: 20),
              Text(
                _oilinessLevel ?? 'Unknown',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFEFE8A2),
                ),
              ),
              SizedBox(height: 60),
              Text(
                'To get the detailed report',
                style: TextStyle(fontSize: 16, color: Color(0xFFFFFFFF)),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Container(
                  width: 317.0,
                  height: 56.0,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFEFE8A2), // Button color
                    ),
                    child: Text(
                      'Log In',
                      style: TextStyle(fontSize: 18.0, color: Color(0xFF000000)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
