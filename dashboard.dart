import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Colors.blue[700],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfileSection(context, screenHeight),
              SizedBox(height: screenHeight * 0.03),
              _buildTradeSection(context, screenHeight),
              SizedBox(height: screenHeight * 0.03),
              _buildRecentTradesSection(context, screenHeight),
              SizedBox(height: screenHeight * 0.03),
              _buildAlertsSection(context, screenHeight),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileSection(BuildContext context, double screenHeight) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'John Doe',
              style: TextStyle(fontSize: screenHeight * 0.03, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: screenHeight * 0.01),
            Text('john.doe@example.com', style: TextStyle(fontSize: screenHeight * 0.02)),
            SizedBox(height: screenHeight * 0.01),
            Row(
              children: [
                Text('KYC Status: ', style: TextStyle(fontSize: screenHeight * 0.02)),
                Chip(
                  label: Text('Verified'),
                  backgroundColor: Colors.green[100],
                  labelStyle: TextStyle(color: Colors.green[800]),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            ElevatedButton(
              onPressed: () {
                // Navigate to Profile Management Screen
              },
              child: Text('Manage Profile'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[700]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTradeSection(BuildContext context, double screenHeight) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Execute Trade',
              style: TextStyle(fontSize: screenHeight * 0.025, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: screenHeight * 0.02),
            ElevatedButton(
             
              onPressed: () {
                // Navigate to Trade Execution Screen
              },
              child: Text('Execute Trade'),
              style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 93, 80, 114),textStyle:TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentTradesSection(BuildContext context, double screenHeight) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recent Trades',
              style: TextStyle(fontSize: screenHeight * 0.025, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: screenHeight * 0.02),
            _buildTradeItem('AAPL', 'Buy', '100', '2023-05-20'),
            _buildTradeItem('GOOGL', 'Sell', '50', '2023-05-19'),
            _buildTradeItem('MSFT', 'Buy', '75', '2023-05-18'),
            SizedBox(height: screenHeight * 0.02),
            ElevatedButton(
              onPressed: () {
                // Navigate to Trade History Screen
              },
              child: Text('View More'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[700]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTradeItem(String stockName, String tradeType, String quantity, String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(stockName, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(tradeType, style: TextStyle(color: tradeType == 'Buy' ? Colors.green : Colors.red)),
          Text(quantity),
          Text(date),
        ],
      ),
    );
  }

  Widget _buildAlertsSection(BuildContext context, double screenHeight) {
    return Card(
      elevation: 4,
      color: Colors.yellow[100],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Alerts',
              style: TextStyle(fontSize: screenHeight * 0.025, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: screenHeight * 0.02),
            Text('New bills are ready for review and download.'),
            SizedBox(height: screenHeight * 0.02),
            ElevatedButton(
              onPressed: () {
                // Navigate to Billing Information Screen
              },
              child: Text('View Billing'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            ),
          ],
        ),
      ),
    );
  }
}
