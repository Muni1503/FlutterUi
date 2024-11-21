import 'package:flutter/material.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Menu'),
        backgroundColor: Colors.blue[700],
      ),
      drawer: MainDrawer(),
      body: const Center(
        child: Text('Welcome to the Main Menu!'),
      ),
    );
  }
}

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Drawer(
      child: Container(
        color: Colors.grey[100],
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue[700],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: screenHeight * 0.05,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: screenHeight * 0.05,
                      color: Colors.blue[700],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    'John Doe',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenHeight * 0.025,
                    ),
                  ),
                ],
              ),
            ),
            _buildListTile(
              context,
              icon: Icons.dashboard,
              title: 'Dashboard',
              onTap: () {
                // Navigate to Dashboard
                Navigator.pop(context);
              },
            ),
            _buildListTile(
              context,
              icon: Icons.person,
              title: 'Profile',
              onTap: () {
                // Navigate to Profile
                Navigator.pop(context);
              },
            ),
            _buildListTile(
              context,
              icon: Icons.show_chart,
              title: 'Execute Trade',
              onTap: () {
                // Navigate to Execute Trade
                Navigator.pop(context);
              },
            ),
            _buildListTile(
              context,
              icon: Icons.history,
              title: 'Trade History',
              onTap: () {
                // Navigate to Trade History
                Navigator.pop(context);
              },
            ),
            _buildListTile(
              context,
              icon: Icons.receipt,
              title: 'Billing',
              onTap: () {
                // Navigate to Billing
                Navigator.pop(context);
              },
            ),
            Divider(
              color: Colors.grey[400],
              thickness: 1,
            ),
            _buildListTile(
              context,
              icon: Icons.exit_to_app,
              title: 'Logout',
              onTap: () {
                // Perform logout action
                Navigator.pop(context);
              },
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? color,
  }) {
    final screenHeight = MediaQuery.of(context).size.height;

    return ListTile(
      leading: Icon(
        icon,
        color: color ?? Colors.blue[700],
        size: screenHeight * 0.03,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: color ?? Colors.black,
          fontSize: screenHeight * 0.02,
        ),
      ),
      onTap: onTap,
      hoverColor: Colors.blue[100],
    );
  }
}
