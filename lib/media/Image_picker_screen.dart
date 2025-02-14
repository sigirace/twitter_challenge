import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../constants/gaps.dart';
import '../constants/sizes.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  bool _hasPermission = false;

  final bool _isSelfieMode = false;

  late CameraController _cameraController;

  @override
  void initState() {
    super.initState();
    initPermissions();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  Future<void> initCamera() async {
    final cameras = await availableCameras();

    if (cameras.isEmpty) {
      return;
    }

    _cameraController = CameraController(
      cameras[_isSelfieMode ? 1 : 0],
      ResolutionPreset.ultraHigh,
      enableAudio: false,
    );

    await _cameraController.initialize();
    await _cameraController.prepareForVideoRecording();

    setState(() {});
  }

  Future<void> _onPickImagePressed() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (image == null) return;

    if (!mounted) return;
    Navigator.pop(context, image.path);
  }

  Future<void> initPermissions() async {
    final cameraPermission = await Permission.camera.request();
    final micPermission = await Permission.microphone.request();

    final cameraDenied =
        cameraPermission.isDenied || cameraPermission.isPermanentlyDenied;

    final micDenied =
        micPermission.isDenied || micPermission.isPermanentlyDenied;

    if (!cameraDenied && !micDenied) {
      _hasPermission = true;
      await initCamera();
      setState(() {});
    }
  }

  void _takePicture() async {
    final image = await _cameraController.takePicture();
    if (!mounted) return;
    Navigator.pop(context, image.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: !_hasPermission || !_cameraController.value.isInitialized
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Initializing...",
                    style:
                        TextStyle(color: Colors.white, fontSize: Sizes.size20),
                  ),
                  Gaps.v20,
                  const CircularProgressIndicator.adaptive(),
                ],
              )
            : Stack(
                alignment: Alignment.center,
                children: [
                  CameraPreview(_cameraController),
                  Positioned(
                    top: Sizes.size20,
                    right: Sizes.size20,
                    child: Column(
                      children: [
                        IconButton(
                          color: Colors.white,
                          onPressed: () {},
                          icon: const FaIcon(
                            FontAwesomeIcons.xmark,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: Sizes.size10,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        const Spacer(),
                        GestureDetector(
                          onTap: _takePicture,
                          child: const Stack(
                            alignment: Alignment.center,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.camera,
                                color: Colors.white,
                                size: Sizes.size50,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: IconButton(
                              onPressed: _onPickImagePressed,
                              icon: const FaIcon(
                                FontAwesomeIcons.image,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
