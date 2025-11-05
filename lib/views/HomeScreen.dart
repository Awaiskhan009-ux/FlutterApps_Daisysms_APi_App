import 'package:flutter/material.dart';
import 'package:flutter_application_2/views/onboarding_screen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String generatedNumber = "";
  bool isLoading = false;
  final TextEditingController _controller = TextEditingController();

  Future<void> _generateNumber() async {
    setState(() {
      isLoading = true;
    });

    final String apiKey = "Yd5ur8xIMnvxMsPBTX6WO04uuyENMI";
    final String service = "ds";

    final url = Uri.parse(
        "https://daisysms.com/stubs/handler_api.php?api_key=$apiKey&action=getNumber&service=$service&max_price=5.0");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final body = response.body;
        if (body.startsWith("ACCESS_NUMBER")) {
          final parts = body.split(":");
          generatedNumber = parts.length >= 3 ? parts[2] : "Invalid response";
        } else {
          generatedNumber = "Error: $body";
        }
      } else {
        generatedNumber = "HTTP Error: ${response.statusCode}";
      }
    } catch (e) {
      generatedNumber = "Exception: $e";
    }

    _controller.text = generatedNumber;

    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Daisy Number Generator"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                
            
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  color: Colors.deepPurple,
                ),
                decoration: InputDecoration(
                  hintText: "Type here",
                  hintStyle: TextStyle(
                    color: Colors.deepPurple,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                 
                  
                ),
              ),
              SizedBox(height: 20,)
,              TextField(
                readOnly: true,
                controller: _controller,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  color: Colors.deepPurple,
                ),
                decoration: InputDecoration(
                  hintText: "Generated Number",
                  hintStyle: TextStyle(
                    color: Colors.deepPurple,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                 
                  
                ),
              ),
              const SizedBox(height: 40),
              // Stylish Button
              ElevatedButton(
                onPressed: isLoading ? null : _generateNumber,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 18),
                  backgroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: isLoading
                    ? const SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : const Text(
                        "Generate Number",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                      ),
              ),
              IconButton(
  icon: Icon(Icons.logout),
  onPressed: () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const OnboardingScreen()),
    );
  },
)
            ],
          ),
        ),
      ),
    );
  }
}
