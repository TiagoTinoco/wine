import 'package:mobx/mobx.dart';
part 'card.store.g.dart';

class CardStore = _CardStore with _$CardStore;

abstract class _CardStore with Store {
  @observable
  int quantity = 1;

  @action
  void incrementQuantity() {
    quantity++;
  }

  @action
  void decrementQuantity() {
    quantity--;
  }
}
