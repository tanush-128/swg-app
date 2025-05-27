import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swg_flutter/models/Notice.dart';
// import 'notice.dart'; // Assuming your Notice class is in this file

class AddNoticePage extends StatefulWidget {
  const AddNoticePage({super.key});

  @override
  _AddNoticePageState createState() => _AddNoticePageState();
}

class _AddNoticePageState extends State<AddNoticePage> {
  final _formKey = GlobalKey<FormState>();
  String heading = '';
  String description = '';
  DateTime? eventTime;
  String location = '';
  String host = '';
  String? imageUrl;
  String targetAudience = 'All KGP Junta';
  bool published = false;
  String contactName = '';
  String contactNumber = '';
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;
  final List<String> targetAudiences = [
    'All KGP Junta',
    'Freshers',
    'Sophomores',
    'Pre-Final Years',
    'Final Years'
  ];

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = image;
    });
  }

  Future<void> _submitForm() async {
    if (eventTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select event date and time'),
        ),
      );
      return;
    }

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final newNotice = Notice(
        heading: heading,
        description: description,
        eventTime: eventTime ?? DateTime.now(),
        location: location,
        host: host,
        imageUrl: _imageFile?.path,
        targetAudience: targetAudience,
        published: published,
        contactName: contactName,
        contactNumber: contactNumber,
      );
      await Notice.createNotice(newNotice);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Request submitted successfully'),
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Notice'),
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: <Widget>[
            // Section 1: Event Details
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: Text(
                "Event Details",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),

            // Form fields with consistent styling
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Event Title',
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              onSaved: (value) => heading = value!,
              validator: (value) =>
                  value!.isEmpty ? 'Please enter an event title' : null,
            ),
            const SizedBox(height: 16),

            TextFormField(
              decoration: InputDecoration(
                labelText: 'Description',
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              maxLines: 5,
              onSaved: (value) => description = value!,
            ),
            const SizedBox(height: 16),

            TextFormField(
              decoration: const InputDecoration(labelText: 'Location *'),
              onSaved: (value) => location = value!,
              validator: (value) =>
                  value!.isEmpty ? 'Please enter a location' : null,
            ),
            const SizedBox(height: 16),

            TextFormField(
              decoration: const InputDecoration(labelText: 'Host *'),
              onSaved: (value) => host = value!,
              validator: (value) =>
                  value!.isEmpty ? 'Please enter the host' : null,
            ),
            const SizedBox(height: 16),

            ListTile(
              title: const Text("Event Date and Time *"),
              subtitle: Text(eventTime?.toString() ?? 'No date chosen'),
              onTap: () async {
                final chosenDate = await showDatePicker(
                  context: context,
                  initialDate: eventTime ?? DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );
                if (chosenDate != null) {
                  final chosenTime = await showTimePicker(
                      context: context,
                      initialTime:
                          TimeOfDay.fromDateTime(eventTime ?? DateTime.now()));
                  setState(() {
                    eventTime = DateTime(
                        chosenDate.year,
                        chosenDate.month,
                        chosenDate.day,
                        chosenTime?.hour ?? 0,
                        chosenTime?.minute ?? 0);
                  });
                }
              },
            ),
            const SizedBox(height: 16),

            DropdownButtonFormField(
              value: targetAudience,
              decoration: const InputDecoration(labelText: 'Target Audience'),
              items: targetAudiences.map((String audience) {
                return DropdownMenuItem(
                  value: audience,
                  child: Text(audience),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  targetAudience = newValue!;
                });
              },
            ),
            const SizedBox(height: 16),

            // Image Upload Section
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Event Poster",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  InkWell(
                    onTap: _pickImage,
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: _imageFile != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(
                                File(_imageFile!.path),
                                fit: BoxFit.cover,
                              ),
                            )
                          : Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.add_photo_alternate_outlined,
                                      size: 40),
                                  SizedBox(height: 8),
                                  Text("Tap to add poster"),
                                ],
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),

            // Contact Details Section
            Container(
              margin: const EdgeInsets.only(top: 16, bottom: 8),
              child: Text(
                "Contact Details",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Text(
              "For SWG team to contact you if needed",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600],
                  ),
            ),
            const SizedBox(height: 16),

            TextFormField(
              decoration: InputDecoration(
                labelText: 'Name *',
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              onSaved: (value) => contactName = value!,
              validator: (value) =>
                  value!.isEmpty ? 'Please enter your name' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Phone Number *',
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              onSaved: (value) => contactNumber = value!,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your phone number';
                }
                // Optional: Add phone number format validation
                final phoneRegex =
                    RegExp(r'^\d{10}$'); // Validates 10-digit number
                if (!phoneRegex.hasMatch(value)) {
                  return 'Please enter a valid 10-digit phone number';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),

            // Submit Button
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Submit Notice',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
