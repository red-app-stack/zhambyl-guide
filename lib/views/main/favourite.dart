import 'package:flutter/material.dart';
import 'package:zhambyl_guide/widgets/common/location_card.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  final List<Map<String, dynamic>> favouriteLocations = [
    {
      "title": "Мавзолей Айша-Биби",
      "subtitle": "Тараз, Казахстан",
      "image": "assets/locations/The-Republic-of-Kazakhstan/Zhambyl/Aisha-Bibi-Mausoleum/1.png",
      "isLiked": true,
    },
  ];

  void toggleLike(int index) {
    setState(() {
      favouriteLocations[index]["isLiked"] = !favouriteLocations[index]["isLiked"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Избранное"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: favouriteLocations.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            final location = favouriteLocations[index];
            return LocationCard(
              location: location,
              onLikeToggle: () => toggleLike(index),
            );
          },
        ),
      ),
    );
  }
}
