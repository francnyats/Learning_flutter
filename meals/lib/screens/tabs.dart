import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/main_drawer.dart';
import 'package:meals/providers/meals_provider.dart';

const kInitialFilters = {
  Filter.gluttenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favouriteMeals = [];
  Map<Filter, bool> _selectedFilters = {
    Filter.gluttenFree: false,
    Filter.lactoseFree: false,
    Filter.vegetarian: false,
    Filter.vegan: false,
  };

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _toggleMealFavouriteStatus(Meal meal) {
    final isExisting = _favouriteMeals.contains(meal);

    if (isExisting) {
      setState(() {
        _favouriteMeals.remove(meal);
      });

      _showInfoMessage('Meal is no longer a favourite.');
    } else {
      setState(() {
        _favouriteMeals.add(meal);
        _showInfoMessage('Marked as a favourite!');
      });
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();

    if (identifier == 'filters') {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => FiltersScreen(
            currentFilters: _selectedFilters,
          ),
        ),
      );
      setState(() {
        _selectedFilters = result ?? kInitialFilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);

    final availableMeals = meals.where((meal) {
      if (_selectedFilters[Filter.gluttenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    Widget activePage = CategoriesScreen(
      onToggleFavourite: _toggleMealFavouriteStatus,
      availableMeals: availableMeals,
    );
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: _favouriteMeals,
        onToggleFavourite: _toggleMealFavouriteStatus,
      );
      activePageTitle = 'Your Favourites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites'),
        ],
      ),
    );
  }
}
