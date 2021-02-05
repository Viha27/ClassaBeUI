import 'package:flutter/material.dart';
import 'design_course_app_theme.dart';

class CourseInfoScreen extends StatefulWidget {
  @override
  _CourseInfoScreenState createState() => _CourseInfoScreenState();
}

class _CourseInfoScreenState extends State<CourseInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cource'),
      ),
    );
  }
}
