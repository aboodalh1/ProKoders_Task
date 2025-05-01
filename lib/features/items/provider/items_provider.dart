import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prokoders_login_task/features/authentication/data/user_session.dart';
import 'package:prokoders_login_task/features/items/data/repos/item_repository.dart';
import '../data/model/product_model.dart';

class ItemProvider with ChangeNotifier {
  ItemProvider(this.itemRepository) {
    fetchItems();
    scrollController.addListener(_onScroll);
  }

  int page = 0;
  _onScroll() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
    page = page+1;
      fetchMoreItems(page: page );
    }
  }

  bool isLoadingMore = false;
  bool _isLoading = false;
  bool isAddItemLoading = false;

  ScrollController scrollController = ScrollController();
  
  final ItemRepository itemRepository;

  List<Products> _items = [];
  
  
  String? _error;
  
  String? _addItemError;

  List<Products> get items => _items;

  bool get isLoading => _isLoading;

  String? get error => _error;

  String? get addItemError => _addItemError;

  Future<void> fetchItems() async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      var result = await itemRepository.fetchItems(page: 0);
      result.fold(
        (failure) {
          _error = failure.errMessage;
        },
        (response) {
          _items.addAll (response.products!);
        },
      );
    } catch (e) {
      _error = "Failed to load items";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchMoreItems({required int page}) async {
    isLoadingMore = true;
    _error = null;
    notifyListeners();
    try {
      var result = await itemRepository.fetchItems(page: page);
      result.fold(
        (failure) {
          _error = failure.errMessage;
        },
        (response) {
          _items.addAll(response.products!);
        },
      );
    } catch (e) {
      _error = "Failed to load items";
    } finally {
      isLoadingMore = false;
      notifyListeners();
    }
  }

  Future<void> addItem(context ,{required String title, required String description}) async {
  try {
    if(title.trim().length<3 || title.trim().length>40){
      _addItemError = "Title must be between 3 and 40 char";
      throw _addItemError!;
    }  
    if(description.trim().length<10 || description.trim().length>140){
      _addItemError = "Description must be between 10 and 140 char";
      throw _addItemError!;
    }
  isAddItemLoading = true;
  _addItemError = null;
  notifyListeners(); 
    final result = await itemRepository.addItem(title: title.trim(), description: description.trim());
    result.fold(
      (failure) {
        _addItemError = failure.errMessage;
        throw _addItemError!;
      },
      (response) async {
    _items.insert(0,Products(description: description,id: 195,images:  [''],title: title));
    Navigator.of(context).pop();
    _addItemError = null;
        await fetchItems(); 
      }, 
    );
  } catch (e) {
    _addItemError = e.toString().substring(11,e.toString().length);
    notifyListeners();
  } finally {
    isAddItemLoading = false;
    notifyListeners();
  }
}


  Future <void> signOut() async 
  {
    await FirebaseAuth.instance.signOut();
    UserSession().clear();
  }

}
