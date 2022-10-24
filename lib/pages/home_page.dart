import 'package:college_list/widget/college_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/college_provider.dart';
import '../widget/main_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? chipValue = 0;
  bool isFirst = true;
  final searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    if (isFirst) {
      Provider.of<CollegeProvider>(context, listen: false).getAllCollege();
      Provider.of<CollegeProvider>(context, listen: false).getAllCategories();
    }
    isFirst = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        flexibleSpace: SafeArea(
          child: Icon(Icons.ac_unit, color: Colors.white, size: 50),
        ),
      ),
      body: Consumer<CollegeProvider>(
        builder: (context, provider, _) => Column(
          children: [
            Card(
              color: Colors.white70,
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Search",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),


                    ListTile(
                      title: TextField(
                        controller: searchController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Search By Institute Name..',
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          enabled: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(height / 28.1)),
                              borderSide:
                              BorderSide(color: Colors.black, width: 1),
                              gapPadding: 4.0),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(height / 28.1)),
                              borderSide:
                              BorderSide(color: Colors.black, width: 1),
                              gapPadding: 4.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(height / 28.1)),
                              borderSide:
                              BorderSide(color: Colors.black, width: 1),
                              gapPadding: 4.0),
                        ),

                      ),
                      trailing: Consumer<CollegeProvider>(
                          builder: (context, provider, _) => IconButton(
                              onPressed: () {
                                print(searchController.text);
                                provider.getAllSearchedCollegeByName(
                                    searchController.text);
                              },
                              icon: Icon(Icons.search))),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Search By Letters",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 70,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: provider.categoryNameList.length,
                itemBuilder: (context, index) {
                  final catName = provider.categoryNameList[index];
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ChoiceChip(
                      labelStyle: TextStyle(
                          color:
                              chipValue == index ? Colors.white : Colors.black),
                      selectedColor: Theme.of(context).primaryColor,
                      label: Text(catName),
                      selected: chipValue == index,
                      onSelected: (value) {
                        setState(() {
                          chipValue = value ? index : null;
                        });
                        if (chipValue != null && chipValue != 0) {
                          provider.getAllCollegesByCategory(catName);
                        } else if (chipValue == 0) {
                          provider.getAllCollege();
                        }
                      },
                    ),
                  );
                },
              ),
            ),
            Divider(
              height: 3,
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'College List',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            provider.collegeList.isEmpty
                ? const Center(
                    child: Text(
                      'No item found',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: provider.collegeList.length,
                      itemBuilder: (context, index) {
                        print(
                            "full length is  >>>>>>>>>>>>>>>>    ${provider.collegeList.length}");
                        final college = provider.collegeList[index];
                        return CollegeItem(collegeModel: college);
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
