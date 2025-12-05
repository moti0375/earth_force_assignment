
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'map_tab_store.g.dart';

@injectable
class MapTabStore extends MapTabStoreBase with _$MapTabStore{
  MapTabStore() : super();
}

abstract class MapTabStoreBase with Store {
  MapTabStoreBase();
}