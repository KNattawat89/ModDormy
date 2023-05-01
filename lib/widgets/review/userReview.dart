import 'package:flutter/material.dart';

class UserReview extends StatefulWidget {
  const UserReview({super.key});

  @override
  State<UserReview> createState() => _UserReviewState();
}

class _UserReviewState extends State<UserReview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
      height: MediaQuery.of(context).size.height * 0.25,
      child: Expanded(
        child: Column(children: [
          //review header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //avatar
              Container(
                width: MediaQuery.of(context).size.height * 0.25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
                    ),

                    //username
                    Column(
                      children: [
                        Text('EveInwza007'),
                        Text('2020-10-10'),
                      ],
                    ),

                    //rating
                    Text('⭐⭐⭐⭐⭐'),
                  ],
                ),
              ),

              //delete button
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {},
              ),
            ],
          ),

          //review detail
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('1'),
                  VerticalDivider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  Text('2')
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
