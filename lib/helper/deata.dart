import 'package:flutter/material.dart';
import 'package:news_nepal/Modals/category.dart';
import 'package:news_nepal/view/category.dart';
List<CategoryModel> getCategories(){
  List<CategoryModel> category =new List<CategoryModel>();
  CategoryModel categorymodel =new CategoryModel();

  categorymodel.categoryName="Business";
  categorymodel.imageUrl="https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
  category.add(categorymodel);

  categorymodel = new CategoryModel();
  categorymodel.categoryName="Entertainment";
  categorymodel.imageUrl="https://images.unsplash.com/photo-1514525253161-7a46d19cd819?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=967&q=80";
  category.add(categorymodel);

  categorymodel = new CategoryModel();
  categorymodel.categoryName="Netflix";
  categorymodel.imageUrl="https://images.unsplash.com/photo-1574375927938-d5a98e8ffe85?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1949&q=80";
  category.add(categorymodel);

  categorymodel = new CategoryModel();
  categorymodel.categoryName="Science";
  categorymodel.imageUrl="https://images.unsplash.com/photo-1514525253161-7a46d19cd819?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=967&q=80";
  category.add(categorymodel);
  
  categorymodel = new CategoryModel();
  categorymodel.categoryName="Politics";
  categorymodel.imageUrl="https://images.unsplash.com/photo-1514525253161-7a46d19cd819?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=967&q=80";
  category.add(categorymodel);
  return category;


}