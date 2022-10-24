import 'package:college_list/model/college_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CollegeItem extends StatefulWidget {
  final CollegeModel collegeModel;

  const CollegeItem({Key? key, required this.collegeModel}) : super(key: key);

  @override
  State<CollegeItem> createState() => _CollegeItemState();
}

class _CollegeItemState extends State<CollegeItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: [
          ListTile(
            onTap: () {},
            leading: CircleAvatar(
              child: FadeInImage.assetNetwork(
                fadeInDuration: const Duration(seconds: 2),
                fadeInCurve: Curves.bounceInOut,
                placeholder: 'images/placeholder.jpg',
                image: widget.collegeModel.imageUrl!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              widget.collegeModel.name!,
              style: const TextStyle(fontSize: 16),
            ),
            subtitle: Text(
              '${widget.collegeModel.location!}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(
            height: 6,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.phone,size: 30,),
                ),
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.whatsapp,size: 30,),
                ),
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.video_call,size: 30,),
                ),
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.message,size: 30,),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
