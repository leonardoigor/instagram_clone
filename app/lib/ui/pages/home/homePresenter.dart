import 'package:app/domain/entities/feedItem.dart';

abstract class HomePresenter {
  Stream<List> get itemsJson;

  List<FeedItem> mapFeedItem();
}
