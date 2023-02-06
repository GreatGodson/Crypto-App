import 'dart:convert';
import 'package:crypto_app/app/modules/home/data/models/response/allcrypto_response.dart';
import 'package:crypto_app/app/shared/helpers/http.dart';
import 'package:crypto_app/core/service_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

String coinMarketCapApiKey = '39b88cac-feeb-4209-84f3-02b50317ba98';

class CryptoService {
  static FutureResponse<CryptoDataResponse> getAllCrypto() {
    return serveFuture<CryptoDataResponse>(
      handleError: (error) {
        return error.toString();
      },
      function: (fail) async {
        HTTP.addHeader(key: "X-CMC_PRO_API_KEY", value: coinMarketCapApiKey);
        final r = await HTTP.get("listings/latest");
        if (r.is200) {
          final data = jsonDecode(r.body);
          debugPrint(data.toString());
          return CryptoDataResponse.fromJson(data);
        }
        debugPrint(r.body);
        fail(r.body);
      },
    );
  }
}

extension Extras on Response {
  bool get is200 => statusCode == 200;
  bool get is201 => statusCode == 201;
  bool get is202 => statusCode == 202;
  bool get is400 => statusCode == 400;
  bool get is409 => statusCode == 409;
  bool get is500 => statusCode == 500;
  bool get is401 => statusCode == 401;
  bool get is404 => statusCode == 404;
  bool get is502 => statusCode == 502;
}
