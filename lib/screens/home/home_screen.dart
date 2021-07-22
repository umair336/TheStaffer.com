import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './XDDashboardPreviousWeek.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  // const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: const Color(0xfffafafa),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(start: 0.0, end: 548.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                ),
                gradient: LinearGradient(
                  begin: Alignment(-1.0, 1.0),
                  end: Alignment(1.0, -1.0),
                  colors: [
                    const Color(0xff6c16a2),
                    const Color(0xff611da5),
                    const Color(0xff005bc4)
                  ],
                  stops: [0.0, 0.485, 1.0],
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 24.0, end: 24.0),
            Pin(size: 92.0, end: 94.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: 1198.0,
                height: 92.0,
                child: Stack(
                  children: <Widget>[
                    Pinned.fromPins(
                      Pin(start: 12.0, end: 85.0),
                      Pin(start: 0.0, end: 0.0),
                      child: Stack(
                        children: <Widget>[
                          Pinned.fromPins(
                            Pin(start: 0.0, end: 0.0),
                            Pin(start: 0.0, end: 0.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                color: const Color(0xffffffff),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0x24000000),
                                    offset: Offset(0, 5),
                                    blurRadius: 8,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 178.0, start: 16.0),
                            Pin(size: 19.0, middle: 0.2192),
                            child: Text(
                              'Quality Assurance Engineer',
                              style: TextStyle(
                                fontFamily: 'Nunito Sans',
                                fontSize: 14,
                                color: const Color(0xff0d5bc4),
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(16.0, 39.0),
                            child:
                                // Adobe XD layer: 'Point 01' (text)
                                Text(
                              'Chicago, IL',
                              style: TextStyle(
                                fontFamily: 'Nunito Sans',
                                fontSize: 10,
                                color: const Color(0xff535353),
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(16.0, 61.0),
                            child:
                                // Adobe XD layer: 'Point 01' (text)
                                Text(
                              'NOV 22, 2022',
                              style: TextStyle(
                                fontFamily: 'Nunito Sans',
                                fontSize: 12,
                                color: const Color(0xff1f2126),
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 230.0, end: -399.0),
                      Pin(start: 0.0, end: 0.0),
                      child: Stack(
                        children: <Widget>[
                          Pinned.fromPins(
                            Pin(start: 0.0, end: 0.0),
                            Pin(start: 0.0, end: 0.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                color: const Color(0xffffffff),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0x24000000),
                                    offset: Offset(0, 5),
                                    blurRadius: 8,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 178.0, start: 16.0),
                            Pin(size: 19.0, middle: 0.2192),
                            child: Text(
                              'Quality Assurance Engineer',
                              style: TextStyle(
                                fontFamily: 'Nunito Sans',
                                fontSize: 14,
                                color: const Color(0xff0d5bc4),
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(16.0, 39.0),
                            child:
                                // Adobe XD layer: 'Point 01' (text)
                                Text(
                              'Chicago, IL',
                              style: TextStyle(
                                fontFamily: 'Nunito Sans',
                                fontSize: 10,
                                color: const Color(0xff535353),
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(16.0, 61.0),
                            child:
                                // Adobe XD layer: 'Point 01' (text)
                                Text(
                              'NOV 22, 2022',
                              style: TextStyle(
                                fontFamily: 'Nunito Sans',
                                fontSize: 12,
                                color: const Color(0xff1f2126),
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 230.0, end: -157.0),
                      Pin(start: 0.0, end: 0.0),
                      child: Stack(
                        children: <Widget>[
                          Pinned.fromPins(
                            Pin(start: 0.0, end: 0.0),
                            Pin(start: 0.0, end: 0.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                color: const Color(0xffffffff),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0x24000000),
                                    offset: Offset(0, 5),
                                    blurRadius: 8,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 178.0, start: 16.0),
                            Pin(size: 19.0, middle: 0.2192),
                            child: Text(
                              'Quality Assurance Engineer',
                              style: TextStyle(
                                fontFamily: 'Nunito Sans',
                                fontSize: 14,
                                color: const Color(0xff0d5bc4),
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(16.0, 39.0),
                            child:
                                // Adobe XD layer: 'Point 01' (text)
                                Text(
                              'Chicago, IL',
                              style: TextStyle(
                                fontFamily: 'Nunito Sans',
                                fontSize: 10,
                                color: const Color(0xff535353),
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(16.0, 61.0),
                            child:
                                // Adobe XD layer: 'Point 01' (text)
                                Text(
                              'NOV 22, 2022',
                              style: TextStyle(
                                fontFamily: 'Nunito Sans',
                                fontSize: 12,
                                color: const Color(0xff1f2126),
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 230.0, end: -641.0),
                      Pin(start: 0.0, end: 0.0),
                      child: Stack(
                        children: <Widget>[
                          Pinned.fromPins(
                            Pin(start: 0.0, end: 0.0),
                            Pin(start: 0.0, end: 0.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                color: const Color(0xffffffff),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0x24000000),
                                    offset: Offset(0, 5),
                                    blurRadius: 8,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 178.0, start: 16.0),
                            Pin(size: 19.0, middle: 0.2192),
                            child: Text(
                              'Quality Assurance Engineer',
                              style: TextStyle(
                                fontFamily: 'Nunito Sans',
                                fontSize: 14,
                                color: const Color(0xff0d5bc4),
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(16.0, 39.0),
                            child:
                                // Adobe XD layer: 'Point 01' (text)
                                Text(
                              'Chicago, IL',
                              style: TextStyle(
                                fontFamily: 'Nunito Sans',
                                fontSize: 10,
                                color: const Color(0xff535353),
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(16.0, 61.0),
                            child:
                                // Adobe XD layer: 'Point 01' (text)
                                Text(
                              'NOV 22, 2022',
                              style: TextStyle(
                                fontFamily: 'Nunito Sans',
                                fontSize: 12,
                                color: const Color(0xff1f2126),
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Pinned.fromPins(
                      Pin(size: 230.0, end: -883.0),
                      Pin(start: 0.0, end: 0.0),
                      child: Stack(
                        children: <Widget>[
                          Pinned.fromPins(
                            Pin(start: 0.0, end: 0.0),
                            Pin(start: 0.0, end: 0.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                color: const Color(0xffffffff),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0x24000000),
                                    offset: Offset(0, 5),
                                    blurRadius: 8,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Pinned.fromPins(
                            Pin(size: 178.0, start: 16.0),
                            Pin(size: 19.0, middle: 0.2192),
                            child: Text(
                              'Quality Assurance Engineer',
                              style: TextStyle(
                                fontFamily: 'Nunito Sans',
                                fontSize: 14,
                                color: const Color(0xff0d5bc4),
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(16.0, 39.0),
                            child:
                                // Adobe XD layer: 'Point 01' (text)
                                Text(
                              'Chicago, IL',
                              style: TextStyle(
                                fontFamily: 'Nunito Sans',
                                fontSize: 10,
                                color: const Color(0xff535353),
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(16.0, 61.0),
                            child:
                                // Adobe XD layer: 'Point 01' (text)
                                Text(
                              'NOV 22, 2022',
                              style: TextStyle(
                                fontFamily: 'Nunito Sans',
                                fontSize: 12,
                                color: const Color(0xff1f2126),
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 24.0, end: 24.0),
            Pin(start: 120.0, end: 512.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: const Color(0xfffcfcfc),
                border: Border.all(width: 1.0, color: const Color(0xff4fabf7)),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x29000000),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(startFraction: 0.232, endFraction: 0.568),
            Pin(size: 19.0, middle: 0.1985),
            child:
                // Adobe XD layer: 'Insight' (text)
                Text(
              'Total Hours',
              style: TextStyle(
                fontFamily: 'Nunito Sans',
                fontSize: 14,
                color: const Color(0xff707070),
                fontWeight: FontWeight.w700,
                height: 1.5,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(startFraction: 0.2293, endFraction: 0.5547),
            Pin(size: 14.0, middle: 0.2348),
            child:
                // Adobe XD layer: 'Insight' (text)
                Text(
              '20 JUN to 27 JUN',
              style: TextStyle(
                fontFamily: 'Nunito Sans',
                fontSize: 10,
                color: const Color(0xff0d5bc4),
                fontWeight: FontWeight.w700,
                height: 2.1,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(startFraction: 0.7307, endFraction: 0.1173),
            Pin(size: 41.0, middle: 0.2142),
            child:
                // Adobe XD layer: 'Insight' (text)
                Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'Nunito Sans',
                  fontSize: 30,
                  color: const Color(0xff1f2126),
                  letterSpacing: -1.0799999999999998,
                  height: 1.3125,
                ),
                children: [
                  TextSpan(
                    text: '38',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: '.50',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.right,
            ),
          ),
          Transform.translate(
            offset: Offset(44.0, 140.0),
            child: SizedBox(
              width: 30.0,
              height: 32.0,
              child:
                  // Adobe XD layer: '002-schedule' (group)
                  Stack(
                children: <Widget>[
                  SizedBox(
                    width: 28.0,
                    height: 27.0,
                    child: Stack(
                      children: <Widget>[
                        Transform.translate(
                          offset: Offset(0.0, 4.3),
                          child: SizedBox(
                            width: 28.0,
                            height: 22.0,
                            child: SvgPicture.string(
                              _svg_m5e95c,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(2.1, 11.7),
                          child: SizedBox(
                            width: 24.0,
                            height: 11.0,
                            child: Stack(
                              children: <Widget>[
                                SizedBox(
                                  width: 24.0,
                                  height: 11.0,
                                  child: SvgPicture.string(
                                    _svg_m374e8,
                                    allowDrawingOutsideViewBox: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(0.0, 2.1),
                          child: SizedBox(
                            width: 28.0,
                            height: 22.0,
                            child: SvgPicture.string(
                              _svg_9dl42x,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(4.9, 3.8),
                          child: SizedBox(
                            width: 18.0,
                            height: 1.0,
                            child: Stack(
                              children: <Widget>[
                                SizedBox(
                                  width: 18.0,
                                  height: 1.0,
                                  child: Stack(
                                    children: <Widget>[
                                      SizedBox(
                                        width: 2.0,
                                        height: 1.0,
                                        child: Stack(
                                          children: <Widget>[
                                            SizedBox(
                                              width: 2.0,
                                              height: 1.0,
                                              child: SvgPicture.string(
                                                _svg_o7fnax,
                                                allowDrawingOutsideViewBox:
                                                    true,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Transform.translate(
                                        offset: Offset(3.4, 0.0),
                                        child: SizedBox(
                                          width: 2.0,
                                          height: 1.0,
                                          child: Stack(
                                            children: <Widget>[
                                              SizedBox(
                                                width: 2.0,
                                                height: 1.0,
                                                child: SvgPicture.string(
                                                  _svg_c19izm,
                                                  allowDrawingOutsideViewBox:
                                                      true,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Transform.translate(
                                        offset: Offset(12.3, 0.0),
                                        child: SizedBox(
                                          width: 2.0,
                                          height: 1.0,
                                          child: Stack(
                                            children: <Widget>[
                                              SizedBox(
                                                width: 2.0,
                                                height: 1.0,
                                                child: SvgPicture.string(
                                                  _svg_8i2lsx,
                                                  allowDrawingOutsideViewBox:
                                                      true,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Transform.translate(
                                        offset: Offset(15.7, 0.0),
                                        child: SizedBox(
                                          width: 2.0,
                                          height: 1.0,
                                          child: Stack(
                                            children: <Widget>[
                                              SizedBox(
                                                width: 2.0,
                                                height: 1.0,
                                                child: SvgPicture.string(
                                                  _svg_elh1np,
                                                  allowDrawingOutsideViewBox:
                                                      true,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 28.0,
                          height: 10.0,
                          child: SvgPicture.string(
                            _svg_mc3wm,
                            allowDrawingOutsideViewBox: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(13.9, 16.0),
                    child: Container(
                      width: 16.1,
                      height: 16.0,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        color: const Color(0xff4fabf7),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(16.1, 18.1),
                    child: Container(
                      width: 11.8,
                      height: 11.7,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        color: const Color(0xffebf5fc),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(21.5, 19.8),
                    child: SizedBox(
                      width: 1.0,
                      height: 4.0,
                      child: Stack(
                        children: <Widget>[
                          SizedBox(
                            width: 1.0,
                            height: 4.0,
                            child: Stack(
                              children: <Widget>[
                                SizedBox(
                                  width: 1.0,
                                  height: 4.0,
                                  child: SvgPicture.string(
                                    _svg_vl8pmh,
                                    allowDrawingOutsideViewBox: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(22.6, 23.5),
                    child: SizedBox(
                      width: 3.0,
                      height: 1.0,
                      child: Stack(
                        children: <Widget>[
                          SizedBox(
                            width: 3.0,
                            height: 1.0,
                            child: Stack(
                              children: <Widget>[
                                SizedBox(
                                  width: 3.0,
                                  height: 1.0,
                                  child: SvgPicture.string(
                                    _svg_nt3fc,
                                    allowDrawingOutsideViewBox: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(21.2, 16.0),
                    child: SizedBox(
                      width: 9.0,
                      height: 16.0,
                      child: SvgPicture.string(
                        _svg_fqplrf,
                        allowDrawingOutsideViewBox: true,
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(20.9, 22.9),
                    child: Container(
                      width: 2.1,
                      height: 2.1,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                        color: const Color(0xffffdd40),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 24.0, end: 24.0),
            Pin(start: 208.0, end: 424.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: const Color(0xfffcfcfc),
                border: Border.all(width: 1.0, color: const Color(0xfffec12d)),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x29000000),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(startFraction: 0.232, endFraction: 0.6187),
            Pin(size: 19.0, middle: 0.3328),
            child:
                // Adobe XD layer: 'Insight' (text)
                Text(
              'Earnings',
              style: TextStyle(
                fontFamily: 'Nunito Sans',
                fontSize: 14,
                color: const Color(0xff707070),
                fontWeight: FontWeight.w700,
                height: 1.5,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(startFraction: 0.2293, endFraction: 0.5547),
            Pin(size: 14.0, middle: 0.3623),
            child:
                // Adobe XD layer: 'Insight' (text)
                Text(
              '20 JUN to 27 JUN',
              style: TextStyle(
                fontFamily: 'Nunito Sans',
                fontSize: 10,
                color: const Color(0xff0d5bc4),
                fontWeight: FontWeight.w700,
                height: 2.1,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(startFraction: 0.624, endFraction: 0.1173),
            Pin(size: 41.0, middle: 0.3469),
            child:
                // Adobe XD layer: 'Insight' (text)
                Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'Nunito Sans',
                  fontSize: 30,
                  color: const Color(0xff1f2126),
                  letterSpacing: -1.0799999999999998,
                  height: 1.3125,
                ),
                children: [
                  TextSpan(
                    text: '1,260',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: '.50',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.right,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 30.0, start: 44.0),
            Pin(size: 30.0, middle: 0.3398),
            child: Stack(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(6.9, 10.0),
                  child: SizedBox(
                    width: 16.0,
                    height: 9.0,
                    child:
                        // Adobe XD layer: '014-money-2' (group)
                        Stack(
                      children: <Widget>[
                        SizedBox(
                          width: 16.0,
                          height: 9.0,
                          child: SvgPicture.string(
                            _svg_tdn4ix,
                            allowDrawingOutsideViewBox: true,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(1.4, 2.7),
                          child: SizedBox(
                            width: 12.0,
                            height: 5.0,
                            child: Stack(
                              children: <Widget>[
                                SizedBox(
                                  width: 12.0,
                                  height: 5.0,
                                  child: SvgPicture.string(
                                    _svg_y8aftm,
                                    allowDrawingOutsideViewBox: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(5.4, 0.0),
                          child: SizedBox(
                            width: 6.0,
                            height: 9.0,
                            child: SvgPicture.string(
                              _svg_6gumse,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 30.0,
                  height: 30.0,
                  child: Stack(
                    children: <Widget>[
                      SizedBox(
                        width: 30.0,
                        height: 30.0,
                        child: SvgPicture.string(
                          _svg_er1dus,
                          allowDrawingOutsideViewBox: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(start: 24.0, end: 24.0),
            Pin(start: 296.0, end: 336.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: const Color(0xfffcfcfc),
                border: Border.all(width: 1.0, color: const Color(0xff00d6d6)),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x29000000),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(startFraction: 0.232, endFraction: 0.4533),
            Pin(size: 19.0, middle: 0.4715),
            child:
                // Adobe XD layer: 'Insight' (text)
                Text(
              'Active Shift Count',
              style: TextStyle(
                fontFamily: 'Nunito Sans',
                fontSize: 14,
                color: const Color(0xff707070),
                fontWeight: FontWeight.w700,
                height: 1.2857142857142858,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(startFraction: 0.7893, endFraction: 0.1173),
            Pin(size: 41.0, middle: 0.4796),
            child:
                // Adobe XD layer: 'Insight' (text)
                Text(
              '15',
              style: TextStyle(
                fontFamily: 'Nunito Sans',
                fontSize: 30,
                color: const Color(0xff1f2126),
                letterSpacing: -1.0799999999999998,
                fontWeight: FontWeight.w700,
                height: 0.7,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.right,
            ),
          ),
          Transform.translate(
            offset: Offset(44.0, 317.0),
            child: SizedBox(
              width: 30.0,
              height: 30.0,
              child:
                  // Adobe XD layer: '08-shift' (group)
                  Stack(
                children: <Widget>[
                  SizedBox(
                    width: 30.0,
                    height: 30.0,
                    child:
                        // Adobe XD layer: 'gradient' (group)
                        Stack(
                      children: <Widget>[
                        Transform.translate(
                          offset: Offset(3.2, 1.2),
                          child: SizedBox(
                            width: 24.0,
                            height: 28.0,
                            child: SvgPicture.string(
                              _svg_nnq8og,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(1.4, 17.1),
                          child: Container(
                            width: 5.5,
                            height: 5.6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(9999.0, 9999.0)),
                              color: const Color(0xfffcd2d3),
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(0.0, 17.1),
                          child: SizedBox(
                            width: 8.0,
                            height: 13.0,
                            child: SvgPicture.string(
                              _svg_sq1ubp,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(23.2, 0.0),
                          child: Container(
                            width: 5.5,
                            height: 5.6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(9999.0, 9999.0)),
                              color: const Color(0xfffcd2d3),
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(21.7, 0.0),
                          child: SizedBox(
                            width: 8.0,
                            height: 13.0,
                            child: SvgPicture.string(
                              _svg_2smh0m,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 24.0, end: 24.0),
            Pin(start: 384.0, end: 248.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: const Color(0xfffcfcfc),
                border: Border.all(width: 1.0, color: const Color(0xffd490ff)),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x29000000),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(startFraction: 0.232, endFraction: 0.48),
            Pin(size: 19.0, middle: 0.6),
            child:
                // Adobe XD layer: 'Insight' (text)
                Text(
              'Pending Balance',
              style: TextStyle(
                fontFamily: 'Nunito Sans',
                fontSize: 14,
                color: const Color(0xff707070),
                fontWeight: FontWeight.w700,
                height: 1.2857142857142858,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(startFraction: 0.6853, endFraction: 0.1173),
            Pin(size: 41.0, middle: 0.6124),
            child:
                // Adobe XD layer: 'Insight' (text)
                Text.rich(
              TextSpan(
                style: TextStyle(
                  fontFamily: 'Nunito Sans',
                  fontSize: 30,
                  color: const Color(0xff1f2126),
                  letterSpacing: -1.0799999999999998,
                  height: 1.3125,
                ),
                children: [
                  TextSpan(
                    text: '750',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: '.50',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.right,
            ),
          ),
          Transform.translate(
            offset: Offset(44.0, 405.0),
            child: SizedBox(
              width: 30.0,
              height: 30.0,
              child: Stack(
                children: <Widget>[
                  SizedBox(
                    width: 30.0,
                    height: 30.0,
                    child: SvgPicture.string(
                      _svg_hvl2vt,
                      allowDrawingOutsideViewBox: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 24.0, endFraction: 0.5333),
            Pin(size: 22.0, start: 480.0),
            child:
                // Adobe XD layer: 'Portlet Title' (text)
                Text(
              'Recent Assignments',
              style: TextStyle(
                fontFamily: 'Nunito Sans',
                fontSize: 16,
                color: const Color(0xff0d5bc4),
                fontWeight: FontWeight.w700,
                height: 1,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 10.0, end: 32.0),
            Pin(size: 12.0, middle: 0.3121),
            child: SvgPicture.string(
              _svg_yw2hxb,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 24.0, end: 25.0),
            Pin(size: 24.0, middle: 0.1794),
            child: PageLink(
              links: [
                PageLinkInfo(
                  ease: Curves.easeOut,
                  duration: 0.3,
                  pageBuilder: () => XDDashboardPreviousWeek(),
                ),
              ],
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(size: 10.0, middle: 0.5),
                    Pin(start: 6.0, end: 6.0),
                    child: PageLink(
                      links: [
                        PageLinkInfo(
                          ease: Curves.easeOut,
                          duration: 0.3,
                          pageBuilder: () => XDDashboardPreviousWeek(),
                        ),
                      ],
                      child: SvgPicture.string(
                        _svg_e2s4zl,
                        allowDrawingOutsideViewBox: true,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 0.0),
                    Pin(start: 0.0, end: 0.0),
                    child: Container(
                      decoration: BoxDecoration(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 220.0, start: 24.0),
            Pin(size: 48.0, start: 48.0),
            child:
                // Adobe XD layer: 'Profile' (group)
                Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(size: 48.0, start: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child:
                      // Adobe XD layer: 'Photo' (shape)
                      Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      image: DecorationImage(
                        image: const AssetImage(''),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(startFraction: 0.2909, endFraction: 0.4636),
                  Pin(size: 16.0, middle: 0.0938),
                  child:
                      // Adobe XD layer: 'Welcome,' (text)
                      Text(
                    'Welcome,',
                    style: TextStyle(
                      fontFamily: 'Nunito Sans',
                      fontSize: 12,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w600,
                      height: 1.6666666666666667,
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.left,
                  ),
                ),
                Pinned.fromPins(
                  Pin(startFraction: 0.2909, endFraction: 0.0),
                  Pin(size: 24.0, middle: 0.9583),
                  child:
                      // Adobe XD layer: 'Name Label' (text)
                      Text(
                    'Wayne Richardson',
                    style: TextStyle(
                      fontFamily: 'Nunito Sans',
                      fontSize: 18,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w700,
                      height: 1.2222222222222223,
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 24.0, end: 20.0),
            Pin(size: 24.0, start: 60.0),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 4.0, end: 4.0),
                  Pin(start: 3.0, end: 3.0),
                  child:
                      // Adobe XD layer: 'notification' (shape)
                      SvgPicture.string(
                    _svg_rxlwxj,
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(start: 0.0, end: 0.0),
                  child: Container(
                    decoration: BoxDecoration(),
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 6.0, middle: 0.7778),
                  Pin(size: 6.0, start: 3.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                      color: const Color(0xffe50000),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_m374e8 =
    '<svg viewBox="0.0 0.0 23.6 10.7" ><path transform="translate(-51.2, -187.73)" d="M 52.84354400634766 189.8673400878906 L 51.70521926879883 189.8673400878906 C 51.42787170410156 189.8673400878906 51.2030029296875 189.6434631347656 51.2030029296875 189.3673400878906 L 51.2030029296875 188.2340393066406 C 51.2030029296875 187.9579162597656 51.42787170410156 187.7340240478516 51.70521926879883 187.7340240478516 L 52.84354400634766 187.7340240478516 C 53.12089157104492 187.7340240478516 53.34576034545898 187.9579162597656 53.34576034545898 188.2340393066406 L 53.34576034545898 189.3673400878906 C 53.34576034545898 189.6434631347656 53.12089157104492 189.8673400878906 52.84354400634766 189.8673400878906 Z" fill="#3c58a0" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-115.18, -187.73)" d="M 121.1105575561523 189.8673400878906 L 119.9722213745117 189.8673400878906 C 119.6948776245117 189.8673400878906 119.4700088500977 189.6434631347656 119.4700088500977 189.3673400878906 L 119.4700088500977 188.2340393066406 C 119.4700088500977 187.9579162597656 119.6948776245117 187.7340240478516 119.9722213745117 187.7340240478516 L 121.1105575561523 187.7340240478516 C 121.3879013061523 187.7340240478516 121.6127700805664 187.9579162597656 121.6127700805664 188.2340393066406 L 121.6127700805664 189.3673400878906 C 121.6127700805664 189.6434631347656 121.3879013061523 189.8673400878906 121.1105575561523 189.8673400878906 Z" fill="#3c58a0" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-179.16, -187.73)" d="M 189.3765563964844 189.8673400878906 L 188.2382202148438 189.8673400878906 C 187.9608764648438 189.8673400878906 187.7359619140625 189.6434631347656 187.7359619140625 189.3673400878906 L 187.7359619140625 188.2340393066406 C 187.7359619140625 187.9579162597656 187.9608764648438 187.7340240478516 188.2382202148438 187.7340240478516 L 189.3765563964844 187.7340240478516 C 189.6539001464844 187.7340240478516 189.8787536621094 187.9579162597656 189.8787536621094 188.2340393066406 L 189.8787536621094 189.3673400878906 C 189.8787536621094 189.6434631347656 189.6539611816406 189.8673400878906 189.3765563964844 189.8673400878906 Z" fill="#3c58a0" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-243.15, -187.73)" d="M 257.6435852050781 189.8673400878906 L 256.5052185058594 189.8673400878906 C 256.2278747558594 189.8673400878906 256.0030212402344 189.6434631347656 256.0030212402344 189.3673400878906 L 256.0030212402344 188.2340393066406 C 256.0030212402344 187.9579162597656 256.2278747558594 187.7340240478516 256.5052185058594 187.7340240478516 L 257.6435852050781 187.7340240478516 C 257.9209594726562 187.7340240478516 258.145751953125 187.9579162597656 258.145751953125 188.2340393066406 L 258.145751953125 189.3673400878906 C 258.145751953125 189.6434631347656 257.9209594726562 189.8673400878906 257.6435852050781 189.8673400878906 Z" fill="#3c58a0" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-307.12, -187.73)" d="M 325.8985595703125 189.8673400878906 L 324.76025390625 189.8673400878906 C 324.4829406738281 189.8673400878906 324.2580871582031 189.6434631347656 324.2580871582031 189.3673400878906 L 324.2580871582031 188.2340393066406 C 324.2580871582031 187.9579162597656 324.4829406738281 187.7340240478516 324.76025390625 187.7340240478516 L 325.8985595703125 187.7340240478516 C 326.1759338378906 187.7340240478516 326.4007873535156 187.9579162597656 326.4007873535156 188.2340393066406 L 326.4007873535156 189.3673400878906 C 326.4007873535156 189.6434631347656 326.1759338378906 189.8673400878906 325.8985595703125 189.8673400878906 Z" fill="#3c58a0" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-371.1, -187.73)" d="M 394.1655578613281 189.8673400878906 L 393.0271911621094 189.8673400878906 C 392.7498168945312 189.8673400878906 392.5250244140625 189.6434631347656 392.5250244140625 189.3673400878906 L 392.5250244140625 188.2340393066406 C 392.5250244140625 187.9579162597656 392.7498168945312 187.7340240478516 393.0271911621094 187.7340240478516 L 394.1655578613281 187.7340240478516 C 394.4429016113281 187.7340240478516 394.6677551269531 187.9579162597656 394.6677551269531 188.2340393066406 L 394.6677551269531 189.3673400878906 C 394.6677551269531 189.6434631347656 394.4429016113281 189.8673400878906 394.1655578613281 189.8673400878906 Z" fill="#3c58a0" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-51.2, -251.73)" d="M 52.84354400634766 258.1333312988281 L 51.70521926879883 258.1333312988281 C 51.42787170410156 258.1333312988281 51.2030029296875 257.9094543457031 51.2030029296875 257.6333312988281 L 51.2030029296875 256.5 C 51.2030029296875 256.223876953125 51.42787170410156 256 51.70521926879883 256 L 52.84354400634766 256 C 53.12089157104492 256 53.34576034545898 256.223876953125 53.34576034545898 256.5 L 53.34576034545898 257.6333312988281 C 53.34576034545898 257.9095153808594 53.12089157104492 258.1333312988281 52.84354400634766 258.1333312988281 Z" fill="#3c58a0" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-115.18, -251.73)" d="M 121.1105575561523 258.1333312988281 L 119.9722213745117 258.1333312988281 C 119.6948776245117 258.1333312988281 119.4700088500977 257.9094543457031 119.4700088500977 257.6333312988281 L 119.4700088500977 256.5 C 119.4700088500977 256.223876953125 119.6948776245117 256 119.9722213745117 256 L 121.1105575561523 256 C 121.3879013061523 256 121.6127700805664 256.223876953125 121.6127700805664 256.5 L 121.6127700805664 257.6333312988281 C 121.6127700805664 257.9095153808594 121.3879013061523 258.1333312988281 121.1105575561523 258.1333312988281 Z" fill="#3c58a0" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-179.16, -251.73)" d="M 189.3765563964844 258.1333312988281 L 188.2382202148438 258.1333312988281 C 187.9608764648438 258.1333312988281 187.7359619140625 257.9094543457031 187.7359619140625 257.6333312988281 L 187.7359619140625 256.5 C 187.7359619140625 256.223876953125 187.9608764648438 256 188.2382202148438 256 L 189.3765563964844 256 C 189.6539001464844 256 189.8787536621094 256.223876953125 189.8787536621094 256.5 L 189.8787536621094 257.6333312988281 C 189.8787536621094 257.9095153808594 189.6539611816406 258.1333312988281 189.3765563964844 258.1333312988281 Z" fill="#3c58a0" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-243.15, -251.73)" d="M 258.1457824707031 258.13330078125 L 258.1457824707031 256.5332946777344 C 258.1457824707031 256.2387084960938 257.906005859375 255.9999847412109 257.610107421875 255.9999847412109 L 256.5387268066406 255.9999847412109 C 256.2428283691406 255.9999847412109 256.0030517578125 256.2387084960938 256.0030517578125 256.5332946777344 L 256.0030517578125 257.5999755859375 C 256.0030517578125 257.8945617675781 256.242919921875 258.13330078125 256.5387268066406 258.13330078125 L 258.1457824707031 258.13330078125 Z" fill="#3c58a0" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-51.2, -315.73)" d="M 52.84354400634766 326.4003295898438 L 51.70521926879883 326.4003295898438 C 51.42787170410156 326.4003295898438 51.2030029296875 326.1763916015625 51.2030029296875 325.9003295898438 L 51.2030029296875 324.7669982910156 C 51.2030029296875 324.4908752441406 51.42787170410156 324.2669982910156 51.70521926879883 324.2669982910156 L 52.84354400634766 324.2669982910156 C 53.12089157104492 324.2669982910156 53.34576034545898 324.4908752441406 53.34576034545898 324.7669982910156 L 53.34576034545898 325.9003295898438 C 53.34576034545898 326.1763916015625 53.12089157104492 326.4003295898438 52.84354400634766 326.4003295898438 Z" fill="#3c58a0" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-115.18, -315.73)" d="M 121.1105575561523 326.4003295898438 L 119.9722213745117 326.4003295898438 C 119.6948776245117 326.4003295898438 119.4700088500977 326.1763916015625 119.4700088500977 325.9003295898438 L 119.4700088500977 324.7669982910156 C 119.4700088500977 324.4908752441406 119.6948776245117 324.2669982910156 119.9722213745117 324.2669982910156 L 121.1105575561523 324.2669982910156 C 121.3879013061523 324.2669982910156 121.6127700805664 324.4908752441406 121.6127700805664 324.7669982910156 L 121.6127700805664 325.9003295898438 C 121.6127700805664 326.1763916015625 121.3879013061523 326.4003295898438 121.1105575561523 326.4003295898438 Z" fill="#3c58a0" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-179.16, -315.73)" d="M 189.3765563964844 326.4003295898438 L 188.2382202148438 326.4003295898438 C 187.9608764648438 326.4003295898438 187.7359619140625 326.1763916015625 187.7359619140625 325.9003295898438 L 187.7359619140625 324.7669982910156 C 187.7359619140625 324.4908752441406 187.9608764648438 324.2669982910156 188.2382202148438 324.2669982910156 L 189.3765563964844 324.2669982910156 C 189.6539001464844 324.2669982910156 189.8787536621094 324.4908752441406 189.8787536621094 324.7669982910156 L 189.8787536621094 325.9003295898438 C 189.8787536621094 326.1763916015625 189.6539611816406 326.4003295898438 189.3765563964844 326.4003295898438 Z" fill="#3c58a0" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_m5e95c =
    '<svg viewBox="0.0 4.3 27.9 22.4" ><path transform="translate(-17.06, -336.0)" d="M 31.44560241699219 362.6666564941406 L 19.20169067382812 362.6666564941406 C 18.01828765869141 362.6666564941406 17.05899620056152 361.7115478515625 17.05899620056152 360.5334167480469 L 17.05899620056152 358.4000244140625 L 33.50379943847656 358.4000244140625 L 31.44560241699219 362.6666564941406 Z" fill="#d3dcfb" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-17.06, -64.0)" d="M 44.91718292236328 73.59937286376953 L 44.91718292236328 82.56174468994141 L 44.91718292236328 88.53261566162109 L 19.20170783996582 88.53261566162109 C 18.01830291748047 88.53261566162109 17.05900955200195 87.57747650146484 17.05900955200195 86.39930725097656 L 17.05900955200195 73.59937286376953 L 32.05951309204102 68.26599884033203 L 44.91718292236328 73.59937286376953 Z" fill="#ebf5fc" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_o7fnax =
    '<svg viewBox="0.0 0.0 2.4 1.0" ><path transform="translate(-94.67, -60.54)" d="M 96.54571533203125 61.50675582885742 L 95.15100860595703 61.50675582885742 C 94.88308715820312 61.50675582885742 94.66600036621094 61.29056549072266 94.66600036621094 61.02388000488281 C 94.66600036621094 60.75719451904297 94.88314056396484 60.5410041809082 95.15100860595703 60.5410041809082 L 96.54571533203125 60.5410041809082 C 96.81365966796875 60.5410041809082 97.03073883056641 60.75719451904297 97.03073883056641 61.02388000488281 C 97.03073883056641 61.29056549072266 96.81357574462891 61.50675582885742 96.54571533203125 61.50675582885742 Z" fill="#e80054" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_c19izm =
    '<svg viewBox="0.0 0.0 2.4 1.0" ><path transform="translate(-149.25, -60.54)" d="M 151.1277465820312 61.50675582885742 L 149.7330017089844 61.50675582885742 C 149.465087890625 61.50675582885742 149.2480163574219 61.29056549072266 149.2480163574219 61.02388000488281 C 149.2480163574219 60.75719451904297 149.4651489257812 60.5410041809082 149.7330017089844 60.5410041809082 L 151.1277465820312 60.5410041809082 C 151.3956298828125 60.5410041809082 151.6127624511719 60.75719451904297 151.6127624511719 61.02388000488281 C 151.6127624511719 61.29056549072266 151.3956298828125 61.50675582885742 151.1277465820312 61.50675582885742 Z" fill="#e80054" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_8i2lsx =
    '<svg viewBox="0.0 0.0 2.4 1.0" ><path transform="translate(-290.94, -60.54)" d="M 292.8227844238281 61.50675582885742 L 291.4280090332031 61.50675582885742 C 291.1600952148438 61.50675582885742 290.9430236816406 61.29056549072266 290.9430236816406 61.02388000488281 C 290.9430236816406 60.75719451904297 291.16015625 60.5410041809082 291.4280090332031 60.5410041809082 L 292.8227844238281 60.5410041809082 C 293.0907287597656 60.5410041809082 293.3078308105469 60.75719451904297 293.3078308105469 61.02388000488281 C 293.3078308105469 61.29056549072266 293.0907287597656 61.50675582885742 292.8227844238281 61.50675582885742 Z" fill="#e80054" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_elh1np =
    '<svg viewBox="0.0 0.0 2.4 1.0" ><path transform="translate(-345.53, -60.54)" d="M 347.40576171875 61.50675582885742 L 346.010986328125 61.50675582885742 C 345.7431030273438 61.50675582885742 345.5260620117188 61.29056549072266 345.5260620117188 61.02388000488281 C 345.5260620117188 60.75719451904297 345.7431640625 60.5410041809082 346.010986328125 60.5410041809082 L 347.40576171875 60.5410041809082 C 347.6737670898438 60.5410041809082 347.8908081054688 60.75719451904297 347.8908081054688 61.02388000488281 C 347.8908081054688 61.29056549072266 347.6737060546875 61.50675582885742 347.40576171875 61.50675582885742 Z" fill="#e80054" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_9dl42x =
    '<svg viewBox="0.0 2.1 27.9 22.4" ><path transform="translate(-373.85, -176.0)" d="M 399.0426940917969 187.7330017089844 L 397.9347229003906 187.7330017089844 C 397.8676147460938 187.7330017089844 397.8038024902344 187.7461242675781 397.7449645996094 187.7691802978516 C 397.9367065429688 187.8445587158203 398.0726013183594 188.0303039550781 398.0726013183594 188.2480621337891 L 398.0726013183594 189.3511810302734 C 398.0726013183594 189.5689392089844 397.9366455078125 189.7546844482422 397.7449645996094 189.830078125 C 397.8038024902344 189.8531799316406 397.8676147460938 189.8663177490234 397.9347229003906 189.8663177490234 L 399.0426940917969 189.8663177490234 C 399.3284301757812 189.8663177490234 399.5600891113281 189.6356964111328 399.5600891113281 189.3512573242188 L 399.5600891113281 188.2481079101562 C 399.5600280761719 187.963623046875 399.3283386230469 187.7330017089844 399.0426940917969 187.7330017089844 Z" fill="#2a428c" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-309.87, -176.0)" d="M 330.7756958007812 187.7330017089844 L 329.6676635742188 187.7330017089844 C 329.6006469726562 187.7330017089844 329.5368347167969 187.7461242675781 329.4779663085938 187.7691802978516 C 329.6697692871094 187.8445587158203 329.8056335449219 188.0303039550781 329.8056335449219 188.2480621337891 L 329.8056335449219 189.3511810302734 C 329.8056335449219 189.5689392089844 329.6697387695312 189.7546844482422 329.4779663085938 189.830078125 C 329.5368347167969 189.8531799316406 329.6006469726562 189.8663177490234 329.6676635742188 189.8663177490234 L 330.7756958007812 189.8663177490234 C 331.0614318847656 189.8663177490234 331.2929992675781 189.6356964111328 331.2929992675781 189.3512573242188 L 331.2929992675781 188.2481079101562 C 331.2929992675781 187.963623046875 331.0614318847656 187.7330017089844 330.7756958007812 187.7330017089844 Z" fill="#2a428c" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-245.9, -176.0)" d="M 262.520751953125 187.7330017089844 L 261.4127197265625 187.7330017089844 C 261.3456726074219 187.7330017089844 261.2818298339844 187.7461242675781 261.2230224609375 187.7691802978516 C 261.414794921875 187.8445587158203 261.5507202148438 188.0303039550781 261.5507202148438 188.2480621337891 L 261.5507202148438 189.3511810302734 C 261.5507202148438 189.5689392089844 261.414794921875 189.7546844482422 261.2230224609375 189.830078125 C 261.2818298339844 189.8531799316406 261.3456726074219 189.8663177490234 261.4127197265625 189.8663177490234 L 262.520751953125 189.8663177490234 C 262.8064880371094 189.8663177490234 263.0380859375 189.6356964111328 263.0380859375 189.3512573242188 L 263.0380859375 188.2481079101562 C 263.0380554199219 187.963623046875 262.8064575195312 187.7330017089844 262.520751953125 187.7330017089844 Z" fill="#2a428c" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-181.91, -176.0)" d="M 194.2537231445312 187.7330017089844 L 193.1457214355469 187.7330017089844 C 193.0786743164062 187.7330017089844 193.0148315429688 187.7461242675781 192.9559936523438 187.7691802978516 C 193.1477966308594 187.8445587158203 193.2837066650391 188.0303039550781 193.2837066650391 188.2480621337891 L 193.2837066650391 189.3511810302734 C 193.2837066650391 189.5689392089844 193.1477966308594 189.7546844482422 192.9559936523438 189.830078125 C 193.0148315429688 189.8531799316406 193.0786743164062 189.8663177490234 193.1457214355469 189.8663177490234 L 194.2537231445312 189.8663177490234 C 194.5395050048828 189.8663177490234 194.7711334228516 189.6356964111328 194.7711334228516 189.3512573242188 L 194.7711334228516 188.2481079101562 C 194.7710723876953 187.963623046875 194.5395050048828 187.7330017089844 194.2537231445312 187.7330017089844 Z" fill="#2a428c" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-117.93, -176.0)" d="M 125.9867172241211 187.7330017089844 L 124.8787002563477 187.7330017089844 C 124.811653137207 187.7330017089844 124.7478103637695 187.7461242675781 124.6889877319336 187.7691802978516 C 124.8807601928711 187.8445587158203 125.0166397094727 188.0303039550781 125.0166397094727 188.2480621337891 L 125.0166397094727 189.3511810302734 C 125.0166397094727 189.5689392089844 124.8806991577148 189.7546844482422 124.6889877319336 189.830078125 C 124.7478103637695 189.8531799316406 124.811653137207 189.8663177490234 124.8787002563477 189.8663177490234 L 125.9867172241211 189.8663177490234 C 126.2724685668945 189.8663177490234 126.5041275024414 189.6356964111328 126.5041275024414 189.3512573242188 L 126.5041275024414 188.2481079101562 C 126.5041275024414 187.963623046875 126.2724685668945 187.7330017089844 125.9867172241211 187.7330017089844 Z" fill="#2a428c" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-53.95, -176.0)" d="M 57.72071838378906 187.7330017089844 L 56.61271667480469 187.7330017089844 C 56.54567337036133 187.7330017089844 56.4818229675293 187.7461242675781 56.42300033569336 187.7691802978516 C 56.61478805541992 187.8445587158203 56.75069427490234 188.0303039550781 56.75069427490234 188.2480621337891 L 56.75069427490234 189.3511810302734 C 56.75069427490234 189.5689392089844 56.61478805541992 189.7546844482422 56.42300033569336 189.830078125 C 56.4818229675293 189.8531799316406 56.54567337036133 189.8663177490234 56.61271667480469 189.8663177490234 L 57.72071838378906 189.8663177490234 C 58.00648498535156 189.8663177490234 58.23813247680664 189.6356964111328 58.23813247680664 189.3512573242188 L 58.23813247680664 188.2481079101562 C 58.23806381225586 187.963623046875 58.00642013549805 187.7330017089844 57.72071838378906 187.7330017089844 Z" fill="#2a428c" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-53.95, -240.0)" d="M 57.72071838378906 255.9999542236328 L 56.61271667480469 255.9999542236328 C 56.54567337036133 255.9999542236328 56.4818229675293 256.0130615234375 56.42300033569336 256.0361633300781 C 56.61478805541992 256.1115417480469 56.75069427490234 256.2972717285156 56.75069427490234 256.5150146484375 L 56.75069427490234 257.6182250976562 C 56.75069427490234 257.8359985351562 56.61478805541992 258.0216979980469 56.42300033569336 258.0971069335938 C 56.4818229675293 258.1201782226562 56.54567337036133 258.1333312988281 56.61271667480469 258.1333312988281 L 57.72071838378906 258.1333312988281 C 58.00648498535156 258.1333312988281 58.23813247680664 257.9027099609375 58.23813247680664 257.6182861328125 L 58.23813247680664 256.5150756835938 C 58.23806381225586 256.2305908203125 58.00642013549805 255.9999542236328 57.72071838378906 255.9999542236328 Z" fill="#2a428c" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-53.95, -304.0)" d="M 57.72071838378906 324.2669677734375 L 56.61271667480469 324.2669677734375 C 56.54567337036133 324.2669677734375 56.4818229675293 324.2800903320312 56.42300033569336 324.3031311035156 C 56.61478805541992 324.3785095214844 56.75069427490234 324.5642700195312 56.75069427490234 324.7820129394531 L 56.75069427490234 325.88525390625 C 56.75069427490234 326.1029357910156 56.61478805541992 326.2887268066406 56.42300033569336 326.3640747070312 C 56.4818229675293 326.3871765136719 56.54567337036133 326.4003601074219 56.61271667480469 326.4003601074219 L 57.72071838378906 326.4003601074219 C 58.00648498535156 326.4003601074219 58.23813247680664 326.1697082519531 58.23813247680664 325.88525390625 L 58.23813247680664 324.7820739746094 C 58.23806381225586 324.4974975585938 58.00642013549805 324.2669677734375 57.72071838378906 324.2669677734375 Z" fill="#2a428c" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-117.93, -240.0)" d="M 125.9867172241211 255.9999542236328 L 124.8787002563477 255.9999542236328 C 124.811653137207 255.9999542236328 124.7478103637695 256.0130615234375 124.6889877319336 256.0361633300781 C 124.8807601928711 256.1115417480469 125.0166397094727 256.2972717285156 125.0166397094727 256.5150146484375 L 125.0166397094727 257.6182250976562 C 125.0166397094727 257.8359985351562 124.8806991577148 258.0216979980469 124.6889877319336 258.0971069335938 C 124.7478103637695 258.1201782226562 124.811653137207 258.1333312988281 124.8787002563477 258.1333312988281 L 125.9867172241211 258.1333312988281 C 126.2724685668945 258.1333312988281 126.5041275024414 257.9027099609375 126.5041275024414 257.6182861328125 L 126.5041275024414 256.5150756835938 C 126.5041275024414 256.2305908203125 126.2724685668945 255.9999542236328 125.9867172241211 255.9999542236328 Z" fill="#2a428c" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-117.93, -304.0)" d="M 125.9867172241211 324.2669677734375 L 124.8787002563477 324.2669677734375 C 124.811653137207 324.2669677734375 124.7478103637695 324.2800903320312 124.6889877319336 324.3031311035156 C 124.8807601928711 324.3785095214844 125.0166397094727 324.5642700195312 125.0166397094727 324.7820129394531 L 125.0166397094727 325.88525390625 C 125.0166397094727 326.1029357910156 124.8806991577148 326.2887268066406 124.6889877319336 326.3640747070312 C 124.7478103637695 326.3871765136719 124.811653137207 326.4003601074219 124.8787002563477 326.4003601074219 L 125.9867172241211 326.4003601074219 C 126.2724685668945 326.4003601074219 126.5041275024414 326.1697082519531 126.5041275024414 325.88525390625 L 126.5041275024414 324.7820739746094 C 126.5041275024414 324.4974975585938 126.2724685668945 324.2669677734375 125.9867172241211 324.2669677734375 Z" fill="#2a428c" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-181.91, -240.0)" d="M 194.2537231445312 255.9999542236328 L 193.1457214355469 255.9999542236328 C 193.0786743164062 255.9999542236328 193.0148315429688 256.0130615234375 192.9559936523438 256.0361633300781 C 193.1477966308594 256.1115417480469 193.2837066650391 256.2972717285156 193.2837066650391 256.5150146484375 L 193.2837066650391 257.6182250976562 C 193.2837066650391 257.8359985351562 193.1477966308594 258.0216979980469 192.9559936523438 258.0971069335938 C 193.0148315429688 258.1201782226562 193.0786743164062 258.1333312988281 193.1457214355469 258.1333312988281 L 194.2537231445312 258.1333312988281 C 194.5395050048828 258.1333312988281 194.7711334228516 257.9027099609375 194.7711334228516 257.6182861328125 L 194.7711334228516 256.5150756835938 C 194.7710723876953 256.2305908203125 194.5395050048828 255.9999542236328 194.2537231445312 255.9999542236328 Z" fill="#2a428c" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-245.89, -240.0)" d="M 263.0371704101562 258.1333312988281 L 263.0371704101562 256.5150756835938 C 263.0371704101562 256.2306213378906 262.8055114746094 256 262.5197143554688 256 L 261.4117126464844 256 C 261.3446655273438 256 261.2808532714844 256.0131530761719 261.2219848632812 256.0361938476562 C 261.4137878417969 256.111572265625 261.5496826171875 256.2973327636719 261.5496826171875 256.5150756835938 L 261.5496826171875 257.6182556152344 C 261.5496826171875 257.8359985351562 261.4137878417969 258.0217590332031 261.2219848632812 258.09716796875 C 261.2808532714844 258.1202392578125 261.3446655273438 258.1333312988281 261.4117126464844 258.1333312988281 L 263.0371704101562 258.1333312988281 Z" fill="#2a428c" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-181.91, -304.0)" d="M 194.2537231445312 324.2669677734375 L 193.1457214355469 324.2669677734375 C 193.0786743164062 324.2669677734375 193.0148315429688 324.2800903320312 192.9559936523438 324.3031311035156 C 193.1477966308594 324.3785095214844 193.2837066650391 324.5642700195312 193.2837066650391 324.7820129394531 L 193.2837066650391 325.88525390625 C 193.2837066650391 326.1029357910156 193.1477966308594 326.2887268066406 192.9559936523438 326.3640747070312 C 193.0148315429688 326.3871765136719 193.0786743164062 326.4003601074219 193.1457214355469 326.4003601074219 L 194.2537231445312 326.4003601074219 C 194.5395050048828 326.4003601074219 194.7711334228516 326.1697082519531 194.7711334228516 325.88525390625 L 194.7711334228516 324.7820739746094 C 194.7710723876953 324.4974975585938 194.5395050048828 324.2669677734375 194.2537231445312 324.2669677734375 Z" fill="#2a428c" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-410.74, -134.74)" d="M 437.114013671875 143.7209777832031 L 437.114013671875 153.3007965087891 L 437.114013671875 159.2717437744141 L 438.6025085449219 159.2717437744141 L 438.6025085449219 153.3007965087891 L 438.6025085449219 144.3384246826172 L 437.114013671875 143.7209777832031 Z" fill="#d3dcfb" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-17.06, -32.0)" d="M 44.91718292236328 41.60062408447266 L 44.91718292236328 36.26725387573242 C 44.91718292236328 35.08907318115234 43.95783615112305 34.13400650024414 42.77449417114258 34.13400650024414 L 19.20170783996582 34.13400650024414 C 18.01830291748047 34.13400650024414 17.05900955200195 35.08907318115234 17.05900955200195 36.26725387573242 L 17.05900955200195 41.60062408447266 L 44.91718292236328 41.60062408447266 Z" fill="#ff4155" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_mc3wm =
    '<svg viewBox="0.0 0.0 27.9 9.6" ><path transform="translate(-113.03, 0.0)" d="M 122.1374359130859 3.999997615814209 C 122.1374359130859 4.736371994018555 121.5378570556641 5.333310127258301 120.7982025146484 5.333310127258301 C 120.0585784912109 5.333310127258301 119.458984375 4.736371994018555 119.458984375 3.999997615814209 L 119.458984375 1.333311915397644 C 119.4589309692383 0.5969372987747192 120.0585021972656 -1.702989926855025e-08 120.7981414794922 -1.702989926855025e-08 C 121.5377807617188 -1.702989926855025e-08 122.1373596191406 0.5969371199607849 122.1373596191406 1.333311915397644 L 122.1373596191406 3.999997615814209 Z" fill="#ebf5fc" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-296.99, 0.0)" d="M 318.4145202636719 3.999997615814209 C 318.4145202636719 4.736371994018555 317.8149108886719 5.333310127258301 317.0753173828125 5.333310127258301 C 316.335693359375 5.333310127258301 315.7359619140625 4.736371994018555 315.7359619140625 3.999997615814209 L 315.7359619140625 1.333311915397644 C 315.7359619140625 0.5969372987747192 316.3355712890625 -1.702989926855025e-08 317.0751953125 -1.702989926855025e-08 C 317.8148498535156 -1.702989926855025e-08 318.4144287109375 0.5969371199607849 318.4144287109375 1.333311915397644 L 318.4144287109375 3.999997615814209 Z" fill="#ebf5fc" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-305.89, 0.0)" d="M 325.9760131835938 -1.702989926855025e-08 C 325.7010803222656 -1.702989926855025e-08 325.4456787109375 0.08274994045495987 325.2330322265625 0.224249854683876 C 325.5924072265625 0.4633747935295105 325.8292541503906 0.8706870079040527 325.8292541503906 1.333374500274658 L 325.8292541503906 3.999997615814209 C 325.8292541503906 4.46262264251709 325.5924072265625 4.869997501373291 325.2330322265625 5.109122753143311 C 325.4456176757812 5.250560283660889 325.7010803222656 5.333372592926025 325.9760131835938 5.333372592926025 C 326.7156982421875 5.333372592926025 327.3152465820312 4.736435413360596 327.3152465820312 4.000060558319092 L 327.3152465820312 1.333311915397644 C 327.3153381347656 0.5969372987747192 326.7157592773438 -1.702989926855025e-08 325.9760131835938 -1.702989926855025e-08 Z" fill="#d3dcfb" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-121.93, 0.0)" d="M 129.6980285644531 -1.702989926855025e-08 C 129.4230651855469 -1.702989926855025e-08 129.1677093505859 0.08274994045495987 128.9550018310547 0.224249854683876 C 129.3144226074219 0.4633747935295105 129.5512390136719 0.8706870079040527 129.5512390136719 1.333374500274658 L 129.5512390136719 3.999997615814209 C 129.5512390136719 4.46262264251709 129.3144226074219 4.869997501373291 128.9550018310547 5.109122753143311 C 129.1676330566406 5.250560283660889 129.4230651855469 5.333372592926025 129.6980285644531 5.333372592926025 C 130.4376678466797 5.333372592926025 131.0372619628906 4.736435413360596 131.0372619628906 4.000060558319092 L 131.0372619628906 1.333311915397644 C 131.0373077392578 0.5969372987747192 130.437744140625 -1.702989926855025e-08 129.6980285644531 -1.702989926855025e-08 Z" fill="#d3dcfb" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-378.76, -32.0)" d="M 404.4779968261719 34.13300704956055 L 402.989990234375 34.13300704956055 C 404.1734313964844 34.13300704956055 405.1326904296875 35.08806991577148 405.1326904296875 36.26625061035156 L 405.1326904296875 41.59968948364258 L 406.6206665039062 41.59968948364258 L 406.6206665039062 36.26631546020508 C 406.6206970214844 35.08813095092773 405.6613159179688 34.13301086425781 404.4779968261719 34.13301086425781 Z" fill="#e80054" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-17.06, -104.76)" d="M 17.0580005645752 111.7400054931641 L 44.91623687744141 111.7400054931641 L 44.91623687744141 112.7058181762695 L 17.05800437927246 112.7058181762695 L 17.0580005645752 111.7400054931641 Z" fill="#e80054" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_vl8pmh =
    '<svg viewBox="0.0 0.0 1.0 3.6" ><path transform="translate(-359.22, -316.54)" d="M 359.7010192871094 320.1724243164062 C 359.4330444335938 320.1724243164062 359.2159423828125 319.9561767578125 359.2159423828125 319.6895141601562 L 359.2159423828125 317.0228576660156 C 359.2159423828125 316.756103515625 359.4331359863281 316.5399475097656 359.7010192871094 316.5399475097656 C 359.9689025878906 316.5399475097656 360.1859741210938 316.756103515625 360.1859741210938 317.0228576660156 L 360.1859741210938 319.6895141601562 C 360.1859741210938 319.9561767578125 359.9688415527344 320.1724243164062 359.7010192871094 320.1724243164062 Z" fill="#3c58a0" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_nt3fc =
    '<svg viewBox="0.0 0.0 2.6 1.0" ><path transform="translate(-376.28, -376.27)" d="M 378.3741455078125 377.2397766113281 L 376.7669982910156 377.2397766113281 C 376.4990539550781 377.2397766113281 376.2819519042969 377.0235900878906 376.2819519042969 376.7568664550781 C 376.2819519042969 376.4902038574219 376.4991149902344 376.2740478515625 376.7669982910156 376.2740478515625 L 378.3741455078125 376.2740478515625 C 378.64208984375 376.2740478515625 378.8592529296875 376.4902038574219 378.8592529296875 376.7568664550781 C 378.8592529296875 377.0235900878906 378.6419982910156 377.2397766113281 378.3741455078125 377.2397766113281 Z" fill="#3c58a0" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_fqplrf =
    '<svg viewBox="38.3 16.0 8.8 16.0" ><path transform="translate(-316.82, -240.0)" d="M 355.8377990722656 256 C 355.5870056152344 256 355.3390502929688 256.0120239257812 355.0941162109375 256.0344543457031 C 359.1831665039062 256.4081115722656 362.3857116699219 259.8314208984375 362.3857116699219 264 C 362.3857116699219 268.1685791015625 359.18310546875 271.5918579101562 355.093994140625 271.9655456542969 C 355.3389892578125 271.9879455566406 355.5869750976562 272.0000305175781 355.8377380371094 272.0000305175781 C 360.2755737304688 272.0000305175781 363.8731689453125 268.4182739257812 363.8731689453125 264 C 363.8731689453125 259.581787109375 360.275634765625 256 355.8377990722656 256 Z" fill="#1886ea" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-316.82, -272.0)" d="M 355.84619140625 290.1330261230469 C 355.594482421875 290.1330261230469 355.346435546875 290.1488342285156 355.1029357910156 290.1793212890625 C 358.0065612792969 290.5431518554688 360.25244140625 293.0102844238281 360.25244140625 295.9996948242188 C 360.25244140625 298.9891662597656 358.0065612792969 301.4562683105469 355.1029357910156 301.8201293945312 C 355.346435546875 301.8505554199219 355.594482421875 301.8664245605469 355.84619140625 301.8664245605469 C 359.1006774902344 301.8664245605469 361.7388305664062 299.23974609375 361.7388305664062 295.9996948242188 C 361.7388305664062 292.7596435546875 359.1006774902344 290.1330261230469 355.84619140625 290.1330261230469 Z" fill="#d3dcfb" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_y8aftm =
    '<svg viewBox="0.0 0.0 11.5 4.7" ><path transform="translate(-290.67, -202.73)" d="M 301.1630859375 207.4672546386719 L 299.1324462890625 207.4672546386719 C 298.9455261230469 207.4672546386719 298.7940063476562 207.3157348632812 298.7940063476562 207.1288146972656 C 298.7940063476562 206.94189453125 298.9455261230469 206.7903747558594 299.1324462890625 206.7903747558594 L 300.8828430175781 206.7903747558594 C 300.9853515625 206.5013275146484 301.2125854492188 206.2738189697266 301.5015563964844 206.1710205078125 L 301.5015563964844 204.0252838134766 C 301.212646484375 203.9224853515625 300.9853515625 203.6949768066406 300.8828430175781 203.4059295654297 L 299.1324462890625 203.4059295654297 C 298.9455261230469 203.4059295654297 298.7940063476562 203.2544097900391 298.7940063476562 203.0674896240234 C 298.7940063476562 202.8805694580078 298.9455261230469 202.7290496826172 299.1324462890625 202.7290496826172 L 301.1630859375 202.7290496826172 C 301.3500061035156 202.7290496826172 301.5015563964844 202.8805694580078 301.5015563964844 203.0674896240234 C 301.5015563964844 203.2544097900391 301.653076171875 203.4059295654297 301.8399658203125 203.4059295654297 C 302.0268859863281 203.4059295654297 302.1784362792969 203.5574798583984 302.1784362792969 203.7444152832031 L 302.1784362792969 206.4519195556641 C 302.1784362792969 206.6388092041016 302.0268859863281 206.7903747558594 301.8399658203125 206.7903747558594 C 301.653076171875 206.7903747558594 301.5015563964844 206.94189453125 301.5015563964844 207.1288146972656 C 301.5015563964844 207.3157348632812 301.3500061035156 207.4672546386719 301.1630859375 207.4672546386719 Z" fill="#81c784" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-42.79, -202.73)" d="M 45.83999252319336 207.4672546386719 L 43.80934906005859 207.4672546386719 C 43.62243270874023 207.4672546386719 43.47090148925781 207.3157348632812 43.47090148925781 207.1288146972656 C 43.47090148925781 206.94189453125 43.31936264038086 206.7903747558594 43.13245010375977 206.7903747558594 C 42.94553375244141 206.7903747558594 42.79399490356445 206.6388092041016 42.79399490356445 206.4519195556641 L 42.79399490356445 203.7444152832031 C 42.79399490356445 203.5574798583984 42.94553375244141 203.4059295654297 43.13245010375977 203.4059295654297 C 43.31936264038086 203.4059295654297 43.47090148925781 203.2544097900391 43.47090148925781 203.0674896240234 C 43.47090148925781 202.8805694580078 43.62243270874023 202.7290496826172 43.80934906005859 202.7290496826172 L 45.83999252319336 202.7290496826172 C 46.02690887451172 202.7290496826172 46.17844009399414 202.8805694580078 46.17844009399414 203.0674896240234 C 46.17844009399414 203.2544097900391 46.02690887451172 203.4059295654297 45.83999252319336 203.4059295654297 L 44.08957672119141 203.4059295654297 C 43.98709869384766 203.6949768066406 43.75985336303711 203.9224853515625 43.47090148925781 204.0252838134766 L 43.47090148925781 206.1716918945312 C 43.75981903076172 206.2744750976562 43.98709869384766 206.5019836425781 44.08957672119141 206.791015625 L 45.83999252319336 206.791015625 C 46.02690887451172 206.7912902832031 46.17822265625 206.9430236816406 46.17797088623047 207.1299133300781 C 46.17771530151367 207.3164978027344 46.02655792236328 207.4676361083984 45.83999252319336 207.4678955078125 L 45.83999252319336 207.4672546386719 Z" fill="#81c784" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_tdn4ix =
    '<svg viewBox="0.0 0.0 16.2 8.8" ><path transform="translate(-236.64, -121.94)" d="M 252.8908386230469 122.2804946899414 L 252.8908386230469 129.0493011474609 C 252.8911895751953 129.162841796875 252.8354187011719 129.2692108154297 252.741943359375 129.3336029052734 L 250.7112731933594 130.6873779296875 C 250.6539001464844 130.7216339111328 250.5885620117188 130.7403106689453 250.5217590332031 130.7415313720703 C 250.4703063964844 130.7407836914062 250.4196014404297 130.7292175292969 250.3728637695312 130.7076721191406 L 244.3960113525391 127.7226181030273 L 252.8367156982422 122.0909805297852 C 252.8718109130859 122.1479721069336 252.8905334472656 122.2135620117188 252.8908386230469 122.2804946899414 Z" fill="#388e3c" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(0.0, -117.4)" d="M 16.19477462768555 117.5457992553711 L 7.754085063934326 123.1774368286133 L 0.1932986378669739 119.3936614990234 C 0.02437441982328892 119.3136138916016 -0.04764999449253082 119.1118316650391 0.03240180015563965 118.9429016113281 C 0.05905400961637497 118.8866729736328 0.100682221353054 118.8389053344727 0.1526857167482376 118.804801940918 L 2.183330059051514 117.4510116577148 C 2.240314960479736 117.4158782958984 2.305898427963257 117.3971252441406 2.372846364974976 117.396842956543 L 15.91048526763916 117.396842956543 C 16.02410507202148 117.3962707519531 16.13059043884277 117.4520568847656 16.19477462768555 117.5457992553711 Z" fill="#66bb6a" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-0.12, -158.71)" d="M 0.4664515554904938 160.0639953613281 L 14.00409317016602 160.0639953613281 C 14.19100761413574 160.0639953613281 14.34254264831543 160.2155456542969 14.34254264831543 160.4024353027344 L 14.34254264831543 167.1712646484375 C 14.34254264831543 167.358154296875 14.19100761413574 167.5097198486328 14.00409317016602 167.5097198486328 L 0.4664515554904938 167.5097198486328 C 0.2795370519161224 167.5097198486328 0.1280002593994141 167.358154296875 0.1280002593994141 167.1712646484375 L 0.1280002593994141 160.4024353027344 C 0.1280002593994141 160.2155456542969 0.2795370519161224 160.0639953613281 0.4664515554904938 160.0639953613281 Z" fill="#4caf50" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_6gumse =
    '<svg viewBox="5.4 0.0 6.2 8.8" ><path transform="translate(-165.38, -117.4)" d="M 173.0618438720703 117.3970031738281 L 170.7949981689453 118.9077911376953 L 170.7949981689453 126.1964797973633 L 174.1793975830078 126.1964797973633 L 174.1793975830078 119.2706146240234 L 176.9891204833984 117.3970031738281 L 173.0618438720703 117.3970031738281 Z" fill="#ffc107" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_er1dus =
    '<svg viewBox="0.0 0.0 30.0 30.0" ><path transform="translate(2.69, 2.57)" d="M 25.1490478515625 10.27200317382812 C 24.63157653808594 10.27200317382812 24.21035194396973 10.69197940826416 24.21035194396973 11.20944786071777 C 24.21035194396973 16.81410026550293 20.30809211730957 21.51631546020508 15.08091068267822 22.76998710632324 L 15.08091068267822 21.60130882263184 C 15.08091068267822 20.76885986328125 14.07222175598145 20.34763717651367 13.4810094833374 20.9388484954834 L 11.03490924835205 23.38369750976562 C 10.66868114471436 23.74992370605469 10.66868114471436 24.34364128112793 11.03490924835205 24.70986747741699 L 13.4810094833374 27.15597343444824 C 14.06722450256348 27.74218368530273 15.08091068267822 27.33221244812012 15.08091068267822 26.4935131072998 L 15.08091068267822 24.70487022399902 C 21.35302734375 23.41869735717773 26.08523750305176 17.85653877258301 26.08523750305176 11.20944786071777 C 26.08648300170898 10.69197940826416 25.66651344299316 10.27200317382812 25.1490478515625 10.27200317382812 Z" fill="#00a7ff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(0.0, 1.0)" d="M 11.02918529510498 23.98007202148438 C 6.284474849700928 22.31767463684082 3.097169399261475 17.81295204162598 3.097169399261475 12.77326107025146 C 3.097169399261475 11.34459972381592 3.354653835296631 9.959683418273926 3.838373899459839 8.656013488769531 L 4.962055683135986 9.304723739624023 C 5.680761337280273 9.722197532653809 6.551958084106445 9.059739112854004 6.336971282958984 8.249788284301758 L 5.387030601501465 4.707504272460938 C 5.252038955688477 4.210034370422363 4.749569416046143 3.916302919387817 4.238349914550781 4.045044422149658 L 0.6935666799545288 4.993736267089844 C -0.1113841310143471 5.209972381591797 -0.2526255548000336 6.296156883239746 0.4685803353786469 6.711131572723389 L 2.192224740982056 7.706071376800537 C 1.557263731956482 9.300973892211914 1.223534226417542 11.01211833953857 1.223534226417542 12.77451038360596 C 1.223534226417542 18.61040115356445 4.915809154510498 23.82508087158203 10.41047382354736 25.75121688842773 C 10.90544414520264 25.92245483398438 11.43541145324707 25.66121864318848 11.60540103912354 25.17624855041504 C 11.775390625 24.68752670288086 11.51790809631348 24.15256309509277 11.02918529510498 23.98007202148438 Z" fill="#00a7ff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(1.23, 0.0)" d="M 27.59090423583984 6.1458740234375 L 25.57353019714355 6.68584156036377 C 23.12118148803711 2.631088733673096 18.64895820617676 -1.589457241379932e-07 13.77175331115723 -1.589457241379932e-07 C 10.63194370269775 -1.589457241379932e-07 7.689623355865479 1.031186819076538 5.261022567749023 2.983567476272583 C 4.857297420501709 3.307297706604004 4.793551445007324 3.897261619567871 5.117281913757324 4.299737453460693 C 5.443512439727783 4.7047119140625 6.0322265625 4.767208576202393 6.435951232910156 4.443479061126709 C 8.528322219848633 2.763581037521362 11.06441974639893 1.874885201454163 13.77175331115723 1.874885201454163 C 17.80025672912598 1.874885201454163 21.50253295898438 3.954758405685425 23.67239952087402 7.195811748504639 L 22.5799617767334 7.488293647766113 C 21.77501678466797 7.70452880859375 21.63376998901367 8.788212776184082 22.35372734069824 9.205687522888184 L 25.52978706359863 11.04057502746582 C 25.74602127075195 11.16556835174561 25.99975204467773 11.1980676651001 26.24223899841309 11.13431930541992 C 26.48097229003906 11.06932353973389 26.68596267700195 10.91183280944824 26.81095695495605 10.69684600830078 L 28.64583969116211 7.520790100097656 C 29.05956268310547 6.800833225250244 28.40335273742676 5.930887699127197 27.59090423583984 6.1458740234375 Z" fill="#00a7ff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_nnq8og =
    '<svg viewBox="3.2 1.2 23.5 27.6" ><path transform="translate(-139.48, -139.53)" d="M 154.4799957275391 148 C 150.9011993408203 148 148 150.9246063232422 148 154.5322570800781 C 148 158.1399078369141 150.9011993408203 161.0645141601562 154.4799957275391 161.0645141601562 C 158.0587921142578 161.0645141601562 160.9600067138672 158.1399078369141 160.9600067138672 154.5322570800781 C 160.9559326171875 150.9262847900391 158.0571136474609 148.0040893554688 154.4799957275391 148.0000152587891 Z M 155.1999969482422 159.5602111816406 L 155.1999969482422 158.8871002197266 C 155.1999969482422 158.4862365722656 154.8776397705078 158.1612854003906 154.4799957275391 158.1612854003906 C 154.0823516845703 158.1612854003906 153.760009765625 158.4862365722656 153.760009765625 158.8871002197266 L 153.760009765625 159.5602111816406 C 151.5503234863281 159.2350311279297 149.8148345947266 157.4855499267578 149.4922637939453 155.258056640625 L 150.1600036621094 155.258056640625 C 150.5576477050781 155.258056640625 150.8799896240234 154.93310546875 150.8799896240234 154.5322570800781 C 150.8799896240234 154.1314086914062 150.5576477050781 153.8064575195312 150.1600036621094 153.8064575195312 L 149.4922637939453 153.8064575195312 C 149.8148345947266 151.5789642333984 151.5503234863281 149.8294677734375 153.760009765625 149.5042877197266 L 153.760009765625 150.1774139404297 C 153.760009765625 150.5782623291016 154.0823516845703 150.9032287597656 154.4799957275391 150.9032287597656 C 154.8776397705078 150.9032287597656 155.1999969482422 150.5782623291016 155.1999969482422 150.1774139404297 L 155.1999969482422 149.5042877197266 C 157.4096832275391 149.8294677734375 159.1451721191406 151.5789642333984 159.4677429199219 153.8064575195312 L 158.7999877929688 153.8064575195312 C 158.40234375 153.8064575195312 158.0800018310547 154.1314086914062 158.0800018310547 154.5322570800781 C 158.0800018310547 154.93310546875 158.40234375 155.258056640625 158.7999877929688 155.258056640625 L 159.4677429199219 155.258056640625 C 159.1451721191406 157.4855499267578 157.4096832275391 159.2350311279297 155.1999969482422 159.5602111816406 Z" fill="#1ca7fc" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-199.64, -199.66)" d="M 214.6402587890625 215.3880767822266 C 214.5283660888672 215.3880767822266 214.4181671142578 215.3618011474609 214.3182830810547 215.3113555908203 L 212.3984222412109 214.3436889648438 C 212.0427551269531 214.1644134521484 211.8985900878906 213.7284393310547 212.0764617919922 213.3699035644531 C 212.2543029785156 213.0113677978516 212.6867828369141 212.8660736083984 213.0424346923828 213.0453491210938 L 214.498046875 213.7791900634766 L 216.0511474609375 212.2136383056641 C 216.3323059082031 211.93017578125 216.7881927490234 211.93017578125 217.0693664550781 212.2136077880859 C 217.3505554199219 212.4970703125 217.3505554199219 212.9566192626953 217.0693664550781 213.2400665283203 L 215.1493530273438 215.1755218505859 C 215.0143585205078 215.3116760253906 214.8312072753906 215.3881530761719 214.6402435302734 215.3880767822266 Z" fill="#fd4155" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-56.76, -26.79)" d="M 73.22908782958984 30.14811515808105 L 71.30908966064453 28.21263313293457 C 71.02791595458984 27.92916870117188 70.57205200195312 27.92916870117188 70.29087066650391 28.21261405944824 C 70.00968933105469 28.49605751037598 70.00968933105469 28.95561408996582 70.29087066650391 29.23905944824219 L 71.00656890869141 29.96055603027344 C 64.87197875976562 30.35351943969727 59.99998092651367 35.50873947143555 59.99998092651367 41.79034423828125 C 59.99998092651367 42.19119262695312 60.32233810424805 42.51614761352539 60.71998596191406 42.51614761352539 C 61.11763000488281 42.51614761352539 61.43998336791992 42.19119262695312 61.43998336791992 41.79034423828125 C 61.43998336791992 36.32865524291992 65.63668060302734 31.83682060241699 70.94998168945312 31.41905975341797 L 70.29087829589844 32.08359909057617 C 70.00968933105469 32.36702728271484 70.00968933105469 32.82658004760742 70.29087066650391 33.11002349853516 C 70.57205200195312 33.39346694946289 71.02791595458984 33.39346694946289 71.30909729003906 33.11002349853516 L 73.22908782958984 31.17452239990234 C 73.51024627685547 30.89108085632324 73.51024627685547 30.43155670166016 73.22908782958984 30.14811515808105 Z" fill="#fd4155" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-214.68, -229.73)" d="M 241.4414672851562 244.7257995605469 C 241.4414672851562 244.324951171875 241.1190948486328 243.9999694824219 240.7214508056641 243.9999694824219 C 240.3238067626953 243.9999694824219 240.0014495849609 244.324951171875 240.0014495849609 244.7257995605469 C 240.0014495849609 250.1874694824219 235.8046875 254.6793518066406 230.491455078125 255.0970764160156 L 231.1506042480469 254.4325561523438 C 231.4318084716797 254.1491088867188 231.4318084716797 253.6895751953125 231.150634765625 253.4061279296875 C 230.8694610595703 253.1226501464844 230.4135894775391 253.1226501464844 230.1324157714844 253.4061279296875 L 228.2124328613281 255.3416137695312 C 227.9312591552734 255.6250915527344 227.9312591552734 256.0845947265625 228.2124328613281 256.3680419921875 L 230.1324157714844 258.3035278320312 C 230.4135894775391 258.5869750976562 230.8694458007812 258.5869750976562 231.150634765625 258.3035278320312 C 231.4318084716797 258.0201110839844 231.4318084716797 257.5605163574219 231.150634765625 257.277099609375 L 230.4349517822266 256.5555725097656 C 236.5694580078125 256.1626281738281 241.4414672851562 251.0074157714844 241.4414672851562 244.7257995605469 Z" fill="#fd4155" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_sq1ubp =
    '<svg viewBox="0.0 17.1 8.3 12.9" ><path transform="translate(-7.88, -361.26)" d="M 13.99999523162842 384 L 10.15999603271484 384 C 8.967610359191895 384.0013122558594 8.00131893157959 384.9754028320312 7.999995708465576 386.1774291992188 L 7.999996185302734 390.5322265625 C 7.999996185302734 390.9330749511719 8.32235050201416 391.258056640625 8.719996452331543 391.258056640625 L 15.43999576568604 391.258056640625 C 15.83763980865479 391.258056640625 16.15999603271484 390.9330749511719 16.15999603271484 390.5322265625 L 16.15999603271484 386.1774291992188 C 16.15867233276367 384.9754028320312 15.19238185882568 384.0013122558594 13.99999523162842 384 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-6.0, -272.94)" d="M 12.62192344665527 291.4102172851562 C 12.3028450012207 290.766845703125 11.62364387512207 289.9999084472656 10.19996452331543 289.9999084472656 L 6.362784862518311 289.9999084472656 C 6.164366722106934 289.998779296875 6.002272129058838 290.1593627929688 5.999965190887451 290.3593444824219 C 5.997744560241699 292.0563659667969 7.617204189300537 292.2751159667969 7.685965061187744 292.2982788085938 C 7.722723007202148 292.3106384277344 7.761218547821045 292.3169250488281 7.799964904785156 292.3169250488281 L 11.39996528625488 292.2982788085938 L 11.87996482849121 294.5785217285156 C 11.87986373901367 294.6839294433594 11.94745445251465 294.7772521972656 12.04706001281738 294.8092651367188 C 12.14666557312012 294.8412780761719 12.25537109375 294.8046264648438 12.31580543518066 294.7185974121094 C 12.61580467224121 294.2942504882812 12.95996475219727 293.6161193847656 12.95996475219727 292.7821655273438 C 12.94441223144531 292.3059387207031 12.82921600341797 291.8384094238281 12.62192344665527 291.4102172851562 Z" fill="#42425d" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_2smh0m =
    '<svg viewBox="21.7 0.0 8.3 12.9" ><path transform="translate(-348.16, -96.31)" d="M 376 102 L 372.1599731445312 102 C 370.9675903320312 102.0013275146484 370.0013122558594 102.9754180908203 369.9999694824219 104.1774139404297 L 369.9999694824219 108.5322570800781 C 369.9999694824219 108.93310546875 370.3223571777344 109.258056640625 370.7200012207031 109.258056640625 L 377.4399719238281 109.258056640625 C 377.8376159667969 109.258056640625 378.1599731445312 108.93310546875 378.1599731445312 108.5322570800781 L 378.1599731445312 104.1774139404297 C 378.1586608886719 102.9754180908203 377.1923522949219 102.001335144043 376 102 Z" fill="#707070" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-346.28, -8.0)" d="M 374.6218872070312 9.410207748413086 C 374.3028259277344 8.766840934753418 373.6235961914062 7.999905586242676 372.1998901367188 7.999905586242676 L 368.3627319335938 7.999905586242676 C 368.164306640625 7.998761177062988 368.002197265625 8.15935230255127 367.9999084472656 8.359359741210938 C 367.9977416992188 10.05635547637939 369.6171569824219 10.27512550354004 369.6859130859375 10.29829120635986 C 369.7226867675781 10.31064510345459 369.7611999511719 10.31693649291992 369.7999572753906 10.31692028045654 L 373.39990234375 10.29829120635986 L 373.8798828125 12.57853221893311 C 373.8798522949219 12.68392086029053 373.9474487304688 12.77725219726562 374.0470275878906 12.80926609039307 C 374.1466064453125 12.84127902984619 374.2553100585938 12.80461120605469 374.3157958984375 12.71861267089844 C 374.6157836914062 12.29425811767578 374.9598999023438 11.61611270904541 374.9598999023438 10.78216171264648 C 374.9443359375 10.30594539642334 374.8291320800781 9.838415145874023 374.6218872070312 9.410207748413086 Z" fill="#42425d" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_hvl2vt =
    '<svg viewBox="520.3 422.4 30.0 30.0" ><path transform="translate(537.9, 440.04)" d="M 5.625 0 C 8.731601715087891 0 11.25 2.518398761749268 11.25 5.625 C 11.25 8.731601715087891 8.731601715087891 11.25 5.625 11.25 C 2.518398761749268 11.25 0 8.731601715087891 0 5.625 C 0 2.518398761749268 2.518398761749268 0 5.625 0 Z" fill="#fec12d" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(7.11, 6.5)" d="M 536.9844970703125 442.1900024414062 L 536.9844970703125 442.3715209960938 C 536.9844970703125 442.6700439453125 536.7295532226562 442.9130249023438 536.4159545898438 442.9130249023438 C 536.1024780273438 442.9130249023438 535.8489379882812 442.6700439453125 535.8489379882812 442.3715209960938 L 535.8489379882812 442.1915283203125 C 535.1530151367188 441.9905395507812 534.6325073242188 441.4340209960938 534.5110473632812 440.7500610351562 C 534.4869995117188 440.6119995117188 534.5199584960938 440.4725341796875 534.6024780273438 440.3555297851562 C 534.6909790039062 440.2325439453125 534.8245239257812 440.1500244140625 534.9790649414062 440.1260375976562 L 535.0719604492188 440.1184692382812 C 535.3510131835938 440.1184692382812 535.5850219726562 440.3090209960938 535.6315307617188 440.5700073242188 C 535.6959838867188 440.9285278320312 536.0260620117188 441.1880493164062 536.4159545898438 441.1880493164062 C 536.8555297851562 441.1880493164062 537.2124633789062 440.85498046875 537.2124633789062 440.447021484375 C 537.2124633789062 440.0375366210938 536.8555297851562 439.7045288085938 536.4159545898438 439.7045288085938 C 535.3510131835938 439.7045288085938 534.4840087890625 438.885498046875 534.4840087890625 437.8790283203125 C 534.4840087890625 437.0750122070312 535.0420532226562 436.3699951171875 535.8489379882812 436.134521484375 L 535.8489379882812 435.9545288085938 C 535.8489379882812 435.6560668945312 536.1024780273438 435.4130249023438 536.4159545898438 435.4130249023438 C 536.7295532226562 435.4130249023438 536.9844970703125 435.6560668945312 536.9844970703125 435.9545288085938 L 536.9844970703125 436.134521484375 C 537.6804809570312 436.3355102539062 538.1995239257812 436.8920288085938 538.3209838867188 437.5745239257812 C 538.344970703125 437.7139892578125 538.3134765625 437.85498046875 538.2310180664062 437.9705200195312 C 538.1424560546875 438.0935668945312 538.0089721679688 438.176025390625 537.8545532226562 438.2000122070312 L 537.7600708007812 438.20751953125 C 537.4824829101562 438.20751953125 537.2470092773438 438.0170288085938 537.2020263671875 437.7560424804688 C 537.1375122070312 437.3975219726562 536.8075561523438 437.1380004882812 536.4159545898438 437.1380004882812 C 535.9779663085938 437.1380004882812 535.6210327148438 437.4710083007812 535.6210327148438 437.8790283203125 C 535.6210327148438 438.2885131835938 535.9779663085938 438.6215209960938 536.4159545898438 438.6215209960938 C 537.4824829101562 438.6215209960938 538.3479614257812 439.4404907226562 538.3479614257812 440.447021484375 C 538.3479614257812 441.2510375976562 537.7915649414062 441.95751953125 536.9844970703125 442.1900024414062 Z" fill="#101010" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(0.0, 0.0)" d="M 538.8780517578125 434.0079956054688 L 536.20947265625 435.6610107421875 L 536.20947265625 430.2880249023438 C 536.20947265625 429.7705078125 535.78955078125 429.3505249023438 535.27197265625 429.3505249023438 C 534.7545166015625 429.3505249023438 534.33447265625 429.7705078125 534.33447265625 430.2880249023438 L 534.33447265625 437.4130249023438 C 534.33447265625 437.759521484375 534.5250244140625 438.0775146484375 534.8294677734375 438.239501953125 C 534.968994140625 438.3145141601562 535.1205444335938 438.3505249023438 535.27197265625 438.3505249023438 C 535.4534912109375 438.3505249023438 535.635009765625 438.2980346679688 535.7925415039062 438.1930541992188 L 539.9175415039062 435.5680541992188 C 540.3480224609375 435.2815551757812 540.4650268554688 434.6995239257812 540.177001953125 434.2675170898438 C 539.8905029296875 433.8385009765625 539.3070068359375 433.7230224609375 538.8780517578125 434.0079956054688 Z M 535.27197265625 428.2255249023438 C 535.78955078125 428.2255249023438 536.20947265625 427.8054809570312 536.20947265625 427.2880249023438 L 536.20947265625 425.7880249023438 C 536.20947265625 425.2705078125 535.78955078125 424.8505249023438 535.27197265625 424.8505249023438 C 534.7545166015625 424.8505249023438 534.33447265625 425.2705078125 534.33447265625 425.7880249023438 L 534.33447265625 427.2880249023438 C 534.33447265625 427.8054809570312 534.7545166015625 428.2255249023438 535.27197265625 428.2255249023438 Z M 534.33447265625 447.5380249023438 L 534.33447265625 449.0380249023438 C 534.33447265625 449.5554809570312 534.7545166015625 449.9755249023438 535.27197265625 449.9755249023438 C 535.78955078125 449.9755249023438 536.20947265625 449.5554809570312 536.20947265625 449.0380249023438 L 536.20947265625 447.5380249023438 C 536.20947265625 447.0205078125 535.78955078125 446.6005249023438 535.27197265625 446.6005249023438 C 534.7545166015625 446.6005249023438 534.33447265625 447.0205078125 534.33447265625 447.5380249023438 Z M 525.14697265625 436.4755249023438 L 523.64697265625 436.4755249023438 C 523.1295166015625 436.4755249023438 522.70947265625 436.8955078125 522.70947265625 437.4130249023438 C 522.70947265625 437.9304809570312 523.1295166015625 438.3505249023438 523.64697265625 438.3505249023438 L 525.14697265625 438.3505249023438 C 525.66455078125 438.3505249023438 526.08447265625 437.9304809570312 526.08447265625 437.4130249023438 C 526.08447265625 436.8955078125 525.66455078125 436.4755249023438 525.14697265625 436.4755249023438 Z M 546.89697265625 436.4755249023438 L 545.39697265625 436.4755249023438 C 544.8795166015625 436.4755249023438 544.45947265625 436.8955078125 544.45947265625 437.4130249023438 C 544.45947265625 437.9304809570312 544.8795166015625 438.3505249023438 545.39697265625 438.3505249023438 L 546.89697265625 438.3505249023438 C 547.41455078125 438.3505249023438 547.83447265625 437.9304809570312 547.83447265625 437.4130249023438 C 547.83447265625 436.8955078125 547.41455078125 436.4755249023438 546.89697265625 436.4755249023438 Z M 535.27197265625 422.4130249023438 C 527.0009765625 422.4130249023438 520.27197265625 429.1420288085938 520.27197265625 437.4130249023438 C 520.27197265625 445.6840209960938 527.0009765625 452.4130249023438 535.27197265625 452.4130249023438 C 536.1165771484375 452.4130249023438 536.9655151367188 452.342529296875 537.7935180664062 452.2015380859375 C 538.033447265625 452.1610107421875 538.2705078125 452.1160278320312 538.5059814453125 452.0635375976562 C 539.0115356445312 451.9540405273438 539.3294677734375 451.4530639648438 539.219970703125 450.9490356445312 C 539.1104736328125 450.4435424804688 538.6109619140625 450.1165161132812 538.1069946289062 450.2335205078125 C 537.9015502929688 450.2785034179688 537.6929931640625 450.3190307617188 537.4815063476562 450.35498046875 C 536.757080078125 450.4779663085938 536.0130004882812 450.5394897460938 535.27197265625 450.5394897460938 C 528.032958984375 450.5394897460938 522.1424560546875 444.6505126953125 522.1424560546875 437.4130249023438 C 522.1424560546875 430.175537109375 528.032958984375 424.2864990234375 535.27197265625 424.2864990234375 C 542.5125122070312 424.2864990234375 548.4015502929688 430.175537109375 548.4015502929688 437.4130249023438 C 548.4015502929688 438.2365112304688 548.3250122070312 439.0599975585938 548.1734619140625 439.8610229492188 L 548.0999755859375 440.2269897460938 C 547.989013671875 440.7310180664062 548.3070068359375 441.2320556640625 548.8125 441.343017578125 C 549.3134765625 441.4540405273438 549.814453125 441.134521484375 549.927001953125 440.6290283203125 L 550.0125122070312 440.2090454101562 C 550.1849975585938 439.29248046875 550.27197265625 438.3519897460938 550.27197265625 437.4130249023438 C 550.27197265625 429.1420288085938 543.5430297851562 422.4130249023438 535.27197265625 422.4130249023438 Z" fill="#1ca7fc" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_e2s4zl =
    '<svg viewBox="333.0 128.0 10.0 12.0" ><path transform="translate(-219.17, -371.55)" d="M 557.1554565429688 506.7774963378906 C 557.2263793945312 506.8271484375 557.3196411132812 506.8341064453125 557.3956298828125 506.7929382324219 C 557.4733276367188 506.7534484863281 557.521728515625 506.6746215820312 557.521728515625 506.5889282226562 L 557.521728515625 505.1231384277344 C 558.9747924804688 505.3477172851562 560.0804443359375 506.6042785644531 560.0804443359375 508.0889282226562 C 560.0804443359375 509.7431640625 558.7242431640625 511.0889282226562 557.0569458007812 511.0889282226562 C 556.9118041992188 511.0889282226562 556.7666015625 511.0786437988281 556.625 511.0580444335938 C 556.555908203125 511.0494689941406 556.4903564453125 511.0683288574219 556.4384155273438 511.1129455566406 C 556.3883056640625 511.15576171875 556.3589477539062 511.21923828125 556.3589477539062 511.2860717773438 C 556.3589477539062 511.4060668945312 556.4505615234375 511.5157775878906 556.5697021484375 511.5278015136719 C 556.73046875 511.5432434082031 556.8945922851562 511.5500183105469 557.0569458007812 511.5500183105469 C 559.87841796875 511.5500183105469 562.1727294921875 509.2734985351562 562.1727294921875 506.4740600585938 C 562.1727294921875 503.8306884765625 560.1478271484375 501.6500549316406 557.521728515625 501.4169006347656 L 557.521728515625 499.7814636230469 C 557.521728515625 499.6940307617188 557.4733276367188 499.6152038574219 557.3956298828125 499.5757446289062 C 557.3628540039062 499.55859375 557.3264770507812 499.5500183105469 557.2885131835938 499.5500183105469 C 557.241943359375 499.5500183105469 557.1951293945312 499.563720703125 557.1554565429688 499.5928955078125 L 552.2713012695312 502.9957275390625 C 552.2091064453125 503.0386352539062 552.1727294921875 503.10888671875 552.1727294921875 503.1842956542969 C 552.1727294921875 503.2597961425781 552.2091064453125 503.3300476074219 552.2713012695312 503.3729248046875 L 557.1554565429688 506.7774963378906 Z" fill="#4fabf7" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_yw2hxb =
    '<svg viewBox="333.0 216.0 10.0 12.0" ><path transform="translate(-219.17, -283.55)" d="M 557.1554565429688 506.7774963378906 C 557.2263793945312 506.8271484375 557.3196411132812 506.8341064453125 557.3956298828125 506.7929382324219 C 557.4733276367188 506.7534484863281 557.521728515625 506.6746215820312 557.521728515625 506.5889282226562 L 557.521728515625 505.1231384277344 C 558.9747924804688 505.3477172851562 560.0804443359375 506.6042785644531 560.0804443359375 508.0889282226562 C 560.0804443359375 509.7431640625 558.7242431640625 511.0889282226562 557.0569458007812 511.0889282226562 C 556.9118041992188 511.0889282226562 556.7666015625 511.0786437988281 556.625 511.0580444335938 C 556.555908203125 511.0494689941406 556.4903564453125 511.0683288574219 556.4384155273438 511.1129455566406 C 556.3883056640625 511.15576171875 556.3589477539062 511.21923828125 556.3589477539062 511.2860717773438 C 556.3589477539062 511.4060668945312 556.4505615234375 511.5157775878906 556.5697021484375 511.5278015136719 C 556.73046875 511.5432434082031 556.8945922851562 511.5500183105469 557.0569458007812 511.5500183105469 C 559.87841796875 511.5500183105469 562.1727294921875 509.2734985351562 562.1727294921875 506.4740600585938 C 562.1727294921875 503.8306884765625 560.1478271484375 501.6500549316406 557.521728515625 501.4169006347656 L 557.521728515625 499.7814636230469 C 557.521728515625 499.6940307617188 557.4733276367188 499.6152038574219 557.3956298828125 499.5757446289062 C 557.3628540039062 499.55859375 557.3264770507812 499.5500183105469 557.2885131835938 499.5500183105469 C 557.241943359375 499.5500183105469 557.1951293945312 499.563720703125 557.1554565429688 499.5928955078125 L 552.2713012695312 502.9957275390625 C 552.2091064453125 503.0386352539062 552.1727294921875 503.10888671875 552.1727294921875 503.1842956542969 C 552.1727294921875 503.2597961425781 552.2091064453125 503.3300476074219 552.2713012695312 503.3729248046875 L 557.1554565429688 506.7774963378906 Z" fill="#4fabf7" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_rxlwxj =
    '<svg viewBox="331.0 43.0 16.0 18.0" ><path transform="translate(331.0, 43.0)" d="M 5.485610961914062 15.49350070953369 L 5.485610961914062 15.03810024261475 L 2.056652784347534 15.03810024261475 C 0.922694981098175 15.03810024261475 0 14.11830043792725 0 12.98700046539307 L 0 12.63960075378418 C 0 11.75040054321289 0.4956551194190979 10.95120048522949 1.292856335639954 10.55340003967285 C 1.651280879974365 10.37430000305176 1.887823104858398 10.03140068054199 1.923936367034912 9.63539981842041 L 2.332016706466675 5.1596999168396 C 2.461121797561646 3.746700048446655 3.11025857925415 2.440799951553345 4.162058353424072 1.484099984169006 C 5.212955474853516 0.527400016784668 6.57623291015625 0 8 0 C 9.42376708984375 0 10.78614139556885 0.527400016784668 11.83794212341309 1.484099984169006 C 12.88883876800537 2.440799951553345 13.53887748718262 3.746700048446655 13.66798305511475 5.1596999168396 L 14.07606410980225 9.63539981842041 C 14.11217784881592 10.03140068054199 14.34691333770752 10.37430000305176 14.70263004302979 10.55160045623779 C 15.50253963470459 10.9503002166748 16 11.75040054321289 16 12.63960075378418 L 16 12.98700046539307 C 16 14.11830043792725 15.07730579376221 15.03810024261475 13.94244480133057 15.03810024261475 L 10.51438903808594 15.03810024261475 L 10.51438903808594 15.49350070953369 C 10.51438903808594 16.87770080566406 9.388556480407715 18 8 18 C 6.611443519592285 18 5.485610961914062 16.87770080566406 5.485610961914062 15.49350070953369 Z M 6.857014179229736 15.49350070953369 C 6.857014179229736 16.12260055541992 7.36892032623291 16.63290023803711 8 16.63290023803711 C 8.63107967376709 16.63290023803711 9.142985343933105 16.12260055541992 9.142985343933105 15.49350070953369 L 9.142985343933105 15.03810024261475 L 6.857014179229736 15.03810024261475 L 6.857014179229736 15.49350070953369 Z M 5.086558818817139 2.493900060653687 C 4.288455009460449 3.220200061798096 3.794605493545532 4.211100101470947 3.697099685668945 5.283900260925293 L 3.289019346237183 9.759600639343262 C 3.209570169448853 10.6298999786377 2.694052696228027 11.38320064544678 1.909491062164307 11.77470016479492 C 1.577248692512512 11.9394006729126 1.371402740478516 12.27150058746338 1.371402740478516 12.63960075378418 L 1.371402740478516 12.98700046539307 C 1.371402740478516 13.36410045623779 1.67836582660675 13.67100048065186 2.056652784347534 13.67100048065186 L 13.94244480133057 13.67100048065186 C 14.32073211669922 13.67100048065186 14.6285982131958 13.36410045623779 14.6285982131958 12.98700046539307 L 14.6285982131958 12.63960075378418 C 14.6285982131958 12.27150058746338 14.42365455627441 11.94029998779297 14.09321784973145 11.77560043334961 C 13.30685043334961 11.38409996032715 12.79043006896973 10.6298999786377 12.71007823944092 9.759600639343262 L 12.30199718475342 5.283900260925293 C 12.20449256896973 4.211100101470947 11.71064281463623 3.220200061798096 10.9134407043457 2.493900060653687 C 10.11533641815186 1.767600059509277 9.080691337585449 1.36710000038147 8 1.36710000038147 C 6.919309616088867 1.36710000038147 5.884663105010986 1.767600059509277 5.086558818817139 2.493900060653687 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';

