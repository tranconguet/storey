import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/components/heading_bar_for_search_page.dart';
import 'package:store_app/controller/search_page_controller.dart';
import './components/body.dart';

class SearchScreen extends StatelessWidget {
  static String routeName = "/search";
  @override
  var searchController = Get.put(SearchController());
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context).settings.arguments;
    Get.find<SearchController>().search(arguments);
    return Scaffold(
      appBar: HeadingBar(
        searchingText: arguments,
      ),
      body: Body(),
    );
  }
}
