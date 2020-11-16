import 'package:flutter/material.dart';
import 'package:training/news.dart';

class CategoryNews extends StatefulWidget {
  final String newsCategory;
  CategoryNews({this.newsCategory});
  
  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  var newslist;
  bool _loading = true;

  @override
  void initState() {
    
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}