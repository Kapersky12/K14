//import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:flutter/material.dart';
import 'package:usersexplorer/models/user_model.dart';

class UserSearchDelegate extends SearchDelegate<User> {
  final List<User> allUsers;

  UserSearchDelegate(this.allUsers);

  @override 
  List<Widget> buildActions(BuildContext context){
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final filteredUsers = allUsers.where((user) {
      final fullName = user.fullName().toLowerCase();
      final toLowerCaseQuery = query.toLowerCase();
      
      return fullName.contains(toLowerCaseQuery);
    }).toList();

    return ListView.builder(
      itemCount: filteredUsers.length,
      itemBuilder: (context, index){
        final user = filteredUsers[index];
        return ListTile(
          title: Text(user.fullName()),
          subtitle: Text(user.email),
          //nous ajusterons avec d'autres détails de l'user...
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}

