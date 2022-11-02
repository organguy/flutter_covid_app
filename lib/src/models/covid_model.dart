import 'package:covid_info/src/utils/data_utils.dart';
import 'package:covid_info/src/utils/xml_util.dart';
import 'package:xml/xml.dart';

class CovidModel{
  double? accDefRate;
  double? accExamCnt;
  double? accExamCompCnt;
  double? careCnt;
  double? clearCnt;
  double calcClearCnt = 0;
  double? deathCnt;
  double calcDeathCnt = 0;
  double? decideCnt;
  double calcDecideCnt = 0;
  double? examCnt;
  double calcExamCnt = 0;
  double? resultNegCnt;
  double? seq;
  String? createDt;
  String? stateDt;
  String? stateTime;
  String? updateDt;

  CovidModel({
    this.accDefRate,
    this.accExamCnt,
    this.accExamCompCnt,
    this.careCnt,
    this.clearCnt,
    this.createDt,
    this.deathCnt,
    this.decideCnt,
    this.examCnt,
    this.resultNegCnt,
    this.seq,
    this.stateDt,
    this.stateTime,
    this.updateDt});

  factory CovidModel.fromXml(XmlElement xml){
    return CovidModel(
      accDefRate : XmlUtil.searchResultForDouble(xml, 'accDefRate'),
      accExamCnt : XmlUtil.searchResultForDouble(xml, 'accExamCnt'),
      accExamCompCnt : XmlUtil.searchResultForDouble(xml, 'accExamCompCnt'),
      careCnt : XmlUtil.searchResultForDouble(xml, 'careCnt'),
      clearCnt : XmlUtil.searchResultForDouble(xml, 'clearCnt'),
      deathCnt : XmlUtil.searchResultForDouble(xml, 'deathCnt'),
      decideCnt : XmlUtil.searchResultForDouble(xml, 'decideCnt'),
      examCnt : XmlUtil.searchResultForDouble(xml, 'examCnt'),
      resultNegCnt : XmlUtil.searchResultForDouble(xml, 'resultNegCnt'),
      seq : XmlUtil.searchResultForDouble(xml, 'seq'),
      createDt : XmlUtil.searchResultForString(xml, 'createDt'),
      stateDt : XmlUtil.searchResultForString(xml, 'stateDt'),
      stateTime : XmlUtil.searchResultForString(xml, 'stateTime'),
      updateDt : XmlUtil.searchResultForString(xml, 'updateDt'),
    );
  }

  factory CovidModel.empty(){
    return CovidModel();
  }

  void compareYesterday(CovidModel yesterdayData){
    _compareDecideCnt(yesterdayData.decideCnt!);
    _compareExamCnt(yesterdayData.examCnt!);
    _compareDeathCnt(yesterdayData.deathCnt!);
    _compareClearCnt(yesterdayData.clearCnt!);
  }

  void _compareDecideCnt(double beforeCnt){
    calcDecideCnt = decideCnt! - beforeCnt;
  }

  void _compareExamCnt(double beforeCnt){
    calcExamCnt = examCnt! - beforeCnt;
  }

  void _compareDeathCnt(double beforeCnt){
    calcDeathCnt = deathCnt! - beforeCnt;
  }

  void _compareClearCnt(double beforeCnt){
    calcClearCnt = clearCnt! - beforeCnt;
  }

  String get standardDate{
    String simpleDate = DataUtils.simpleDayFormat(stateDt!);
    return '$simpleDate $stateTime 기준';
  }
}