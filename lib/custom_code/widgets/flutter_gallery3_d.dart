// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_gallery_3d/gallery3d.dart';

class FlutterGallery3D extends StatefulWidget {
  const FlutterGallery3D({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<FlutterGallery3D> createState() => _FlutterGallery3DState();
}

class _FlutterGallery3DState extends State<FlutterGallery3D> {
  Widget _buildItem(String title, Widget page) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return page;
          }),
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        child: Text(title),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("test"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildItem("demo01", Container()),
            _buildItem("pageview_demo", Container()),
          ],
        ),
      ),
    );
  }
}
