import 'package:dainik_ujala/Backend/api.dart';
import 'package:dainik_ujala/Backend/models.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../UI Components/compnents.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late List<Widget> sliderItems;
  late List<Widget> newsItems;

  fetchFromAPI() async {
    Iterable<NewsArtical> d = await FetchData.callApi(keyword: "India", type: "everything");
    setState(() {
      for (int i = 0; i < d.length; i++) {
        Widget one = Article(data: d.elementAt(i), curIndex: i);
        newsItems.add(one);
      }
    });
  }

  getHeadlines() async {
    Iterable<NewsArtical> d = await FetchData.callApi(keyword: "India", type: "top-headlines");
    setState(() {
      for (int i = 0; i < d.length; i++) {
        Widget one = RoundedImage(
          artical: d.elementAt(i),
        );
        sliderItems.add(one);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    sliderItems = <Widget>[];
    newsItems = <Widget>[];
    getHeadlines();
    fetchFromAPI();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
              margin: const EdgeInsets.all(12),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: sliderItems.isNotEmpty
                    ? CarouselSlider(
                        items: sliderItems,
                        options: CarouselOptions(
                            autoPlay: true,
                            enlargeCenterPage: true,
                            disableCenter: true,
                            autoPlayInterval: const Duration(seconds: 5)),
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
              )),
          const SizedBox(height: 2),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: newsItems.isNotEmpty
                  ? newsItems
                  : [const CircularProgressIndicator()])
        ],
      ),
    );
  }
}
