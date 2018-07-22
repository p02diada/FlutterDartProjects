import 'dart:convert';
import 'package:http/http.dart' show Client;

import '../models/item_model.dart';

final _ROOT_URL = 'https://hacker-news.firebaseio.com/v0';

class NewsApiProvider {
  Client client = Client();

  fetchTopIds() async {
    final response = await client.get('${_ROOT_URL}/topstories.json');
    final ids = json.decode(
        response.body); //Convert response from API into ItemModel instance

    return ids;
  }

  fetchItem(int id) async {
    final response = await client.get('${_ROOT_URL}/item/${id}.json');
    final parsedJson = json.decode(response.body);

    return ItemModel.fromJson(
        parsedJson); //Convert response from API into ItemModel instance
  }
}