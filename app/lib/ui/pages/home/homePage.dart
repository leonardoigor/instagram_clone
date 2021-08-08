import 'package:app/domain/entities/entities.dart';
import 'package:app/ui/pages/home/homePresenter.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final HomePresenter presenter;

  const HomePage({Key? key, required this.presenter}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'instagram',
          style: TextStyle(
            fontFamily: 'Segoe Print',
          ),
        ),
        actions: [
          Icon(Icons.add_box),
          const SizedBox(
            width: 10,
          ),
          Icon(Icons.favorite_border),
          const SizedBox(
            width: 10,
          ),
          Icon(Icons.near_me),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: ListView(
        children: [
          ...presenter.mapFeedItem().map((e) => FeedItemWidget(item: e))
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        height: 50,
        child: Center(
          child: SizedBox(
            width: _size.width * .9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.home,
                  size: 50,
                  color: Colors.white,
                ),
                Icon(
                  Icons.search,
                  size: 50,
                  color: Colors.white,
                ),
                Icon(
                  Icons.play_circle_outline,
                  size: 50,
                  color: Colors.white,
                ),
                Icon(
                  Icons.local_mall_outlined,
                  size: 50,
                  color: Colors.white,
                ),
                Icon(
                  Icons.account_circle_outlined,
                  size: 50,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FeedItemWidget extends StatelessWidget {
  const FeedItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final FeedItem item;
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: item.id == 1 ? 0 : 20),
      color: Colors.black,
      height: _size.height - 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderFeedItem(item: item),
          const SizedBox(height: 10),
          ContentFeedItemWidget(size: _size, item: item),
          const SizedBox(height: 5),
          SizedBox(
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.favorite_border, color: Colors.white, size: 30),
                Icon(Icons.mode_comment, color: Colors.white, size: 30),
                Icon(Icons.send, color: Colors.white, size: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ContentFeedItemWidget extends StatelessWidget {
  const ContentFeedItemWidget({
    Key? key,
    required Size size,
    required this.item,
  })  : _size = size,
        super(key: key);

  final Size _size;
  final FeedItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _size.height - 200,
      color: Colors.black,
      child: Image.network(
        item.urlImg,
        fit: BoxFit.cover,
      ),
    );
  }
}

class HeaderFeedItem extends StatelessWidget {
  const HeaderFeedItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final FeedItem item;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Colors.black,
              ),
              width: 30,
              height: 30,
              child: Image.network(item.urlImg),
            ),
            const SizedBox(width: 10),
            Text(
              item.title,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        Icon(
          Icons.more_horiz,
          color: Colors.white,
        ),
      ],
    );
  }
}
