import 'package:flutter/material.dart';

class LoginBackground extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint paint = Paint()..color = Colors.blue;
    //.. -> Paint오브젝트를 설정해서 color값을 지정해주고 Paint오브젝트를 paint에 넣어줘라.
    canvas.drawCircle(Offset(size.width*0.5,size.height*0.2), size.height*0.5, paint);  //paint 색의 원형
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }

}