// @dart=2.9

import 'package:a2is/pages/product_page.dart';
import 'package:flutter/material.dart';

import '../api_service.dart';
import 'package:a2is/models/category.dart';
import 'package:flutter/src/widgets/image.dart' as Image;

class WidgetCategories extends StatefulWidget {
  @override
  _WidgetCategoriesState createState() => _WidgetCategoriesState();
}

class _WidgetCategoriesState extends State<WidgetCategories> {
  APIService apiService;

  @override
  void initState() {
    apiService = new APIService();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16, top: 4),
                child: Text(
                  'Catégories',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, top: 10, right: 10),
                child: Text(
                  'Voir tout',
                  style: TextStyle(color: Colors.redAccent),
                ),
              )
            ],
          ),
          _categoriesList()
        ],
      ),
    );
  }

  Widget _categoriesList() {
    return new FutureBuilder(
        future: apiService.getCategories(),
        builder: (BuildContext context, AsyncSnapshot<List<Category>> model, ) {
          if(model.hasData){
            return _buildCategoryList(model.data);
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
    );
  }

  Widget _buildCategoryList(List<Category> categories) {
    return Container(
      height: 150,
      alignment: Alignment.centerLeft,
      child: ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            var data = categories[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductPage()));
              },
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    width: 80,
                    height: 80,
                    alignment: Alignment.center,
                    child: Image.Image.network(
                      //data.image.url,
                      "https://www.ncenet.com/wp-content/uploads/2020/04/No-image-found.jpg",
                      height: 80,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 5),
                            blurRadius: 15),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(data.categoryName.toString()),
                      //Text("catg"),
                      Icon(
                        Icons.keyboard_arrow_right,
                        size: 14,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
      ),
    );
  }
}
