import 'package:crypto_app/app/modules/home/data/models/response/allcrypto_response.dart';
import 'package:crypto_app/app/shared/helpers/dimensions.dart';
import 'package:crypto_app/app/shared/utils/strings.dart';
import 'package:flutter/material.dart';

class CustomSliverToBoxAdapter extends StatelessWidget {
  const CustomSliverToBoxAdapter(
      {Key? key, required this.index, required this.currencyData})
      : super(key: key);

  final CryptoDataResponse currencyData;

  final int index;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),

      /// height: 500,
      height: context.deviceHeight(0.54),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            /// height: 400,
            height: context.deviceHeight(0.44),

            width: double.infinity,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.circulatingSupply,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      currencyData.data[index].circulatingSupply
                          .toStringAsFixed(2),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
                const YBox(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.maxSupply,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      currencyData.data[index].maxSupply == null
                          ? currencyData.data[index].maxSupply.toString()
                          : '0',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
                const YBox(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.marketPairs,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      currencyData.data[index].numMarketPairs.toString(),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
                const YBox(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.marketCap,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      currencyData.data[index].quote.usd.marketCap.toString(),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
