import 'package:crypto_app/app/modules/home/data/models/response/allcrypto_response.dart';
import 'package:crypto_app/app/shared/data/model/chart_data_model.dart';
import 'package:crypto_app/app/shared/data/model/toggle_button_data.dart';
import 'package:crypto_app/app/shared/helpers/dimensions.dart';
import 'package:crypto_app/app/shared/utils/theme/app_colors.dart';
import 'package:crypto_app/app/shared/views/widgets/slivers/sliver_widget.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CustomSliverPersistentHeader extends StatelessWidget {
  const CustomSliverPersistentHeader({
    Key? key,
    required this.isSelected,
    required this.toggleButtonOnPressed,
    required this.coinIconUrl,
    required this.currencyData,
    required this.index,
    required this.chartData,
    required this.outputData,
  }) : super(key: key);

  final CryptoDataResponse currencyData;
  final String coinIconUrl;
  final int index;
  final List<bool> isSelected;
  final void Function(int)? toggleButtonOnPressed;
  final List<ChartDataModel> chartData;
  final String outputData;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverAppBarDelegate(
        minHeight: context.deviceHeight(0.38),
        maxHeight: context.deviceHeight(0.38),

        /// minHeight: 360,
        /// maxHeight: 360,
        child: Padding(
          padding: const EdgeInsets.only(top: 32),
          child: Column(
            children: [
              Text(
                '＄${currencyData.data[index].quote.usd.price.toStringAsFixed(2)}',
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontSize: 30),
              ),
              Text(
                outputData,
                style:
                    const TextStyle(color: AppColors.greyColor, fontSize: 18),
              ),
              Expanded(
                  child: Container(
                padding: const EdgeInsets.only(left: 16),
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
              const YBox(8),
              ToggleButtons(
                onPressed: toggleButtonOnPressed,
                borderRadius: BorderRadius.circular(8),
                borderColor: AppColors.indigoAccent,
                color: AppColors.whiteColor,
                fillColor: Colors.green,
                selectedColor: AppColors.whiteColor,
                selectedBorderColor: AppColors.indigoAccent,
                isSelected: isSelected,
                children: toggleButtonNames,
              )
            ],
          ),
        ),
      ),
    );
  }
}
