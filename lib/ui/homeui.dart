import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usersexplorer/states/userStates.dart';
import 'package:usersexplorer/ui/userDetails.dart';
import '../commonFunctions.dart' as common_functions;
import '../enums.dart';
import 'user_search_delegate.dart';
import 'package:connectivity/connectivity.dart';
//import 'package:shared_preferences/shared_preferences.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserState>(
      builder: (context, userState, _) => Scaffold(
        appBar: AppBar(
          title: const Text("Users Explorer", 
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.redAccent,
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: (){
                showSearch(context: context, delegate: UserSearchDelegate(userState.users),
                );
              },
            ),
          ],
        ),
        floatingActionButton: new FloatingActionButton(
          tooltip: "Reload",
          child: (userState.state == viewState.IsLoading)?CircularProgressIndicator(backgroundColor: Colors.red,):Icon(Icons.refresh),
          onPressed: () async {
            final connectivityResult = await Connectivity().checkConnectivity();
            if (connectivityResult == ConnectivityResult.none) {

            } else {
              
            userState.loadData();
            }
          },
        ),
        body: (userState.state == viewState.IsLoading)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: userState.users.length,
                itemBuilder: (context, index) => ListTile(
                  leading: new Hero(
                    tag: "images$index",
                    child: CircleAvatar(
                      backgroundImage:
                          new NetworkImage(userState.users[index].pictureSmall),
                    ),
                  ),
                  title: new Text(
                    userState.users[index].fullName(),
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: new Text(userState.users[index].email),
                  trailing: new SizedBox(
                    height: 20.0,
                    child: new Image.asset(common_functions.menOrWomen(
                        userState.users[index].gender)),
                  ),
                  onTap: () {
                    userState.currentSelected = userState.users[index];
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (context) => Details(),
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}
