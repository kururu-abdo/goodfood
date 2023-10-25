import 'dart:ui' as ui;

import 'package:flutter/material.dart';
class MyPainter extends CustomPainter {
  final Color?  themeColor;

  MyPainter({this.themeColor});

  @override
  void paint(Canvas canvas, Size size) {

//  var paint = Paint()
//  ..color =Colors.purple
//  ..strokeWidth= 1
 
//      ..style = PaintingStyle.stroke
//  ;
 

//     canvas.drawRect(
      
//      Rect.fromCenter(center: 
//      Offset(size.width/2, size.height/2)
     
//      ,
//       width: size.width, height: size.height)
//     //  Offset(0, 0)
//       ,
    
//      paint);



// var  horizontalLines = 5;
// var horizontalSize=  size.height / (horizontalLines);
// var linePainter =  Paint()
// ..color=Colors.purple
// ..style=PaintingStyle.fill
// ..strokeWidth=1
// ;

// for (var i = 0; i < horizontalLines; i++) {
//   var startY =  horizontalSize*(0+i);
// canvas.drawLine(Offset(0, startY),
//  Offset(size.width, startY), linePainter);
// }


// var  verticalLines = 5;
// var verticalSize=  size.width / (verticalLines);
// for (var i = 0; i < verticalLines; i++) {
//   var startX =  verticalSize*(0+i);
// canvas.drawLine(Offset(startX, 0),
//  Offset(startX , size.height), linePainter);
// }
var pathPaint = Paint()
..color = themeColor!.withOpacity(.50)
..style =PaintingStyle.stroke
..strokeWidth=2;
var path = drawPath(true, size);
canvas.drawPath(path, pathPaint);

var innerPath = Path()
..addPath(path, Offset.zero)
..lineTo(size.width, size.height) 
..lineTo(0, size.height)
..close();

var innerPaint = Paint()
..shader = ui.Gradient.linear(
    Offset.zero,
    Offset(size.width , size.height),
    [
     themeColor!.withOpacity(.10),
      Colors.transparent,
    ],
  )
..style =PaintingStyle.fill

;
canvas.drawPath(innerPath, innerPaint);





  }
Path drawPath(bool closePath , Size size ) {
  final width = size.width;
  final height = size.height;
  final path = Path();
  final segmentWidth = width / 3 / 2;
  path.moveTo(0, height);
  path.lineTo(size.width*.20, size.height*.90);
    path.lineTo(size.width*.35, size.height*.70);
    path.lineTo(size.width*.50, size.height*.90);
    path.lineTo(size.width*.70, size.height*.80);
    path.lineTo(size.width*.80, size.height*.90);
    // path.quadraticBezierTo(size.width*.70, size.height*.40 ,size.width*.80, size.height*.90);
    path.lineTo(size.width*.90, size.height*.90);
        // path.quadraticBezierTo(size.width*.80, size.height*.90 ,size.width, size.height);

    path.lineTo(size.width, size.height);

  // path.cubicTo(segmentWidth, height, 2 * segmentWidth, 0, 3 * segmentWidth, 0);
  // path.cubicTo(4 * segmentWidth, 0, 5 * segmentWidth, height, 6 * segmentWidth, height);

  return path;

//  var path = new Path();
//       path.lineTo(0, size.height); //start path with this if you are making at bottom
      
//       var firstStart = Offset(size.width / 5, size.height); 
//       //fist point of quadratic bezier curve
//       var firstEnd = Offset(size.width / 2.25, size.height - 50.0);
//       //second point of quadratic bezier curve
//       path.quadraticBezierTo(firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

//       var secondStart = Offset(size.width - (size.width / 3.24), size.height - 105); 
//       //third point of quadratic bezier curve
//       var secondEnd = Offset(size.width, size.height - 10);
//       //fourth point of quadratic bezier curve
//       path.quadraticBezierTo(secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

//       path.lineTo(size.width, 0); //end with this path if you are making wave at bottom
//       path.close();
//       return path; 










}
  @override
  bool shouldRepaint(MyPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(MyPainter oldDelegate) => false;
}