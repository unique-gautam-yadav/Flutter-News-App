import 'dart:convert';
import 'dart:math';

import 'package:dainik_ujala/Backend/models.dart';
import 'package:http/http.dart' as http;

class FetchData {
  final _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  static String apiKey = "0ec5920f30ba46b88aab487f38cdc679";
  static String api = "https://newsapi.org/v2/";
  List<String> sortBy = ["relevancy", "popularity", "publishedAt"];

  String api2 =
      "https://newsapi.org/v2/top-headlines?country=in&lan=en&apiKey=0ec5920f30ba46b88aab487f38cdc679";

// ?q=tesla&from=2022-11-21&sortBy=publishedAt&apiKey=

  static Future<Iterable<NewsArtical>> callApi(
      {required String type,
      String category = "none",
      String keyword = "none"}) async {
    List<NewsArtical> dataToBeSent = <NewsArtical>[];
    try {
      String url;
      if (category == "none") {
        url = "$api$type?q=$keyword&lan=en&sortBy=popularity&apiKey=$apiKey";
      } else {
        url =
            "$api$type?category=$category&lan=en&sortBy=popularity&apiKey=$apiKey";
      }
      final response = await http.get(Uri.parse(url));

      final newsJson = response.body;
      final decodedData = jsonDecode(newsJson);
      if (decodedData["status"].toString() == "error") {
        print(decodedData.toString());
      }

      var newsData = decodedData["articles"];

      List<dynamic> data = List.from(newsData);
      for (int i = 0; i < data.length; i++) {
        if (data[i] == null) {
          print("Something Skipped");
          continue;
        } else {
          NewsArtical item = NewsArtical(
            id: FetchData().getRandomString(5),
            author: data[i]["author"].toString(),
            title: data[i]["title"].toString(),
            description: data[i]["description"].toString(),
            url: data[i]["url"].toString(),
            urlToImage: data[i]["urlToImage"].toString(),
            publishedAt: data[i]["publishedAt"].toString(),
            content: data[i]["content"].toString(),
          );
          dataToBeSent.add(item);
        }
      }
      print("${dataToBeSent.length}    Data Fetched");
    } catch (e) {
      print(e);
    }
    return dataToBeSent;
  }
}
