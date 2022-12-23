// ignore_for_file: avoid_print

import 'package:dainik_ujala/Backend/models.dart';
import 'package:dainik_ujala/Views/detial_page.dart';
import 'package:flutter/material.dart';

class PopUpMenu extends StatelessWidget {
  const PopUpMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(itemBuilder: (context) {
      return [
        const PopupMenuItem<int>(
          value: 0,
          child: Text("My Account"),
        ),
        const PopupMenuItem<int>(
          value: 1,
          child: Text("Settings"),
        ),
        const PopupMenuItem<int>(
          value: 2,
          child: Text("Logout"),
        ),
      ];
    }, onSelected: (value) {
      if (value == 0) {
        print("My account menu is selected.");
      } else if (value == 1) {
        print("Settings menu is selected.");
      } else if (value == 2) {
        print("Logout menu is selected.");
      }
    });
  }
}

class RoundedImage extends StatelessWidget {
  const RoundedImage({
    Key? key,
    required this.artical,
  }) : super(key: key);
  final NewsArtical artical;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(data: artical),
            ));
      },
      child: Hero(
        tag: Key(artical.id.toString()),
        child: Container(
          margin: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: NetworkImage(artical.urlToImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12)),
                  backgroundBlendMode: BlendMode.xor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    artical.title,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Article extends StatelessWidget {
  const Article({
    Key? key,
    required this.data,
    required this.curIndex,
  }) : super(key: key);

  final NewsArtical data;
  final int curIndex;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ExpansionTile(
          title: Text(data.title),
          leading: Hero(
            tag: Key(data.id.toString()),
            child: Container(
                width: 60,
                decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor.withOpacity(.8),
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(data.urlToImage),
                        fit: BoxFit.cover))),
          ),
          children: [
            Column(
              children: [
                Text(data.description),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(data: data),
                          ));
                    },
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * .9,
                        child: const Center(child: Text("View Post"))))
              ],
            )
          ],
        ),

        // ListTile(
        //   onTap: () {},
        //   leading: Container(
        //     width: 60,
        //     decoration: BoxDecoration(
        //         color: Theme.of(context).backgroundColor.withOpacity(.8),
        //         borderRadius: BorderRadius.circular(10),
        //         image: DecorationImage(
        //             image: NetworkImage(data.urlToImage), fit: BoxFit.cover)),
        //   ),
        //   title: Text(data.title),
        //   subtitle: Text(data.description),
        //   trailing: CircleAvatar(child: Text((curIndex + 1).toString())),
        // ),
      ),
    );
  }
}

class ChipText extends StatelessWidget {
  const ChipText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .titleMedium!
          .copyWith(color: Colors.black.withOpacity(0.5)),
    );
  }
}

class CustomChip extends StatelessWidget {
  const CustomChip({
    Key? key,
    required this.label,
  }) : super(key: key);
  final Widget label;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor.withOpacity(0.8),
          borderRadius: BorderRadius.circular(500)),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 8,
          bottom: 8,
        ),
        child: label,
      ),
    );
  }
}
