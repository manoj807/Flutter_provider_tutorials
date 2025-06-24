import 'package:flutter/material.dart';
import 'package:flutter_state_management/example_two/provider/example_two_provider.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ExampleTwoProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Example Two')),
      body: Column(
        children: [
          Expanded(
            /* child: ListView.builder(
                  itemCount: provider.selectedValue.length,
                  itemBuilder: (context, index){
                    return Card(
                      child: Consumer<ExampleTwoProvider>(builder: (context, value, child){
                        return ListTile(
                          onTap: (){

                          },
                          title: Text('item '+provider.selectedValue[index].toString(),),
                          trailing: const Icon(Icons.favorite),
                        );
                      }),
                    );

                  }))*/
            child: Consumer<ExampleTwoProvider>(
              builder: (context, provider, child) {
                print("Building Favourite Screen");
                return ListView.builder(
                  itemCount: provider.selectedValue.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Consumer<ExampleTwoProvider>(
                        builder: (context, value, child) {
                          return ListTile(
                            onTap: () {},
                            title: Text(
                              'item ' +
                                  provider.selectedValue[index].toString(),
                            ),
                            trailing: const Icon(Icons.favorite),
                          );
                        },
                      ),
                    );
                  },
                );
              },
              // Set to false to avoid unnecessary rebuilds
            ),
          ),
        ],
      ),
    );
  }
}
