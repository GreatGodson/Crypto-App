import 'package:crypto_app/app/shared/data/chart_data.dart';
import 'package:crypto_app/app/shared/data/model/chart_data_model.dart';
import 'package:crypto_app/app/shared/domain/provider/theme_provider.dart';
import 'package:crypto_app/app/shared/utils/strings.dart';
import 'package:crypto_app/app/shared/views/widgets/slivers/custom_silver_appbar.dart';
import 'package:crypto_app/app/shared/views/widgets/slivers/sliver_persistent_header.dart';
import 'package:crypto_app/app/shared/views/widgets/slivers/sliver_tobox_adapter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:crypto_app/app/modules/home/data/models/response/allcrypto_response.dart';
import 'package:flutter/material.dart';

class CoinDetailsScreen extends ConsumerStatefulWidget {
  const CoinDetailsScreen(
      {Key? key,
      required this.currencyData,
      required this.coinIconUrl,
      required this.index})
      : super(key: key);

  final CryptoDataResponse currencyData;
  final String coinIconUrl;
  final int index;

  @override
  ConsumerState<CoinDetailsScreen> createState() => _CoinDetailsScreenState();
}

class _CoinDetailsScreenState extends ConsumerState<CoinDetailsScreen> {
  List<bool> isSelected = [true, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    DateTime parseDate = DateFormat(DateFormatString.inputDateFormat).parse(
        widget.currencyData.data[widget.index].quote.usd.lastUpdated
            .toString());
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat(DateFormatString.outputDateFormat);
    var outputData = outputFormat.format(inputDate);
    final darkMode = ref.watch(darkModeProvider);
    List<ChartDataModel> chartData = ChartData.chartDataForDetailScreen();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(
              index: widget.index,
              currencyData: widget.currencyData,
              coinIconUrl: widget.coinIconUrl,
              switchOnChanged: (val) {
                ref.read(darkModeProvider.notifier).toggle();
              },
              darkMode: darkMode),
          CustomSliverPersistentHeader(
              outputData: outputData,
              isSelected: isSelected,
              toggleButtonOnPressed: (int newIndex) {
                setState(() {
                  for (int i = 0; i < isSelected.length; i++) {
                    if (i == newIndex) {
                      isSelected[i] = true;
                    } else {
                      isSelected[i] = false;
                    }
                  }
                });
              },
              coinIconUrl: coinIconUrl,
              currencyData: widget.currencyData,
              index: widget.index,
              chartData: chartData),
          CustomSliverToBoxAdapter(
              index: widget.index, currencyData: widget.currencyData)
        ],
      ),
    );
  }
}
