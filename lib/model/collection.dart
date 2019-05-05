import 'dart:async';

import 'package:flutter_demo/utils/sql.dart';

abstract class CollectionInterface {
  String get name;
  String get router;
}

class Collection implements CollectionInterface {
  String name;
  String router;

  Collection({this.name, this.router});

  factory Collection.fromJSON(Map json) {
    return Collection(name: json['name'], router: json['router']);
  }

  Object toMap() {
    return {'name': name, 'router': router};
  }
}

class CollectionControlModel {
  final String table = 'collection';
  Sql sql;

  CollectionControlModel() {
    sql = Sql.setTable(table);
  }

  // 获取所有的收藏

  // 插入新收藏
  Future insert(Collection collection) {
    var result =
        sql.insert({'name': collection.name, 'router': collection.router});
    return result;
  }

  // 获取全部的收藏
  Future<List<Collection>> getAllCollection() async {
    List list = await sql.getByCondition();
    List<Collection> resultList = [];
    list.forEach((item) {
      print(item);
      resultList.add(Collection.fromJSON(item));
    });
    return resultList;
  }

  // 通过收藏名获取router
  Future getRouterByName(String name) async {
    List list = await sql.getByCondition(conditions: {'name': name});
    return list;
  }

  // 删除
  Future deleteByName(String name) async {
    return await sql.delete(name, 'name');
  }
}
