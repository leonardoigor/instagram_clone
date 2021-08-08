import 'package:app/domain/entities/entities.dart';

abstract class HomePresenter {
  Stream<List> get itemsJson;
  Stream<List> get historiesJson;

  List<FeedItem> mapFeedItem();
  List<HistoryItem> mapHistoryItem();
}
