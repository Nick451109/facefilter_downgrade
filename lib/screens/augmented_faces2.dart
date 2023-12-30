import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/services.dart';

class AugmentedFacesScreen2 extends StatefulWidget {
  const AugmentedFacesScreen2({Key? key}) : super(key: key);

  @override
  _AugmentedFacesScreenState2 createState() => _AugmentedFacesScreenState2();
}

class _AugmentedFacesScreenState2 extends State<AugmentedFacesScreen2> {
  ArCoreFaceController? arCoreFaceController;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Augmented Faces'),
        ),
        body: ArCoreFaceView(
          onArCoreViewCreated: _onArCoreViewCreated,
          enableAugmentedFaces: true,
        ),
      ),
    );
  }

  void _onArCoreViewCreated(ArCoreFaceController controller) {
    arCoreFaceController = controller;
    loadMesh();
  }

  loadMesh() async {
    final ByteData textureBytes =
        await rootBundle.load('assets/valdivia_mesh.png');

    arCoreFaceController?.loadMesh(
        textureBytes: textureBytes.buffer.asUint8List(),
        skin3DModelFilename: 'fox_face.sfb');
  }

  @override
  void dispose() {
    arCoreFaceController?.dispose();
    super.dispose();
  }
}
