import 'package:flutter/material.dart';
import 'package:zhambyl_guide/widgets/common/location_card.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> locations = [
    {
      "title": "Мавзолей Айша-Биби",
      "subtitle": "Тараз, Казахстан",
      "image": "assets/locations/The-Republic-of-Kazakhstan/Zhambyl/Aisha-Bibi-Mausoleum/1.png",
      "isLiked": true,
    },
    {
      "title": "Тектурмас",
      "subtitle": "Тараз, Казахстан",
      "image": "assets/locations/The-Republic-of-Kazakhstan/Zhambyl/Tekturmas/1.png",
      "isLiked": false,
    },
    {
      "title": "Мавзолей Бабаджи Хатун",
      "subtitle": "Тараз, Казахстан",
      "image": "assets/locations/The-Republic-of-Kazakhstan/Zhambyl/Babaji-Khatun-Mausoleum/1.png",
      "isLiked": false,
    },
    {
      "title": "Мавзолей Карахана",
      "subtitle": "Тараз, Казахстан",
      "image": "assets/locations/The-Republic-of-Kazakhstan/Zhambyl/Karahan-Mausoleum/1.png",
      "isLiked": false,
    },
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category Tabs
            Text("Гид по Жамбылской области", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Row(
              children: ["Тараз", "Каратау", "Жанатас", "Шу"]
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Chip(
                          label: Text(e, style: TextStyle(color: e == "Тараз" ? theme.colorScheme.surfaceBright : theme.colorScheme.secondary)),
                          backgroundColor: e == "Тараз" ? theme.colorScheme.primary : theme.colorScheme.surfaceBright,
                          labelPadding: EdgeInsets.symmetric(
                            horizontal: (e.length <= 4)
                                ? 20
                                : (e.length <= 7)
                                    ? 8
                                    : 4,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: 16),

            // Locations Grid
            Expanded(
              child: GridView.builder(
                itemCount: locations.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  final location = locations[index];
                  return LocationCard(
                    location: location,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
