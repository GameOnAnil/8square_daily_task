import 'package:cat_api_app/ui/home/screens/tabs/breed_page.dart';
import 'package:cat_api_app/ui/home/screens/tabs/favourite_page.dart';
import 'package:cat_api_app/ui/home/screens/tabs/images_page.dart';
import 'package:cat_api_app/ui/home/screens/tabs/upload_page.dart';
import 'package:cat_api_app/ui/home/screens/tabs/vote_page.dart';
import 'package:flutter/material.dart';

List<Tab> tabTitleList = [
  const Tab(text: "Vote", icon: null),
  const Tab(text: "Breed", icon: null),
  const Tab(text: "Images/Search", icon: null),
  const Tab(text: "Favourites", icon: null),
  const Tab(text: "Upload", icon: null),
];

List<Widget> tabContent = [
  const VotePage(),
  const BreedPage(),
  const ImagesPage(),
  const FavouritePage(),
  const UploadPage(),
];
