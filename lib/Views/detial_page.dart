import 'package:dainik_ujala/Backend/models.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    super.key,
    required this.data,
  });
  final NewsArtical data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: ButtonBar(alignment: MainAxisAlignment.center, children: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Theme.of(context).primaryColor),
            padding: MaterialStateProperty.all(const EdgeInsets.only(
                left: 30, right: 30, top: 10, bottom: 10)),
            shape: MaterialStateProperty.all(const StadiumBorder()),
          ),
          onPressed: () {
            Uri uri = Uri.parse(data.url);
            launchUrl(uri);
          },
          child: const Text(
            "See full article.",
            style: TextStyle(color: Colors.white),
          ),
        )
      ]),
      appBar: AppBar(
        title: Text(
          data.title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Hero(
              tag: Key(data.id.toString()),
              child: Container(
                height: MediaQuery.of(context).size.width * 0.67,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Theme.of(context).backgroundColor,
                    image: DecorationImage(
                      image: NetworkImage(data.urlToImage),
                      fit: BoxFit.cover,
                    )),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(data.publishedAt),
              Text(
                data.author,
              )
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Text(data.title, style: Theme.of(context).textTheme.headline6),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("${data.description} ${data.content}"),
          )
        ],
      )),
    );
  }
}
