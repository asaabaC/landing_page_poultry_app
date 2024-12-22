import 'package:flutter/material.dart';

void main() {
  runApp(const PoultryApp());
}

class PoultryApp extends StatelessWidget {
  const PoultryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        appBarTheme: const AppBarTheme(
          color: Colors.orange,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        cardTheme: CardTheme(
          color: Colors.orange.shade100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.orange),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Poultry App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              // Navigate to the Sign-In Screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignInScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Banner Image with smaller width and height
          Center(
            child: Container(
              width: 100, // Much smaller width
              height: 100, // Much smaller height
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/chicken-farm-banner-with-white-chicken-cartoon-character_1308-90659.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Encouraging Message Below the Logo
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: const Text(
              "Welcome to Poultry App! 🐔\nWe are committed to providing you with the best poultry products and services, ensuring your success and growth in the poultry industry. Let's grow together!",
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                height: 1.5,
              ),
            ),
          ),
          // Grid of Services
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(14.0),
              crossAxisSpacing: 14.0,
              mainAxisSpacing: 14.0,
              children: [
                ServiceIcon(
                  icon: Icons.shopping_bag,
                  label: 'Products',
                  onTap: () {
                    // Navigate to Product Page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProductPage()),
                    );
                  },
                ),
                ServiceIcon(
                  icon: Icons.list_alt,
                  label: 'Orders',
                  onTap: () {
                    // Navigate to Order Display
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OrderDisplay()),
                    );
                  },
                ),
                ServiceIcon(
                  icon: Icons.payment,
                  label: 'Payments',
                  onTap: () {
                    // Navigate to Payment Screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PaymentScreen()),
                    );
                  },
                ),
                ServiceIcon(
                  icon: Icons.settings,
                  label: 'Management',
                  onTap: () {
                    // Navigate to Poultry Management Screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PoultryManagement()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ServiceIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const ServiceIcon({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Set background color for the icon container
          borderRadius: BorderRadius.circular(8.0), // Round the corners
          boxShadow: const [
            BoxShadow(
              color: Colors.black26, // Shadow color
              blurRadius: 6.0, // Shadow blur
              offset: Offset(2, 2), // Shadow direction
            ),
          ],
        ),
        child: Card(
          elevation: 0.0, // Remove elevation to keep the shadow effect behind
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon,
                  size: 40.0, color: Colors.orange), // Adjust icon size
              const SizedBox(height: 8.0), // Spacing between icon and label
              Text(label,
                  style: const TextStyle(fontSize: 14.0)), // Smaller text size
            ],
          ),
        ),
      ),
    );
  }
}

// Placeholder screens for navigation
class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Product Page')));
  }
}

class OrderDisplay extends StatelessWidget {
  const OrderDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Order Display')));
  }
}

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Payment Screen')));
  }
}

class PoultryManagement extends StatelessWidget {
  const PoultryManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Poultry Management')));
  }
}

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Sign In')));
  }
}
