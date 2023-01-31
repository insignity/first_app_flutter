import 'package:flutter/material.dart';

import '../../../../utils/utils.dart';
import '../widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          children: [
            LoginForm(),
            // CustomPaint(
            // size: Size(100, 50),
            // painter: RoundedRectanglePainter(strokeColor: Colors.blue,fillColor: Colors.red),
            // child: Text('asdlkfja;slkfdjlaskjdl f \nslkd jflskdj lfkjsdl\nkfjl skdj lksj\nsdfajsdhfaksljdfnlk ajsndf sakjd nfk\n ksdhfkjsdfk'),
            // ),
            // AnimatedCirclePage(),
          ],
        ),
      ),
    );
  }
}

class AnimatedCirclePainter extends CustomPainter {
  Animation<double> animation;

  AnimatedCirclePainter({required this.animation});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    var radius = animation.value;
    canvas.drawCircle(Offset(radius, size.height / 2), radius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class AnimatedCirclePage extends StatefulWidget {
  @override
  _AnimatedCirclePageState createState() => _AnimatedCirclePageState();
}

class _AnimatedCirclePageState extends State<AnimatedCirclePage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    animation = Tween<double>(begin: 0, end: 200).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: AnimatedCirclePainter(animation: animation),
    );
  }
}
