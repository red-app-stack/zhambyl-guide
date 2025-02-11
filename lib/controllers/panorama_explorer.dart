import 'package:flutter/material.dart';
import 'package:panorama_viewer/panorama_viewer.dart';

class PanoramaExplorer extends StatefulWidget {
  const PanoramaExplorer({super.key});

  @override
  PanoramaExplorerState createState() => PanoramaExplorerState();
}

class PanoramaExplorerState extends State<PanoramaExplorer> {
  final GlobalKey<PanoramaState> _panoramaKey = GlobalKey();
  // double _latitude = 0;
  // double _longitude = 0;
  double _zoom = 1.0;
  int _currentPanoIndex = 0;

  final List<String> panoImages = [
    'assets/photos/panorama1.jpg',
    'assets/photos/panorama2.jpg',
    'assets/photos/panorama3.jpg',
  ];

  void _zoomIn() {
    setState(() {
      _zoom = (_zoom + 0.5).clamp(1.0, 5.0);
    });
    _panoramaKey.currentState?.setZoom(_zoom);
  }

  void _zoomOut() {
    setState(() {
      _zoom = (_zoom - 0.5).clamp(1.0, 5.0);
    });
    _panoramaKey.currentState?.setZoom(_zoom);
  }

  void _navigateTo(int index) {
    setState(() {
      _currentPanoIndex = index;
    });
  }

  List<Hotspot> _buildHotspots(ThemeData theme) {
    if (_currentPanoIndex == 0) {
      return [
        Hotspot(
          latitude: 0.0,
          longitude: 50.0,
          width: 90,
          height: 110,
          widget: _hotspotButton(theme, "Вперед", Icons.arrow_forward, () => _navigateTo(1)),
        ),
      ];
    } else if (_currentPanoIndex == 1) {
      return [
        Hotspot(
          latitude: 0.0,
          longitude: 155.0,
          width: 90,
          height: 80,
          widget: _hotspotButton(theme, "Назад", Icons.arrow_back, () => _navigateTo(0)),
        ),
        Hotspot(
          latitude: -10.0,
          longitude: 60.0,
          width: 90,
          height: 80,
          widget: _hotspotButton(theme, "Вперед", Icons.arrow_forward, () => _navigateTo(2)),
        ),
      ];
    } else if (_currentPanoIndex == 2) {
      return [
        Hotspot(
          latitude: 0.0,
          longitude: 80.0,
          width: 90,
          height: 80,
          widget: _hotspotButton(theme, "Назад", Icons.arrow_back, () => _navigateTo(1)),
        ),
      ];
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: [
          PanoramaViewer(
            key: _panoramaKey,
            sensorControl: SensorControl.orientation,
            animSpeed: 0.1,
            onViewChanged: (lon, lat, tilt) {
              setState(() {
                // _longitude = lon;
                // _latitude = lat;
              });
            },
            hotspots: _buildHotspots(theme),
            child: Image.asset(panoImages[_currentPanoIndex]),
          ),
          Positioned(
            bottom: 50,
            right: 10,
            child: Column(
              children: [
                FloatingActionButton(
                  heroTag: "zoomInBtn",
                  onPressed: _zoomIn,
                  tooltip: 'Увеличить',
                  child: const Icon(Icons.zoom_in),
                ),
                const SizedBox(height: 10),
                FloatingActionButton(
                  heroTag: "zoomOutBtn",
                  onPressed: _zoomOut,
                  tooltip: 'Уменьшить',
                  child: const Icon(Icons.zoom_out),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _hotspotButton(ThemeData theme, String text, IconData icon, VoidCallback onPressed) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          style: ButtonStyle(
            shape: WidgetStateProperty.all(const CircleBorder()),
            backgroundColor: WidgetStateProperty.all(Colors.black38),
            foregroundColor: WidgetStateProperty.all(Colors.white),
          ),
          onPressed: onPressed,
          child: Icon(icon, color: theme.colorScheme.onSurface),
        ),
        Container(
          padding: const EdgeInsets.all(4.0),
          decoration: const BoxDecoration(color: Colors.black38, borderRadius: BorderRadius.all(Radius.circular(4))),
          child: Center(child: Text(text, style: const TextStyle(color: Colors.white))),
        ),
      ],
    );
  }
}
