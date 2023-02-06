const iconPath = "assets/icons/";
const imagePath = "assets/images/";
var coinIconUrl =
    "https://raw.githubusercontent.com/spothq/cryptocurrency-icons/master/128/color/";

class AppStrings {
  static const String cryptoCurrency = 'Crypto Currency';
  static const String somethingWentWrong =
      "Something went wrong, try again later";
  static const String circulatingSupply = "Circulating supply:";
  static const String maxSupply = "Max Supply:";
  static const String marketPairs = "Market Pairs:";
  static const String marketCap = "Market Cap:";
  static const String today = "Today";
  static const String sevenDays = '7D';
  static const String oneMonth = "1M";
  static const String threeMonths = "3M";
  static const String sixMonths = "6M";
}

class AssetStrings {
  static const String dollarSvg = "${iconPath}dollar.svg";
  static const String darkSky = "${imagePath}sky.jpeg";
  static const String brightSky = "${imagePath}brightsky.jpeg";
}

class DateFormatString {
  static const String inputDateFormat = "yyyy-MM-dd HH:mm:ss.SSS'Z'";
  static const String outputDateFormat = "MM/dd/yyyy hh:mm a";
}
