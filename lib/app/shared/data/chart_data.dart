import 'dart:math';

import 'package:crypto_app/app/modules/home/data/models/response/allcrypto_response.dart';
import 'package:crypto_app/app/shared/data/model/chart_data_model.dart';

class ChartData {
  static List<ChartDataModel> getChartData(
      {required CryptoDataResponse currencyData, required int index}) {
    List<ChartDataModel> chartData = [
      ChartDataModel(
          value: currencyData.data[index].quote.usd.percentChange90D,
          year: 2160),
      ChartDataModel(
          value: currencyData.data[index].quote.usd.percentChange60D,
          year: 1440),
      ChartDataModel(
          value: currencyData.data[index].quote.usd.percentChange30D,
          year: 720),
      ChartDataModel(
          value: currencyData.data[index].quote.usd.percentChange24H, year: 24),
      ChartDataModel(
          value: currencyData.data[index].quote.usd.percentChange1H, year: 1),
    ];

    return chartData;
  }

  static next(int min, int max) {
    Random random = Random();
    return random.nextInt(max - min);
  }

  static chartDataForDetailScreen() {
    List<ChartDataModel> chartData = [
      ChartDataModel(value: next(1, 1000), year: 1),
      ChartDataModel(value: next(1, 1000), year: 2),
      ChartDataModel(value: next(1, 1000), year: 3),
      ChartDataModel(value: next(1, 1000), year: 4),
      ChartDataModel(value: next(1, 1000), year: 5),
      ChartDataModel(value: next(1, 1000), year: 6),
      ChartDataModel(value: next(1, 1000), year: 7),
      ChartDataModel(value: next(1, 1000), year: 8),
      ChartDataModel(value: next(1, 1000), year: 9),
      ChartDataModel(value: next(1, 1000), year: 10),
      ChartDataModel(value: next(1, 1000), year: 11),
      ChartDataModel(value: next(1, 1000), year: 12),
      ChartDataModel(value: next(1, 1000), year: 13),
      ChartDataModel(value: next(1, 1000), year: 14),
      ChartDataModel(value: next(1, 1000), year: 15),
      ChartDataModel(value: next(1, 1000), year: 16),
      ChartDataModel(value: next(1, 1000), year: 17),
      ChartDataModel(value: next(1, 1000), year: 18),
      ChartDataModel(value: next(1, 1000), year: 19),
      ChartDataModel(value: next(1, 1000), year: 20),
    ];

    return chartData;
  }
}
