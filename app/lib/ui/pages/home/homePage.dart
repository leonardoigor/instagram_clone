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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HistoryContent(size: _size, presenter: presenter),
            FeedWidgetListViewWidget(presenter: presenter),
          ],
        ),
      ),
      bottomNavigationBar: BottomnavigationCustomWidget(size: _size),
    );
  }
}

class HistoryContent extends StatelessWidget {
  const HistoryContent({
    Key? key,
    required Size size,
    required this.presenter,
  })  : _size = size,
        super(key: key);

  final Size _size;
  final HomePresenter presenter;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.only(top: 5),
      height: 110,
      width: _size.width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: presenter
            .mapHistoryItem()
            .map(
              (e) => Container(
                margin: EdgeInsets.only(left: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                width: 66,
                height: 66,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.transparent),
                        gradient: LinearGradient(
                          colors: [
                            Colors.red,
                            Colors.purple,
                          ],
                        ),
                      ),
                      child: SizedBox(
                        width: 66,
                        height: 66,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: Image.network(
                            e.urlImg,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      e.name.substring(0, 8),
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class FeedWidgetListViewWidget extends StatelessWidget {
  const FeedWidgetListViewWidget({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  final HomePresenter presenter;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...presenter.mapFeedItem().map((e) => FeedItemWidget(item: e))
      ],
    );
  }
}

class BottomnavigationCustomWidget extends StatelessWidget {
  const BottomnavigationCustomWidget({
    Key? key,
    required Size size,
  })  : _size = size,
        super(key: key);

  final Size _size;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: 30,
      child: Center(
        child: SizedBox(
          width: _size.width * .9,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.home,
                size: 30,
                color: Colors.white,
              ),
              Icon(
                Icons.search,
                size: 30,
                color: Colors.white,
              ),
              Icon(
                Icons.play_circle_outline,
                size: 30,
                color: Colors.white,
              ),
              Icon(
                Icons.local_mall_outlined,
                size: 30,
                color: Colors.white,
              ),
              Icon(
                Icons.account_circle_outlined,
                size: 30,
                color: Colors.white,
              ),
            ],
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
      padding: EdgeInsets.symmetric(horizontal: 10),
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
            width: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.favorite_border, color: Colors.white, size: 20),
                Icon(Icons.mode_comment_outlined,
                    color: Colors.white, size: 20),
                Icon(Icons.send_outlined, color: Colors.white, size: 20),
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
