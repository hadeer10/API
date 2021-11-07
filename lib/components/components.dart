import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget BuildArticalItems(artical){
  return Padding(padding:const EdgeInsets.all(20),
    child: Row(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration:BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage('${artical['urlToImage']}'),
                fit: BoxFit.cover,
              )
          ) ,
        ),
        SizedBox(width: 20,),
        Expanded(child: Container(
          height: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(child: Text('${artical['title']}', style: TextStyle(
                  fontSize:18 ,
                  fontWeight: FontWeight.w600
              ),maxLines: 4, overflow: TextOverflow.ellipsis,),),
              Expanded(child:  Text('${artical['publishedAt']}', style: TextStyle(color: Colors.grey),),)
            ],
          ),
        ),)
      ],
    ),
  );
}