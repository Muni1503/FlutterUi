import 'package:flutter/material.dart';



class StockOrderCard extends StatelessWidget {
   StockOrderCard({Key? key}) : super(key: key);

  final List<Map<String, String>> stockInfo = [
    {'label': 'Stock Name', 'value': 'AAPL'},
    {'label': 'Segment', 'value': 'Technology'},
    {'label': 'ISIN', 'value': 'US0378331005'},
    {'label': 'Price', 'value': '\$150.25'},
    {'label': 'Quantity', 'value': '100'},
    {'label': 'Total Price', 'value': '\$15,025.00'},
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Card(
          elevation: 4,
          margin: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue.shade50, Colors.black.withOpacity(0.1)],
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      itemCount: stockInfo.length,
                      itemBuilder: (context, index) {
                        return _buildInfoRow(stockInfo[index]['label']!, stockInfo[index]['value']!);
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    alignment: WrapAlignment.spaceBetween,
                    children: [
                      _buildStatusButton('Order Placed', Icons.check_circle, Colors.blue),
                      _buildStatusButton('Admin Status', Icons.hourglass_empty, Colors.blue.shade700),
                      _buildStatusButton('BOA Status', Icons.pending, Colors.blue.shade900),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          Text(
            value,
            style: const TextStyle(color: Colors.blue),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusButton(String label, IconData icon, Color color) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: Colors.white),
      label: Text(label),
      style: ElevatedButton.styleFrom(
      
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      )
    );
  }
}
