import 'package:flutter/material.dart';
import '../models/cruise_destination.dart';
class CruiseBookingViewModel extends ChangeNotifier {

  final CruiseDestination _destination = CruiseDestination(
    title: 'Rajang River Express Cruise',
    location: 'Sibu Waterfront, Sarawak',
    description:
    'Experience the heart of Sibu along Malaysia\'s longest river, the Rajang. Cruise past historic temples, timber hubs, and waterfront settlements while experiencing authentic Sarawakian hospitality.',
    imageUrl: 'https://ik.imgkit.net/3vlqs5axxjf/TW-Asia/ik-seo/uploadedImages/Industry/Cruise/Borneo-River-Cruise-Beneath-Sibu-City-Skyline-261028/New-river-cruise-to-launch-in-Sarawak.jpg?tr=w-780%2Ch-440%2Cfo-auto',
    ratingCount: 43,
  );

  DateTime _selectedDate = DateTime(2026, 11, 15);
  String _selectedPackage = 'Express Boat';
  bool _isDarkMode = false;

  final List<String> _availablePackages = [
    'Express Boat',
    'Private River Cruise',
    'Sunset Cruise',
    'Sunrise Cruise',
    'Rural Cruise',
    'SMI Park Cruise',
  ];

  // Getters (Untuk dibaca oleh UI View)
  CruiseDestination get destination => _destination;
  DateTime get selectedDate => _selectedDate;
  String get selectedPackage => _selectedPackage;
  bool get isDarkMode => _isDarkMode;
  List<String> get availablePackages => _availablePackages;

  // Methods / Actions (Logik untuk mengubah state dan mengemas kini UI)

  // 1. Tukar Tarikh Lawatan (Visit Date Picker)
  void updateVisitDate(DateTime newDate) {
    _selectedDate = newDate;
    notifyListeners(); // Menyiratkan perubahan kepada UI
  }

  // 2. Tukar Pakej Pelayaran (Dropdown)
  void updatePackage(String? newPackage) {
    if (newPackage != null) {
      _selectedPackage = newPackage;
      notifyListeners();
    }
  }

  // 3. Tukar Mod Tema Terang/Gelap (Switch)
  void toggleTheme(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }

  // 4. Tambah Kiraan Bintang Dinamik apabila ikon bintang ditekan
  void incrementStarRating() {
    _destination.ratingCount++;
    notifyListeners();
  }
}