import 'package:card_swiper/card_swiper.dart';
import 'package:collection_view_label_app/detailPage.dart';
import 'package:collection_view_label_app/insert.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<String> heroList = [];
  late String heroImage = '유비';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    heroList.add('유비');
    heroList.add('장비');
    heroList.add('조조');

    heroList.add('초선');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Collection View'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return InsertPage(
                    heroList: heroList,
                  );
                },
              )).then(
                (value) {
                  setState(() {
                    heroList;
                  });
                },
              );
            },
            icon: Icon(Icons.add_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 350,
                height: 300,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      color: Colors.yellow,
                      child: Center(
                        child: Text(
                          heroList[index],
                        ),
                      ),
                    );
                  },
                  itemCount: heroList.length,
                  pagination: SwiperPagination(),
                  control: SwiperControl(),
                  onIndexChanged: (value) {
                    setState(() {
                      heroImage = heroList[value];
                    });
                  },
                ),
              ),
            ],
          ),
          Image.asset('images/$heroImage.png')
        ],
      ),
      // body: GridView.builder(
      //   itemCount: heroList.length,
      //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 3,
      //     crossAxisSpacing: 10,
      //     mainAxisSpacing: 10,
      //   ),
      //   itemBuilder: (context, index) {
      //     return Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Container(
      //         color: Colors.grey,
      //         child: GestureDetector(
      //           onTap: () {
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                 builder: (context) {
      //                   return DetailPage(
      //                     heroName: heroList[index],
      //                   );
      //                 },
      //               ),
      //             );
      //           },
      //           child: Card(
      //             color: Colors.yellow,
      //             child: Center(
      //               child: Text(
      //                 heroList[index],
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
