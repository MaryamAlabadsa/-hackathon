import 'package:elancer/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../styles.dart';

enum WidgetMarker { freeLancer, ads }

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Color(
          0xFFCBCACA)),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  WidgetMarker selectedWidgetMarker = WidgetMarker.ads;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SizedBox(height: 100,),
            Container(
                width: 150,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      selectedWidgetMarker = WidgetMarker.ads;
                    }); // build(context)
                  },
                  child: Text(
                    "Ads",
                    style: selectedWidgetMarker == WidgetMarker.ads
                        ? TextStyle(color: Colors.white)
                        : TextStyle(color: blue),
                  ),
                ),
                decoration: selectedWidgetMarker == WidgetMarker.ads
                    ? customContinerStyle
                    : normalContinerStyle),
            Container(
                width: 150,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      selectedWidgetMarker = WidgetMarker.freeLancer;
                    });
                  },
                  child: Text(
                    "FreeLancer",
                    style: selectedWidgetMarker == WidgetMarker.freeLancer
                        ? TextStyle(color: Colors.white)
                        : TextStyle(color: blue),
                  ),
                ),
                decoration: selectedWidgetMarker == WidgetMarker.freeLancer
                    ? customContinerStyle
                    : normalContinerStyle),
          ],
        ),
        Expanded(
          child: Container(
            child: getCustomContainer(),
            height:double.infinity,
            // height: double.infinity,
          ),
        )
      ],
    );
  }

  Widget getCustomContainer() {
    switch (selectedWidgetMarker) {
      case WidgetMarker.freeLancer:
        return getFreeLancerWidget();
      case WidgetMarker.ads:
        return getAdsWidget();
    }
  }

  Widget getFreeLancerWidget() {
    return Container(
      height: 200,
      color: Colors.red,
      // child: Row(
      //   children: [
      //     ListView.builder(
      //       itemCount: 20,
      //       itemBuilder: (context, position) {
      //         return adsWidget();
      //       },
      //     ),
      //   ],
      // ),
    );
  }

  Widget getAdsWidget() {
    return Container(
      height: double.infinity,
      child: Row(
        children: [
        Expanded(
        child: Center(
          child: ListView.builder(
            itemCount: 20,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, position) {
              return adsWidget();
            },
          ),
        ))

        ],
      ),
    );
  }
}

Widget adsWidget() {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      width: 300,
      height: 10,
      decoration: normalContinerStyle,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image(
              height: 50,
              width: 50,
                image: AssetImage(
              'assets/images/img.png',
            )),
          ),
          Positioned(
              child: Text('ucasti' ,style: TextStyle(color:Color(0xFF808080) ),),
          top:8,
            left: 600,
          )
          ,
          Text('ucasti'),
          Positioned(
            top: 8,
              right: 10,
              child: TextButton(
            child: Container(
              height: 30,
              width: 80,
              decoration: customContinerStyle,
              child: Text(
                'Ads Detiles',
                style: TextStyle(color: Colors.white,fontSize: 10,),
              ),
            ),
            onPressed: () {},
          ))
        ],
      ),
    ),
  );
}
Widget freeLancerWidget() {
  return Container(
    color: Colors.black,
    height: 100,
    decoration: normalContinerStyle,
    child: Stack(
      children: [
        Image(
            image: AssetImage(
          'assets/images/img.png',
        )),
        Text('ucasti'),
        Text('ucasti'),
        Positioned(
          top: 8,
            left: 10,
            child: TextButton(
          child: Container(
            height: 30,
            decoration: customContinerStyle,
            child: Text(
              'Ads Detiles',
            ),
          ),
          onPressed: () {},
        ))
      ],
    ),
  );
}
