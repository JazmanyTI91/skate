import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skate/SkateShop.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SkateShop(),
    );
  }
}

//Clases de los paint
class BluePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();
    paint.color = Colors.lightBlueAccent;

    final Rect rect = Rect.fromLTWH(0, 0, size.width * 0.25, size.height);
    canvas.drawRect(rect, paint);
  }

  @override
  //Es una optimización
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}


//Sirve para hacer la transicion de la tabla
class DieCuttingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();
    paint.color = Colors.white;
    paint.strokeWidth = 20;
    paint.style = PaintingStyle.fill;


    var x = size.height / 6;

    var path = Path();
    path.moveTo(0, -2 * x);

    for(var i = 0; i < 5; i ++) {
      path.relativeLineTo(x, x);
      path.relativeLineTo(-x, x);
    }
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}


class SkatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomPaint(
        painter: BluePainter(),
      child: SafeArea(
        bottom: false,
        child: Column(
          children: <Widget>[
            appBar(context),
            content(context),
            button(),
          ],
        ),
      ),
     ),
    );
  }

  Widget appBar(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        MaterialButton(
          onPressed: () {

          },
          child: Icon(Icons.arrow_back,
          color: Colors.white,
          size: 32.0),
        ),
        SizedBox(width: 48.0),

        Flexible(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SizedBox(height: 16.0),
              Text('SLIME MONSTER',
                style: Theme.of(context).textTheme.title.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 26,
                letterSpacing: 14,
              )),
            ],
          ),
        ),
      ],
    );
  }

  Widget content(BuildContext context) {
    return Expanded(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 32.0, top: 32, bottom: 32),
        child: Row(
          children: <Widget>[
            Container(
              width: 140,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage('assets/board1.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),

            //Agregamos la descripcion de la tabla
            Flexible(
             child: Padding(
               padding:  const EdgeInsets.only(left: 25, top: 10, bottom: 10),
               child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                 Padding(
               padding: const EdgeInsets.only(right: 32.0),
                 child: Text('Handmade skateboard desk with original painting from Mexico',
                 style: Theme.of(context).textTheme.title.copyWith(
                   fontSize: 22.0,
                   ),
                  ),
                 ),

                 Expanded(
                   child: Container(),
                 ),
                 Divider(),
                 Expanded(
                   child: Container(),
                 ),

                 Text('S I Z E',
                 style: Theme.of(context).textTheme.caption.copyWith(
                   fontSize: 24,
                   fontWeight: FontWeight.bold,
                   color: Colors.grey),
                 ),

                 Text("8\" x 32\"",
                   style: Theme.of(context).textTheme.title.copyWith(
                     fontSize: 22.0,
                   ),
                 ),

                 Expanded(
                   child: Container(),
                 ),

                 Text('M A T E R I A L' ,
                   style: Theme.of(context).textTheme.caption.copyWith(
                       fontSize: 24,
                       fontWeight: FontWeight.bold,
                       color: Colors.grey,
                   ),
                 ),

                 Text('Canadian Maple',
                   style: Theme.of(context).textTheme.title.copyWith(
                     fontSize: 22.0,
                   ),
                 ),

                 Expanded(
                   flex: 3,
                   child: Container(),
                 ),

                 CustomPaint(
                   painter: DieCuttingPainter(),
                   child: Container(
                     width: double.infinity,
                     height: 48,
                     color: Colors.yellowAccent,
                     alignment: Alignment.centerLeft,
                   child: Padding(
                     padding: const EdgeInsets.only(left: 50.0),
                      child: Text("\$240",
                       style: Theme.of(context).textTheme.headline.copyWith(
                       fontWeight: FontWeight.bold,
                       letterSpacing: 10,
                     )),
                     ),
                   ),
                 ),
               ],
              ),
             ),
            ),
          ],
         ),
        ),
      ),
    );
  }

  Widget button() {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50),
          topLeft: Radius.circular(50),
        )
      ),
      child: FlatButton(
        onPressed: () {},
        child: Text('ADD TO CARD',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          letterSpacing: 10,
        )),
      ),
    );
  }

}
