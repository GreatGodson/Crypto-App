import 'package:crypto_app/app/modules/home/domain/provider/getcrypto_provider.dart';
import 'package:crypto_app/app/shared/data/chart_data.dart';
import 'package:crypto_app/app/shared/data/model/chart_data_model.dart';
import 'package:crypto_app/app/shared/domain/provider/theme_provider.dart';
import 'package:crypto_app/app/shared/helpers/dimensions.dart';
import 'package:crypto_app/app/shared/utils/strings.dart';
import 'package:crypto_app/app/shared/utils/theme/app_colors.dart';
import 'package:crypto_app/app/shared/views/widgets/home_screen_card.dart';
import 'package:crypto_app/core/base_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends StatefulHookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final allCurrency = ref.useProviderFamily(getCardProvider, '');
    final darkMode = ref.watch(darkModeProvider);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        actions: [
          Switch.adaptive(
              activeColor: AppColors.switchActiveColor,
              value: darkMode,
              onChanged: (val) {
                ref.read(darkModeProvider.notifier).toggle();
              }),
          const XBox(15),
        ],
        title: Text(AppStrings.cryptoCurrency,
            style: Theme.of(context).textTheme.headline5!),
      ),
      body: allCurrency.when(done: (currencyData) {
        return ListView.builder(
            itemCount: currencyData.data.length,
            itemBuilder: (context, index) {
              List<ChartDataModel> chartData = ChartData.getChartData(
                  currencyData: currencyData, index: index);
              return HomeScreenCryptoCard(
                  currencyData: currencyData,
                  index: index,
                  chartData: chartData);
            });
      }, error: (err) {
        return Center(
          child: Text(AppStrings.somethingWentWrong,
              style: Theme.of(context).textTheme.headline5),
        );
      }, loading: () {
        return const Center(child: CupertinoActivityIndicator());
      }),
    );
  }
}
