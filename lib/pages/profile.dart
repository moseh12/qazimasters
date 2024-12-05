import 'package:flutter/material.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  // Form controllers
  final TextEditingController _emailController =
      TextEditingController(text: "user@example.com");
  final TextEditingController _phoneController =
      TextEditingController(text: "+1234567890");
  final TextEditingController _locationController =
      TextEditingController(text: "New York, USA");
  final TextEditingController _specificationController =
      TextEditingController(text: "Software Engineer");
  final TextEditingController _aboutmeController =
      TextEditingController(text: "Software Engineer");

  bool _isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Profile"),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(_isEditing ? Icons.check : Icons.edit),
            onPressed: () {
              setState(() {
                _isEditing = !_isEditing;
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile_placeholder.png'),
            ),
            const SizedBox(height: 20),
            _buildTextField(
              label: "Email",
              controller: _emailController,
              enabled: _isEditing,
              icon: Icons.email,
            ),
            const SizedBox(height: 10),
            _buildTextField(
              label: "Phone Number",
              controller: _phoneController,
              enabled: _isEditing,
              icon: Icons.phone,
            ),
            const SizedBox(height: 10),
            _buildTextField(
              label: "Location",
              controller: _locationController,
              enabled: _isEditing,
              icon: Icons.location_on,
            ),
            const SizedBox(height: 10),
            _buildTextField(
              label: "Specification",
              controller: _specificationController,
              enabled: _isEditing,
              icon: Icons.work,
            ),
            _buildTextField(
              label: "About ME",
              controller: _aboutmeController,
              enabled: _isEditing,
              icon: Icons.info_rounded,
            ),
            const SizedBox(height: 20),
            if (_isEditing)
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Save the changes
                    setState(() {
                      _isEditing = false;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Profile updated successfully!"),
                      ),
                    );
                  },
                  child: const Text("Save Changes"),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required bool enabled,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,
      enabled: enabled,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: const OutlineInputBorder(),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
