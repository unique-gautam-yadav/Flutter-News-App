import 'package:dainik_ujala/Views/secondary_tab.dart';
import 'package:flutter/material.dart';

import '../UI Components/compnents.dart';
import 'home_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool themeToggle = false;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            SizedBox(height: 55, child: Image.asset("assets/images/logo.png")),
        actions: [
          IconButton(
              onPressed: () {
                /**/
              },
              icon: const Icon(Icons.search)),
          const PopUpMenu(),
        ],
        bottom: TabBar(
          padding: const EdgeInsets.all(3),
          isScrollable: true,
          indicatorWeight: 0,
          labelPadding:
              const EdgeInsets.only(left: 1.3, right: 1.3, top: 1, bottom: 1),
          controller: _tabController,
          splashBorderRadius: BorderRadius.circular(20),
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).primaryColor),
          labelStyle: Theme.of(context).textTheme.bodyText2,
          tabs: const [
            Tab(height: 40, child: CustomChip(label: ChipText(text: "Home"))),
            Tab(
                height: 40,
                child: CustomChip(label: ChipText(text: "Business"))),
            Tab(
                height: 40,
                child: CustomChip(label: ChipText(text: "Politics"))),
            Tab(
                height: 40,
                child: CustomChip(label: ChipText(text: "Entertainment"))),
            Tab(height: 40, child: CustomChip(label: ChipText(text: "Sport"))),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          // Center(child: Text("होम पेज में आपका स्वागत है।")),
          HomeTab(),
          // Center(child: Text("बृज समाचार पेज में आपका स्वागत है।")),
          SecondaryTab(title: "business"),
          // Center(child: Text("प्रदेश पेज में आपका स्वागत है।")),
          SecondaryTab(title: "politics"),
          // Center(child: Text("खेल पेज में आपका स्वागत है।")),
          SecondaryTab(title: "entertainment"),
          // Center(child: Text("देश-विदेश पेज में आपका स्वागत है।")),
          SecondaryTab(title: "sport"),
        ],
      ),
    );
  }
}
