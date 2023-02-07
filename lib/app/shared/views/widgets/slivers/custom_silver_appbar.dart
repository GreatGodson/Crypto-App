import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto_app/app/modules/home/data/models/response/allcrypto_response.dart';
import 'package:crypto_app/app/shared/helpers/dimensions.dart';
import 'package:crypto_app/app/shared/utils/strings.dart';
import 'package:crypto_app/app/shared/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar(
      {Key? key,
      required this.index,
      required this.currencyData,
      required this.coinIconUrl,
      required this.switchOnChanged,
      required this.darkMode})
      : super(key: key);

  final CryptoDataResponse currencyData;
  final String coinIconUrl;
  final int index;
  final Function(bool) switchOnChanged;
  final bool darkMode;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      actions: [
        Switch.adaptive(
          activeColor: AppColors.switchActiveColor,
          value: darkMode,
          onChanged: switchOnChanged,
        ),
        const XBox(15),
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(36),
      ),
      pinned: true,
      snap: true,
      floating: true,
      expandedHeight: context.deviceHeight(0.3),

      /// expandedHeight: 280,
      flexibleSpace: FlexibleSpaceBar(
        title: Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.fromLTRB(16, 24, 4.4, 0),
          // height: 56,
          height: context.deviceHeight(0.056),
          width: double.infinity,
          child: ListTile(
            title: Text(
              "${currencyData.data[index].name} ${currencyData.data[index].symbol} #${currencyData.data[index].cmcRank}",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontSize: 22),
              overflow: TextOverflow.ellipsis,
            ),
            leading: SizedBox(
              height: context.deviceHeight(0.04),
              width: context.deviceWidth(0.1),

              /// height: 40,
              /// width: 40,
              child: CachedNetworkImage(
                imageUrl: ("$coinIconUrl${currencyData.data[index].symbol}.png")
                    .toLowerCase(),
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => SvgPicture.asset(
                  'assets/icons/dollar.svg',
                  color: AppColors.whiteColor,
                  height: 60,
                ),
              ),
            ),
          ),
        ),
        background: darkMode
            ? Image.asset(
                AssetStrings.darkSky,
                fit: BoxFit.cover,
              )
            : Image.asset(
                AssetStrings.brightSky,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
