import 'package:dainik_ujala/Backend/api.dart';
import 'package:dainik_ujala/Backend/models.dart';
import 'package:dainik_ujala/UI%20Components/compnents.dart';
import 'package:flutter/material.dart';

class SecondaryTab extends StatefulWidget {
  const SecondaryTab({super.key, required this.title});
  final String title;

  @override
  State<SecondaryTab> createState() => _SecondaryTabState();
}

class _SecondaryTabState extends State<SecondaryTab> {
  late List<Widget> newsItems;

  fetchNews() async {
    Iterable<NewsArtical> data =
        await FetchData.callApi(keyword: widget.title, type: "top-headlines");
    setState(() {
      for (int i = 0; i < data.length; i++) {
        Widget w = Article(data: data.elementAt(i), curIndex: i);
        newsItems.add(w);
      }
    });
  }

  @override
  void initState() {
    newsItems = <Widget>[];
    fetchNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: newsItems.isNotEmpty
                ? newsItems
                : const [CircularProgressIndicator()],
          )
        ],
      ),
    );
  }
}
