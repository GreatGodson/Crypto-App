import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto_app/app/modules/crypto_detail/views/crypto_detail_screen.dart';
import 'package:crypto_app/app/modules/home/data/models/response/allcrypto_response.dart';
import 'package:crypto_app/app/shared/data/model/chart_data_model.dart';
import 'package:crypto_app/app/shared/helpers/dimensions.dart';
import 'package:crypto_app/app/shared/utils/strings.dart';
import 'package:crypto_app/app/shared/utils/theme/app_colors.dart';
import 'package:crypto_app/core/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeScreenCryptoCard extends StatelessWidget {
  const HomeScreenCryptoCard(
      {Key? key,
      required this.currencyData,
      required this.index,
      required this.chartData})
      : super(key: key);

  final CryptoDataResponse currencyData;
  final int index;
  final List<ChartDataModel> chartData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pushTo(
            context,
            CoinDetailsScreen(
                currencyData: currencyData,
                coinIconUrl: coinIconUrl,
                index: index));
      },
      child: Container(
        height: context.deviceHeight(0.17),
        width: context.deviceWidth(),

        /// height: 160 ,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            16,
          ),
          color: AppColors.cryptoCardColor,
        ),
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: context.deviceHeight(0.11),
              width: context.deviceWidth(0.3),

              /// both 96
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                children: [
                  SizedBox(
                    height: context.deviceHeight(0.06),
                    width: context.deviceWidth(0.12),

                    ///both 50
                    child: CachedNetworkImage(
                      imageUrl:
                          ("$coinIconUrl${currencyData.data[index].symbol}.png")
                              .toLowerCase(),
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => SvgPicture.asset(
                        AssetStrings.dollarSvg,
                        color: AppColors.whiteColor,
                        height: 60,
                      ),
                    ),
                  ),
                  const YBox(4),
                  Text(
                    currencyData.data[index].symbol,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  const YBox(2),
                  Text(
                    '＄${currencyData.data[index].quote.usd.price.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.only(left: 16),

                  ///  height: 96,
                  height: context.deviceHeight(0.11),
                  width: double.infinity,
                  child: SfCartesianChart(
                    plotAreaBorderWidth: 0,
                    primaryXAxis: CategoryAxis(isVisible: false),
                    primaryYAxis: CategoryAxis(isVisible: false),
                    legend: Legend(isVisible: false),
                    tooltipBehavior: TooltipBehavior(enable: false),
                    series: <ChartSeries<ChartDataModel, String>>[
                      LineSeries<ChartDataModel, String>(
                          dataSource: chartData,
                          xValueMapper: (ChartDataModel data, _) =>
                              data.year.toString(),
                          yValueMapper: (ChartDataModel data, _) => data.value)
                    ],
                  ),
                )),
                Container(
                  padding: const EdgeInsets.all(4),
                  margin: const EdgeInsets.only(right: 16),
                  alignment: Alignment.center,
                  width: context.deviceWidth(0.17),
                  height: context.deviceHeight(0.04),

                  /// width: 72,
                  /// height: 36,
                  decoration: BoxDecoration(
                      color:
                          currencyData.data[index].quote.usd.percentChange7D >=
                                  0
                              ? Colors.green
                              : AppColors.redColor,
                      borderRadius: BorderRadius.circular(16)),
                  child: Text(
                    "${currencyData.data[index].quote.usd.percentChange7D.toStringAsFixed(2)}%",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
