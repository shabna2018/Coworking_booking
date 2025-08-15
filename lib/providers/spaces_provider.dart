import 'package:flutter/foundation.dart';
import '../models/coworking_space.dart';
import '../core/services/api_service.dart';

class SpacesProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<CoworkingSpace> _spaces = [];
  List<CoworkingSpace> _filteredSpaces = [];
  bool _isLoading = false;
  String? _error;
  String _searchQuery = '';
  String? _selectedCity;
  double? _maxPrice;

  List<CoworkingSpace> get spaces => _filteredSpaces;
  bool get isLoading => _isLoading;
  String? get error => _error;
  String get searchQuery => _searchQuery;
  String? get selectedCity => _selectedCity;
  double? get maxPrice => _maxPrice;

  List<String> get cities => _apiService.getCities();

  Future<void> loadSpaces() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _spaces = await _apiService.getSpaces();
      _applyFilters();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void searchSpaces(String query) {
    _searchQuery = query;
    _applyFilters();
    notifyListeners();
  }

  void filterByCity(String? city) {
    _selectedCity = city;
    _applyFilters();
    notifyListeners();
  }

  void filterByPrice(double? price) {
    _maxPrice = price;
    _applyFilters();
    notifyListeners();
  }

  void clearFilters() {
    _searchQuery = '';
    _selectedCity = null;
    _maxPrice = null;
    _applyFilters();
    notifyListeners();
  }

  void _applyFilters() {
    _filteredSpaces = List.from(_spaces);

    if (_searchQuery.isNotEmpty) {
      _filteredSpaces = _filteredSpaces
          .where(
            (space) =>
                space.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
                space.city.toLowerCase().contains(_searchQuery.toLowerCase()) ||
                space.location.toLowerCase().contains(
                  _searchQuery.toLowerCase(),
                ),
          )
          .toList();
    }

    if (_selectedCity != null && _selectedCity!.isNotEmpty) {
      _filteredSpaces = _filteredSpaces
          .where(
            (space) => space.city.toLowerCase() == _selectedCity!.toLowerCase(),
          )
          .toList();
    }

    if (_maxPrice != null) {
      _filteredSpaces = _filteredSpaces
          .where((space) => space.pricePerHour <= _maxPrice!)
          .toList();
    }
  }

  Future<CoworkingSpace?> getSpaceById(String id) async {
    try {
      return await _apiService.getSpaceById(id);
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      return null;
    }
  }
}
