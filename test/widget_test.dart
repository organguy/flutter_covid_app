// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:covid_info/src/models/covid_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:xml/xml.dart';

void main() {

  const bookshelfXml =
  '''<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<response>
    <header>
        <resultCode>00</resultCode>
        <resultMsg>NORMAL SERVICE.</resultMsg>
    </header>
    <body>
        <items>
            <item>
                <accDefRate>1.6624163319</accDefRate>
                <accExamCnt>11343918</accExamCnt>
                <accExamCompCnt>11074422</accExamCompCnt>
                <careCnt>18967</careCnt>
                <clearCnt>163073</clearCnt>
                <createDt>2021-07-22 09:39:47.617</createDt>
                <deathCnt>2063</deathCnt>
                <decideCnt>184103</decideCnt>
                <examCnt>269496</examCnt>
                <resultNegCnt>10890319</resultNegCnt>
                <seq>580</seq>
                <stateDt>20210722</stateDt>
                <stateTime>00:00</stateTime>
                <updateDt>null</updateDt>
            </item>
            <item>
                <accDefRate>1.6499811252</accDefRate>
                <accExamCnt>11298677</accExamCnt>
                <accExamCompCnt>11046490</accExamCompCnt>
                <careCnt>18571</careCnt>
                <clearCnt>161634</clearCnt>
                <createDt>2021-07-21 09:38:25.219</createDt>
                <deathCnt>2060</deathCnt>
                <decideCnt>182265</decideCnt>
                <examCnt>252187</examCnt>
                <resultNegCnt>10864225</resultNegCnt>
                <seq>579</seq>
                <stateDt>20210721</stateDt>
                <stateTime>00:00</stateTime>
                <updateDt>null</updateDt>
            </item>
        </items>
        <numOfRows>10</numOfRows>
        <pageNo>1</pageNo>
        <totalCount>2</totalCount>
    </body>
</response>''';

  test('코로나 전체 통계', (){
    final document = XmlDocument.parse(bookshelfXml);
    final items = document.findAllElements('item');
    var covidStatistics = <CovidModel>[];
    items.forEach((node) {
      covidStatistics.add(CovidModel.fromXml(node));
    });

    covidStatistics.forEach((covid) {
      print('${covid.stateDt} : ${covid.decideCnt}');
    });
  });
}