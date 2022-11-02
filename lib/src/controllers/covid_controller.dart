import 'package:covid_info/src/canvas/arrow_clip_path.dart';
import 'package:covid_info/src/models/covid_model.dart';
import 'package:covid_info/src/repository/covid_repository.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CovidController extends GetxController{

  late CovidRepository _covidRepository;
  final Rx<CovidModel> _todayData = CovidModel().obs;
  final RxList<CovidModel> _weekDatas = <CovidModel>[].obs;
  double maxDecideValue = 0;
  double minDecideValue = 0;

  @override
  void onInit() {
    super.onInit();
    _covidRepository = CovidRepository();
    fetchCovidStatistics();
  }

  void fetchCovidStatistics() async{

    var startDate = DateFormat('yyyyMMdd').format(DateTime.now().subtract(const Duration(days: 8)));
    var endDate = DateFormat('yyyyMMdd').format(DateTime.now());

    var result = await _covidRepository.fetchCovidStatistics(startDate: startDate, endDate: endDate);

    if(result.isNotEmpty){
      for(var i = 0; i < result.length; i++){
        if(i < result.length - 1){
          result[i].compareYesterday(result[i + 1]);

          if(maxDecideValue < result[i].calcDecideCnt){
            maxDecideValue = result[i].calcDecideCnt;
          }

          if(minDecideValue > result[i].calcDecideCnt){
            minDecideValue = result[i].calcDecideCnt;
          }
        }
      }
      _weekDatas(result.sublist(0, result.length - 1).reversed.toList());
      _todayData(_weekDatas.last);
    }
  }

  CovidModel get todayData => _todayData.value;

  List<CovidModel> get weekDatas => _weekDatas;

  ArrowDirection calcUpDown(double value){
    if(value == 0){
      return ArrowDirection.MIDDLE;
    }else if(value > 0){
      return ArrowDirection.UP;
    }else{
      return ArrowDirection.DOWN;
    }
  }
}