import 'package:flutter/material.dart';



class ProfileManagementScreen extends StatefulWidget {
  const ProfileManagementScreen({Key? key}) : super(key: key);

  @override
  _ProfileManagementScreenState createState() => _ProfileManagementScreenState();
}

class _ProfileManagementScreenState extends State<ProfileManagementScreen> {
  bool _isEditing = false;
  final _formKey = GlobalKey<FormState>();

  // Sample data - replace with actual user data
  String firstName = 'John';
  String lastName = 'Doe';
  String email = 'john.doe@example.com';
  String phoneNumber = '+1234567890';
  String panCardNumber = 'ABCDE1234F';
  String kycStatus = 'Verified';
  String nomineeName = 'Jane Doe';
  String bankName = 'Sample Bank';
  String branchName = 'Main Branch';
  String ifscCode = 'SBIN0123456';
  String bankAccountNumber = '1234567890';

  List<String> bankNames = ['Sample Bank', 'Another Bank', 'Third Bank'];
  List<String> branchNames = ['Main Branch', 'Downtown Branch', 'Uptown Branch'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle('Profile Overview', Icons.person),
                _buildReadOnlyField('First Name', firstName, Icons.person_outline),
                _buildReadOnlyField('Last Name', lastName, Icons.person_outline),
                _buildReadOnlyField('Email', email, Icons.email),
                _buildReadOnlyField('Phone Number', phoneNumber, Icons.phone),
                _buildReadOnlyField('PAN Card Number', panCardNumber, Icons.credit_card),
                _buildReadOnlyField('KYC Status', kycStatus, Icons.verified_user),
                const SizedBox(height: 20),
                _buildSectionTitle('Nominee Information', Icons.people),
                _buildEditableField('Nominee Name', nomineeName, Icons.person, (value) {
                  nomineeName = value!;
                }),
                const SizedBox(height: 20),
                _buildSectionTitle('Bank Details', Icons.account_balance),
                _buildDropdownField('Bank Name', bankName, bankNames, Icons.account_balance, (value) {
                  bankName = value!;
                }),
                _buildDropdownField('Branch Name', branchName, branchNames, Icons.location_city, (value) {
                  branchName = value!;
                }),
                _buildReadOnlyField('IFSC Code', ifscCode, Icons.code),
                _buildEditableField('Bank Account Number', bankAccountNumber, Icons.account_balance_wallet, (value) {
                  bankAccountNumber = value!;
                }),
                const SizedBox(height: 20),
                _buildActionButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.purple),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
        ],
      ),
    );
  }

  Widget _buildReadOnlyField(String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(width: 8),
          Expanded(
            child: TextFormField(
              initialValue: value,
              readOnly: true,
              decoration: InputDecoration(
                labelText: label,
                border: const OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEditableField(String label, String value, IconData icon, Function(String?) onSaved) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(width: 8),
          Expanded(
            child: TextFormField(
              initialValue: value,
              enabled: _isEditing,
              decoration: InputDecoration(
                labelText: label,
                border: const OutlineInputBorder(),
              ),
              onSaved: onSaved,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownField(String label, String value, List<String> items, IconData icon, Function(String?) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(width: 8),
          Expanded(
            child: DropdownButtonFormField<String>(
              value: value,
              items: items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: _isEditing ? onChanged : null,
              decoration: InputDecoration(
                labelText: label,
                border: const OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
          icon: Icon(_isEditing ? Icons.cancel : Icons.edit),
          label: Text(_isEditing ? 'Cancel' : 'Edit'),
          onPressed: () {
            setState(() {
              _isEditing = !_isEditing;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: _isEditing ? Colors.red : Colors.blue,
          ),
        ),
        ElevatedButton.icon(
          icon: const Icon(Icons.save),
          label: const Text('Save'),
          onPressed: _isEditing
              ? () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    setState(() {
                      _isEditing = false;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Profile updated successfully')),
                    );
                  }
                }
              : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
          ),
        ),
      ],
    );
  }
}
