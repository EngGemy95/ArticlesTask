import 'package:flutter/material.dart';
import 'package:link_development_task/presentation/resource_data/values_managers.dart';
import 'package:link_development_task/presentation/widgets/card_item.dart';

import '../../domain/models/models.dart';

class SearchBarDelegate extends SearchDelegate<ItemModel> {
  final List<ItemModel> itemList;

  SearchBarDelegate(this.itemList);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, ItemModel("", "", "", "", "", ""));
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final filteredItems = itemList
        .where((item) => item.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return getList(filteredItems);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final filteredItems = itemList
        .where((item) => item.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return getList(filteredItems);
  }

  Widget getList(filteredItems) {
    return ListView.builder(
      itemCount: filteredItems.length,
      itemBuilder: (ctx, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p20, vertical: AppPadding.p20),
          child: CardItem(
            item: filteredItems[index],
            ctx: ctx,
          ),
        );
      },
    );
  }
}
