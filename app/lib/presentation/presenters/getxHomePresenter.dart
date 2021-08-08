import 'package:app/domain/entities/feedItem.dart';
import 'package:app/ui/pages/home/homePresenter.dart';
import 'package:get/get.dart';

class GetxHomePresenter extends HomePresenter {
  final _itemJson = RxList([
    {
      'urlImg':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXrv-yMhXEkCHtgOYxBs6IiOrJnPBoETNhxA&usqp=CAU',
      'title': 'Carol Eduarda',
      'urlContent': 'urlContent',
      'id': 1,
    },
    {
      'urlImg':
          'https://i.pinimg.com/originals/46/53/3b/46533ba729e2f392a82672b878cda9d4.jpg',
      'title': 'Igor Leonardo',
      'urlContent': 'urlContent',
      'id': 1,
    },
  ]);

  @override
  Stream<List> get itemsJson => _itemJson.stream;

  @override
  List<FeedItem> mapFeedItem() {
    List<FeedItem> list = [];
    this._itemJson.value.forEach((el) {
      list.add(FeedItem.fromMap(el));
    });
    return list;
  }
}
