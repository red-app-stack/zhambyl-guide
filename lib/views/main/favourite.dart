import 'package:flutter/material.dart';
import 'package:zhambyl_guide/views/shared/bottom_sheet.dart';
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
      "description":
          "Айша-Биби (каз. Айша бибі) — мавзолей эпохи Караханидов, XII века постройки, расположенный в селе Айша-Биби Жамбылского района Жамбылской области в 18 км от города Тараза. Является памятником архитектуры республиканского значения.\n Основание мавзолея — кубическое. По его четырём углам размещены массивные колонны. В оформлении использовались небольшие ниши, малые колонки, своды, стрельчатые арки, терракотовая облицовочная плитка. В узорах мавзолея сочетаются традиционные виды орнаментального искусства древних племён Казахстана, включающие геометрический, зооморфный и солярный мотивы, уходящие корнями в искусство андроновских и сакских племён.",
      "images": [
        "assets/locations/The-Republic-of-Kazakhstan/Zhambyl/Aisha-Bibi-Mausoleum/1.png",
      ],
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
    final theme = Theme.of(context);

    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Избранные места",
              style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
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
                    onTap: () {
                      _showLocationBottomSheet(context, location);
                    },
                    onLikeToggle: () => toggleLike(index),
                  );
                },
              ),
            )
          ])),
    );
  }
}

void _showLocationBottomSheet(BuildContext context, Map<String, dynamic> location) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => TravelBottomSheet(location: location),
  );
}
