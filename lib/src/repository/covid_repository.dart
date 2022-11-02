import 'package:covid_info/src/models/covid_model.dart';
import 'package:dio/dio.dart';
import 'package:xml/xml.dart';

class CovidRepository {
  late var _dio;

  final bookshelfXml =
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
              <clearCnt>163055</clearCnt>
              <deathCnt>2033</deathCnt>
              <decideCnt>184103</decideCnt>
              <examCnt>269496</examCnt>
              <resultNegCnt>10890319</resultNegCnt>
              <seq>580</seq>
              <createDt>2022-11-02 09:39:47.617</createDt>
              <stateDt>20221102</stateDt>
              <stateTime>00:00</stateTime>
              <updateDt>null</updateDt>
            </item>
            <item>
              <accDefRate>1.6624163319</accDefRate>
              <accExamCnt>11343918</accExamCnt>
              <accExamCompCnt>11074422</accExamCompCnt>
              <careCnt>18967</careCnt>
              <clearCnt>163088</clearCnt>
              <deathCnt>2022</deathCnt>
              <decideCnt>184576</decideCnt>
              <examCnt>269467</examCnt>
              <resultNegCnt>10890319</resultNegCnt>
              <seq>580</seq>
              <createDt>2022-11-01 09:39:47.617</createDt>
              <stateDt>20221101</stateDt>
              <stateTime>00:00</stateTime>
              <updateDt>null</updateDt>
            </item>
            <item>
              <accDefRate>1.6624163319</accDefRate>
              <accExamCnt>11343918</accExamCnt>
              <accExamCompCnt>11074422</accExamCompCnt>
              <careCnt>18967</careCnt>
              <clearCnt>163022</clearCnt>
              <deathCnt>2011</deathCnt>
              <decideCnt>184103</decideCnt>
              <examCnt>269434</examCnt>
              <resultNegCnt>10890319</resultNegCnt>
              <seq>580</seq>
              <createDt>2022-10-31 09:39:47.617</createDt>
              <stateDt>20221031</stateDt>
              <stateTime>00:00</stateTime>
              <updateDt>null</updateDt>
            </item>
            <item>
              <accDefRate>1.6624163319</accDefRate>
              <accExamCnt>11343918</accExamCnt>
              <accExamCompCnt>11074422</accExamCompCnt>
              <careCnt>18967</careCnt>
              <clearCnt>163073</clearCnt>
              <deathCnt>2000</deathCnt>
              <decideCnt>184122</decideCnt>
              <examCnt>269499</examCnt>
              <resultNegCnt>10890319</resultNegCnt>
              <seq>580</seq>
              <createDt>2022-10-30 09:39:47.617</createDt>
              <stateDt>20221030</stateDt>
              <stateTime>00:00</stateTime>
              <updateDt>null</updateDt>
            </item>
            <item>
              <accDefRate>1.6624163319</accDefRate>
              <accExamCnt>11343918</accExamCnt>
              <accExamCompCnt>11074422</accExamCompCnt>
              <careCnt>18967</careCnt>
              <clearCnt>163066</clearCnt>
              <deathCnt>2063</deathCnt>
              <decideCnt>184192</decideCnt>
              <examCnt>269409</examCnt>
              <resultNegCnt>10890319</resultNegCnt>
              <seq>580</seq>
              <createDt>2022-10-29 09:39:47.617</createDt>
              <stateDt>20221029</stateDt>
              <stateTime>00:00</stateTime>
              <updateDt>null</updateDt>
            </item>
            <item>
              <accDefRate>1.6624163319</accDefRate>
              <accExamCnt>11343918</accExamCnt>
              <accExamCompCnt>11074422</accExamCompCnt>
              <careCnt>18967</careCnt>
              <clearCnt>163076</clearCnt>
              <deathCnt>2063</deathCnt>
              <decideCnt>184145</decideCnt>
              <examCnt>269433</examCnt>
              <resultNegCnt>10890319</resultNegCnt>
              <seq>580</seq>
              <createDt>2022-10-28 09:39:47.617</createDt>
              <stateDt>20221028</stateDt>
              <stateTime>00:00</stateTime>
              <updateDt>null</updateDt>
            </item>
            <item>
              <accDefRate>1.6624163319</accDefRate>
              <accExamCnt>11343918</accExamCnt>
              <accExamCompCnt>11074422</accExamCompCnt>
              <careCnt>18967</careCnt>
              <clearCnt>163043</clearCnt>
              <deathCnt>2093</deathCnt>
              <decideCnt>184189</decideCnt>
              <examCnt>269455</examCnt>
              <resultNegCnt>10890319</resultNegCnt>
              <seq>580</seq>
              <createDt>2022-10-27 09:39:47.617</createDt>
              <stateDt>20221027</stateDt>
              <stateTime>00:00</stateTime>
              <updateDt>null</updateDt>
            </item>
            <item>
              <accDefRate>1.6624163319</accDefRate>
              <accExamCnt>11343918</accExamCnt>
              <accExamCompCnt>11074422</accExamCompCnt>
              <careCnt>18967</careCnt>
              <clearCnt>163011</clearCnt>
              <deathCnt>2061</deathCnt>
              <decideCnt>184177</decideCnt>
              <examCnt>269411</examCnt>
              <resultNegCnt>10890319</resultNegCnt>
              <seq>580</seq>
              <createDt>2022-10-26 09:39:47.617</createDt>
              <stateDt>20221026</stateDt>
              <stateTime>00:00</stateTime>
              <updateDt>null</updateDt>
            </item>
        </items>
        <numOfRows>10</numOfRows>
        <pageNo>1</pageNo>
        <totalCount>2</totalCount>
    </body>
</response>''';

  CovidRepository() {
    _dio =
        Dio(BaseOptions(baseUrl: 'http://openapi.data.go.kr', queryParameters: {
      'ServiceKey':
          'gwqXIv0tpeASzG3gTV7yATyUpewfPBJwwzuO8SsXkLfe7Juf6w6IWhsBuxIz2Rx0Lc7JuN2XK4ozdmWNZoCGsg=='
    }));
  }

  Future<List<CovidModel>> fetchCovidStatistics({String? startDate, String? endDate}) async {
    //var response = await _dio.get('/openapi/service/rest/Covid19/getCovid19InfStateJson');
    //final document = XmlDocument.parse(response.data);

    var query = <String, String>{};
    if(startDate != null) query.putIfAbsent('startCreateDt', () => startDate);
    if(endDate != null) query.putIfAbsent('endCreateDt', () => endDate);

    print('$startDate : $endDate');

    final document = XmlDocument.parse(bookshelfXml);
    final results = document.findAllElements('item');

    if (results.isNotEmpty) {
      return results.map<CovidModel>((element) => CovidModel.fromXml(element)).toList();
    } else {
      return Future.value(null);
    }
  }
}
