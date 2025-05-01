import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:prokoders_login_task/core/util/object_validator.dart';
import 'package:prokoders_login_task/features/authentication/data/user_session.dart';
import 'package:prokoders_login_task/features/items/data/model/product_factory.dart';
import 'package:prokoders_login_task/features/items/data/model/product_model.dart';
import 'package:prokoders_login_task/features/items/data/repos/item_repository.dart';
import 'package:prokoders_login_task/core/util/ui_state.dart';

class ItemProvider with ChangeNotifier {
  ItemProvider(this.itemRepository) {
    fetchItems();
    scrollController.addListener(_onScroll);
  }

  final ItemRepository itemRepository;
  final ObjectValidator objectValidator = ObjectValidator();

  int page = 0;
  ScrollController scrollController = ScrollController();

  UiState<List<Products>> itemsState = UiState(data: []);
  UiState<void> addItemState = UiState();
  UiState<void> loadMoreState = UiState();

  List<Products> get items => itemsState.data ?? [];
  bool get isLoading => itemsState.isLoading;
  String? get error => itemsState.error;
  String? get moreItemError => loadMoreState.error;

  void _onScroll() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      fetchMoreItems();
    }
  }

  Future<void> fetchItems() async {
    itemsState = itemsState.copyWith(isLoading: true, error: null);
    notifyListeners();
    try {
      final result = await itemRepository.fetchItems(page: 0);
      result.fold(
        (failure) {
          itemsState = itemsState.copyWith(error: failure.errMessage);
        },
        (response) {
          itemsState = UiState(data: response.products);
        },
      );
    } catch (e) {
      itemsState = itemsState.copyWith(error: "Failed to load items");
    } finally {
      itemsState = itemsState.copyWith(isLoading: false);
      notifyListeners();
    }
  }

  Future<void> fetchMoreItems() async {
    loadMoreState = loadMoreState.copyWith(isLoading: true, error: null);
    page += 1;
    notifyListeners();
    try {
      final result = await itemRepository.fetchItems(page: page);
      result.fold(
        (failure) {
          loadMoreState = loadMoreState.copyWith(error: failure.errMessage);
        },
        (response) {
          final updatedList = [...items, ...response.products!];
          itemsState = itemsState.copyWith(data: updatedList);
        },
      );
    } catch (e) {
      loadMoreState = loadMoreState.copyWith(error: "Failed to load items");
      if (page > 0) page -= 1;
    } finally {
      loadMoreState = loadMoreState.copyWith(isLoading: false);
      notifyListeners();
    }
  }

  Future<void> addItem(
    BuildContext context, {
    required String title,
    required String description,
  }) async {
    final validation = objectValidator.verifyTitleAndDescription(
      title,
      description,
    );
    if (validation != "true") {
      addItemState = addItemState.copyWith(error: validation);
      notifyListeners();
      return;
    }

    addItemState = addItemState.copyWith(isLoading: true, error: null);
    notifyListeners();

    try {
      final result = await itemRepository.addItem(
        title: title.trim(),
        description: description.trim(),
      );
      result.fold(
        (failure) {
          addItemState = addItemState.copyWith(error: failure.errMessage);
        },
        (response) async {
          final product = ProductFactory.createWithParams(
            id: 0,
            title: title,
            description: description,
            image: [''],
          );
          items.insert(0, product);
          Navigator.of(context).pop();
        },
      );
    } catch (e) {
      addItemState = addItemState.copyWith(
        error: e.toString().replaceFirst("Exception: ", ""),
      );
    } finally {
      addItemState = addItemState.copyWith(isLoading: false);
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    UserSession().clear();
  }
}
