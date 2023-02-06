import 'package:crypto_app/app/modules/home/data/models/response/allcrypto_response.dart';
import 'package:crypto_app/app/modules/home/domain/service/get_crypto.dart';
import 'package:crypto_app/core/base_notifier.dart';
import 'package:crypto_app/core/convert_func.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getCryptoRepositoryProvider =
    Provider.family<GetCardRepository, String>((ref, string) {
  return GetCardRepository();
});

class GetCardRepository {
  CryptoDataResponse? crypto;
  bool hasLoadedAll = false;
  FutureNotifierState<CryptoDataResponse> getDollarCard() async {
    if (hasLoadedAll) {
      return notifyData(value: crypto!);
    }
    return convert(CryptoService.getAllCrypto);
  }

  FutureNotifierState<CryptoDataResponse> refresh() {
    crypto = null;
    hasLoadedAll = false;
    return getDollarCard();
  }
}
