import 'dart:math';
import 'package:flutter/cupertino.dart';

import 'insta.dart';
import 'package:flutter/material.dart';

void main() {
  const app = MyApp();
  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // callback method
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      home: Test(),
    );
  }
}

class Test extends StatelessWidget {
  Test({Key? key}) : super(key: key);

  final List<Insta> InstaList = [
    Insta(imguser: 'assets/images/PFJaehyun.jpg', img: 'assets/images/Jay01.jpg',
        userpost: '_jeongjaehyun',
        comments: [Comments(user: 'gob.spn', comment: "I Love you so much Jaehyun, I hope this yeas will be your great year ❤️❤️❤️"),
          Comments(user: '_jeongjaehyun', comment: 'I love you too @gob.spn'),
          Comments(user: 'yvchies', comment: 'WOYYY😭😭😭')],
        caption: "Adidas X Prada Re-Nylon collection @prada #adidasforprada #광고"),
    Insta(imguser: 'assets/images/PFDoyoung.jpg', img: 'assets/images/Doyoung.jpg',
        userpost: 'do0_nct',
        comments: [Comments(user: 'jennine.jj', comment: 'I love you Doyoung💕💕'),
          Comments(user: 'itimmms', comment: 'I hope this year will be your good year🌻😎'),
          Comments(user: 'do0_nct', comment: '💚💚💚 @jennine.jj @itimmms'),],
        caption: 'Beautiful things to add to my collection, thanks to @kk127sales 🥰 #nct #doyoung #jeno #kpop #collection'),
    Insta(imguser: 'assets/images/PFJaeDo.jpg', img: 'assets/images/JaeDo01.jpg',
        userpost: 'jaedo_shiper',
        comments: [Comments(user: 'dissybu', comment: 'JaeDo Lover 💙 I LOVE YOUR SONG SO MUCH 🔥🔥🔥'),
          Comments(user: 'twentysixtherror', comment: 'So cute!!!')],
        caption: 'JaeDo All The Time'),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      appBar: AppBar(title: Text('JaeDo Moments tweet',
          style: TextStyle(fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontSize: 25.0,))),
      body: ListView.builder(
          itemCount: InstaList.length,
          itemBuilder: (context, index) =>
              MyCard(insta: InstaList[index])),

    );
  }
}
class MyCard extends StatefulWidget {
  final Insta insta;

  const MyCard({
    Key? key,
    required this.insta,
  }) : super(key: key);

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  final controller = TextEditingController();
  var like = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Text(covid.date),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 23,
                  backgroundImage: AssetImage('${widget.insta.imguser}'),
                ),
                SizedBox(width: 10.0),
                Expanded(
                    child: Text(
                        '${widget.insta.userpost}'
                    )
                ),
                IconButton(onPressed: (){}, icon: Icon(Icons.more_vert),)
              ],
            ),
          ),
          Image.asset('${widget.insta.img}',fit: BoxFit.cover,),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                /*SizedBox(width: 5.0),*/
                Expanded(
                    child: Text(
                        '${widget.insta.caption}'))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0,left: 16.0,right: 16.0),
            child: Column(
              children: [
                for(int i=0;i<widget.insta.comments.length;i++)
                  Row(
                    children: [
                      SizedBox(height: 23.0,),
                      Text(
                        '${widget.insta.comments[i].user}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.pink,
                          fontSize: 15.0,
                        ),
                      ),
                      SizedBox(width: 5.0,),
                      Text(
                        '${widget.insta.comments[i].comment}',
                        style: TextStyle(

                        ),
                      )
                    ],
                  ),
              ],
            ),
          ),


          Row(
            children: [
              IconButton(onPressed: (){
                setState(() {
                  like = !like;
                });
              }, icon: like? Icon(Icons.favorite,color: Colors.pink,): Icon(Icons.favorite_border),),
              Expanded(
                child: TextField(
                  onSubmitted: (value){

                    setState(() {
                      widget.insta.comments.add(Comments(user: 'Flutter', comment: value));
                      controller.clear();

                    });
                  },
                  controller: controller,
                  decoration: const InputDecoration(
                    hintText: 'Add a comment',
                  ),
                ),
              ),
            ],
          )


        ],
      ),
    );
  }
}