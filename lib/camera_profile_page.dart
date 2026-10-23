import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CameraProfilePage extends StatelessWidget {
  const CameraProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF176E5E);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
              child: Image.asset(
                "lib/images/newprofile_image.png",
                fit: BoxFit.cover,
              ),
            ),

            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 68,
                color: Colors.white.withValues(alpha: 0.16),
              ),
            ),

            Positioned(
              top: 88,
              right: 20,
              child: GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  "lib/images/flip_camera_icon.svg",
                  width: 34,
                  height: 34,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            Positioned(
              left: 0,
              right: 0,
              bottom: 90,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                      context,
                      "/editprofile-preview",
                    );
                  },
                  child: Container(
                    width: 86,
                    height: 86,
                    decoration: const BoxDecoration(
                      color: green,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              left: 20,
              bottom: 18,
              child: SizedBox(
                width: 20,
                height: 20,
                child: CustomPaint(painter: CornerPainter()),
              ),
            ),

            Positioned(
              right: 20,
              bottom: 18,
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(3.14159),
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CustomPaint(painter: CornerPainter()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CornerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF008CFF)
      ..strokeWidth = 1.6
      ..style = PaintingStyle.stroke;

    final path = Path();

    path.moveTo(0, size.height);
    path.lineTo(0, 4);
    path.quadraticBezierTo(0, 0, 4, 0);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
