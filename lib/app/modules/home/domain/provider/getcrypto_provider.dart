import 'package:crypto_app/app/modules/home/data/models/response/allcrypto_response.dart';
import 'package:crypto_app/app/modules/home/domain/repository/getcrypto_repo.dart';
import 'package:crypto_app/core/base_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getCardProvider = StateNotifierProvider.family<GetCryptoNotifier,
    NotifierState<CryptoDataResponse>, String>((ref, string) {
  final repo = ref.read(getCryptoRepositoryProvider(''));
  return GetCryptoNotifier(repo);
});

class GetCryptoNotifier extends BaseNotifier<CryptoDataResponse> {
  final GetCardRepository _repo;

  GetCryptoNotifier(this._repo);
  @override
  void onInit() {
    getDCard();
    super.onInit();
  }

  Future<void> getDCard() async {
    setLoading();
    state = await _repo.getDollarCard();
  }

  Future<void> refresh() async {
    setLoading();
    state = await _repo.refresh();
  }
}
