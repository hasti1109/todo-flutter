import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class NoTasksWidget extends StatefulWidget {
  const NoTasksWidget({super.key});

  @override
  State<NoTasksWidget> createState() => _NoTasksWidgetState();
}

class _NoTasksWidgetState extends State<NoTasksWidget> with SingleTickerProviderStateMixin{

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(seconds: 5),vsync: this);
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 300.w,
          height: 300.h,
          child: Lottie.network(
            'https://lottie.host/c9eb097b-f16f-4118-8a55-7f6143e63059/KMhq0gCS4L.json',
            controller: _controller
          ),
        ),
        Text('You have no tasks.'),
      ],
    );
  }
}
