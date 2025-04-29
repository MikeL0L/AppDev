import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class CampusMapScreen extends StatefulWidget {
  @override
  _CampusMapScreenState createState() => _CampusMapScreenState();
}

class _CampusMapScreenState extends State<CampusMapScreen> {
  String? selectedArea;
  final PhotoViewController _photoViewController = PhotoViewController();

  Map<String, List<String>> buildingData = {
    'College of Technology': ['Building 36', 'Building 45', 'Building 47'],
    'College of Science and Mathematics': ['Building 27', 'Building 28', 'Building 41'],
    'College of Information Technology and Computing': ['Building 3', 'Building 9', 'Building 10'],
    'College of Science and Technology Education': ['Building 14', 'Building 15', 'Building 16', 'Building 23', 'Building 24', 'Building 25'],
    'College of Engineering and Architecture': ['Building 4', 'Building 5', 'Building 18', 'Building 19', 'Building 20','Building 42', 'Building 43'],
  };

  // Buildings with floors and number of floors
  final Map<String, int> buildingsWithFloors = {
    'Building 45': 2,
    'Building 47': 3,
    'Building 23': 5,
    'Building 25': 2,
    'Building 27': 2,
    'Building 41': 5,
    'Building 9': 4,
    'Building 42': 6,
    'Building 43': 8,
  };

  // Buildings that have no rooms
  final Set<String> buildingsWithoutRooms = {
    'Building 36',
    'Building 14',
    'Building 15',
    'Building 16',
    'Building 26',
    'Building 3',
    'Building 10',
    'Building 20',
  };

  void _showBuildings(String collegeName) {
    setState(() {
      selectedArea = collegeName;
    });
  }

  void _showRooms(String buildingName) {
    if (buildingsWithoutRooms.contains(buildingName)) {
      // Show simple dialog with just building name
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(
            buildingName,
            style: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
          ),
          content: Text(
            'No rooms available for this building.',
            style: TextStyle(fontFamily: 'Montserrat'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Close', style: TextStyle(fontFamily: 'Montserrat')),
            ),
          ],
        ),
      );
    } else if (buildingsWithFloors.containsKey(buildingName)) {
      // Show tabbed dialog for buildings with floors
      final floorCount = buildingsWithFloors[buildingName]!;
      showDialog(
        context: context,
        builder: (_) => DefaultTabController(
          length: floorCount,
          child: AlertDialog(
            title: Text(
              buildingName,
              style: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
            ),
            content: SizedBox(
              width: double.maxFinite,
              height: 300,
              child: Column(
                children: [
                  TabBar(
                    isScrollable: true,
                    tabs: List.generate(floorCount, (index) {
                      return Tab(text: 'Floor ${index + 1}');
                    }),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: List.generate(floorCount, (floorIndex) {
                        return ListView(
                          children: List.generate(3, (roomIndex) {
                            int roomNumber = (floorIndex + 1) * 100 + roomIndex + 1;
                            return ListTile(
                              title: Text(
                                'Room $roomNumber',
                                style: TextStyle(fontFamily: 'Montserrat'),
                              ),
                            );
                          }),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Close', style: TextStyle(fontFamily: 'Montserrat')),
              ),
            ],
          ),
        ),
      );
    } else {
      // Show default rooms (Room 101, 102, 103)
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(
            buildingName,
            style: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Room 101', style: TextStyle(fontFamily: 'Montserrat')),
              Text('Room 102', style: TextStyle(fontFamily: 'Montserrat')),
              Text('Room 103', style: TextStyle(fontFamily: 'Montserrat')),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Close', style: TextStyle(fontFamily: 'Montserrat')),
            ),
          ],
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _photoViewController.scale = 1.3;
  }

  @override
  void dispose() {
    _photoViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Campus Map',
          style: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFFF971A),
                Color(0xFFFFFF67),
              ],
              transform: GradientRotation(24),
            ),
          ),
        ),
      ),
      body: selectedArea == null ? _buildMap() : _buildBuildingsList(),
    );
  }

  Widget _buildMap() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;

        return Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: PhotoView.customChild(
            backgroundDecoration: BoxDecoration(color: Colors.white),
            controller: _photoViewController,
            initialScale: PhotoViewComputedScale.contained * 1.3,
            minScale: PhotoViewComputedScale.contained * 0.8,
            maxScale: PhotoViewComputedScale.covered * 3.0,
            basePosition: Alignment.center,
            child: Stack(
              children: [
                Image.asset(
                  'assets/ustp-campus-map.png',
                  fit: BoxFit.contain,
                  width: double.infinity,
                  height: double.infinity,
                  alignment: Alignment.center,
                ),
                _mapButton(
                  left: width * 0.21,
                  top: height * 0.40,
                  color: Colors.orange,
                  collegeName: 'College of Technology',
                  number: 1,
                ),
                _mapButton(
                  left: width * 0.32,
                  top: height * 0.50,
                  color: Colors.green,
                  collegeName: 'College of Science and Mathematics',
                  number: 2,
                ),
                _mapButton(
                  left: width * 0.67,
                  top: height * 0.44,
                  color: Colors.black,
                  collegeName: 'College of Information Technology and Computing',
                  number: 3,
                ),
                _mapButton(
                  left: width * 0.53,
                  top: height * 0.46,
                  color: Colors.blue,
                  collegeName: 'College of Science and Technology Education',
                  number: 4,
                ),
                _mapButton(
                  left: width * 0.55,
                  top: height * 0.55,
                  color: Colors.red,
                  collegeName: 'College of Engineering and Architecture',
                  number: 5,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _mapButton({
    double? left,
    double? top,
    double? right,
    double? bottom,
    required Color color,
    required String collegeName,
    required int number,
  }) {
    return Positioned(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      child: GestureDetector(
        onTap: () => _showBuildings(collegeName),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.6),
                blurRadius: 6,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Center(
            child: Text(
              '$number',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBuildingsList() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 8),
          color: Colors.orange,
          child: SafeArea(
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    setState(() {
                      selectedArea = null;
                    });
                  },
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    selectedArea ?? '',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.all(16),
            children: buildingData[selectedArea]!.map((building) {
              return ListTile(
                title: Text(
                  building,
                  style: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () => _showRooms(building),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
