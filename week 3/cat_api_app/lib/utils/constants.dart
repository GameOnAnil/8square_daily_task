import 'package:cat_api_app/ui/home/screens/breed_page/breed_page.dart';
import 'package:cat_api_app/ui/home/screens/favourite_page/favourite_page.dart';
import 'package:cat_api_app/ui/home/screens/search_page/search_page.dart';
import 'package:cat_api_app/ui/home/screens/upload_page/upload_page.dart';
import 'package:cat_api_app/ui/home/screens/votes_page/vote_page.dart';
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
  const SearchPage(),
  const FavouritePage(),
  const UploadPage(),
];
