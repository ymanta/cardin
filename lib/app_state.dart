import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _croppedImage = '';
  String get croppedImage => _croppedImage;
  set croppedImage(String value) {
    _croppedImage = value;
  }

  String _actualizarPagina = '';
  String get actualizarPagina => _actualizarPagina;
  set actualizarPagina(String value) {
    _actualizarPagina = value;
  }

  List<String> _listausuarios = [];
  List<String> get listausuarios => _listausuarios;
  set listausuarios(List<String> value) {
    _listausuarios = value;
  }

  void addToListausuarios(String value) {
    listausuarios.add(value);
  }

  void removeFromListausuarios(String value) {
    listausuarios.remove(value);
  }

  void removeAtIndexFromListausuarios(int index) {
    listausuarios.removeAt(index);
  }

  void updateListausuariosAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    listausuarios[index] = updateFn(_listausuarios[index]);
  }

  void insertAtIndexInListausuarios(int index, String value) {
    listausuarios.insert(index, value);
  }

  final _userDocQueryManager = FutureRequestManager<UsersRecord>();
  Future<UsersRecord> userDocQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<UsersRecord> Function() requestFn,
  }) =>
      _userDocQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserDocQueryCache() => _userDocQueryManager.clear();
  void clearUserDocQueryCacheKey(String? uniqueKey) =>
      _userDocQueryManager.clearRequest(uniqueKey);
}
