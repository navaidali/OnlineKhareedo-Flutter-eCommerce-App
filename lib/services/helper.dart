import 'package:flutter/services.dart' as the_bundle;
import 'package:online_khareedo/models/sneakers_model.dart';

class Helper{

  //Male
  Future<List<Sneakers>> getMaleSneakers() async {
    final data= await the_bundle.rootBundle.loadString("assets/json/men_shoes.json");

    final maleList = sneakersFromJson(data);

    return maleList;
  }

  //Female
    Future<List<Sneakers>> getFemaleSneakers() async {
      final data= await the_bundle.rootBundle.loadString("assets/json/women_shoes.json");

      final femaleList = sneakersFromJson(data);

      return femaleList;

    }

  //Kids
  Future<List<Sneakers>> getKidsSneakers() async {
    final data= await the_bundle.rootBundle.loadString("assets/json/kids_shoes.json");

    final kidsList = sneakersFromJson(data);

    return kidsList;
  }

  // Male Single
  Future<Sneakers> getMaleSneakerById(String id) async {
    final data= await the_bundle.rootBundle.loadString("assets/json/men_shoes.json");

    final maleList = sneakersFromJson(data);

    final sneaker = maleList.firstWhere((sneaker) => sneaker.id==id);
    return sneaker;
  }

  // Female Single
  Future<Sneakers> getFemaleSneakerById(String id) async {
    final data= await the_bundle.rootBundle.loadString("assets/json/women_shoes.json");

    final femaleList = sneakersFromJson(data);

    final sneaker = femaleList.firstWhere((sneaker) => sneaker.id==id);
    return sneaker;
  }

  // kids Single
  Future<Sneakers> getKidsSneakerById(String id) async {
    final data= await the_bundle.rootBundle.loadString("assets/json/kids_shoes.json");

    final kidsList = sneakersFromJson(data);

    final sneaker = kidsList.firstWhere((sneaker) => sneaker.id==id);
    return sneaker;
  }
}