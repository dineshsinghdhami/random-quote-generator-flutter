import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const QuoteApp());
}

class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Random Quote Generator',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const QuoteHomePage(),
    );
  }
}

class QuoteHomePage extends StatefulWidget {
  const QuoteHomePage({super.key});

  @override
  State<QuoteHomePage> createState() => _QuoteHomePageState();
}

class _QuoteHomePageState extends State<QuoteHomePage> {
  final Random random = Random();

  final List<Map<String, String>> quotes = [
    {
      'quote': 'The best way to predict the future is to create it.',
      'author': 'Peter Drucker',
    },
    {
      'quote':
          'Success is not final, failure is not fatal: it is the courage to continue that counts.',
      'author': 'Winston Churchill',
    },
    {
      'quote': 'Believe you can and you are halfway there.',
      'author': 'Theodore Roosevelt',
    },
    {
      'quote': 'Do what you can, with what you have, where you are.',
      'author': 'Theodore Roosevelt',
    },
    {
      'quote': 'The only way to do great work is to love what you do.',
      'author': 'Steve Jobs',
    },
    {
      'quote': 'It always seems impossible until it is done.',
      'author': 'Nelson Mandela',
    },
    {
      'quote': 'Dream big and dare to fail.',
      'author': 'Norman Vaughan',
    },
    {
      'quote': 'Happiness depends upon ourselves.',
      'author': 'Aristotle',
    },
  ];

  late int currentQuoteIndex;

  @override
  void initState() {
    super.initState();
    currentQuoteIndex = random.nextInt(quotes.length);
  }

  void generateNewQuote() {
    int newIndex;

    do {
      newIndex = random.nextInt(quotes.length);
    } while (newIndex == currentQuoteIndex);

    setState(() {
      currentQuoteIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuote = quotes[currentQuoteIndex];

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFF8F6FF),
              Color(0xFFEEE9FF),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 20,
            ),
            child: Column(
              children: [
                const SizedBox(height: 16),

                // App title
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.auto_awesome_rounded,
                      color: Color(0xFF6C4DF6),
                      size: 28,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Quote of the Moment',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF27233A),
                      ),
                    ),
                  ],
                ),

                const Spacer(),

                // Quote card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 36,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(28),
                    border: Border.all(
                      color: const Color(0xFFECE7FF),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.07),
                        blurRadius: 30,
                        offset: const Offset(0, 12),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 66,
                        height: 66,
                        decoration: const BoxDecoration(
                          color: Color(0xFFF0ECFF),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.format_quote_rounded,
                          color: Color(0xFF6C4DF6),
                          size: 38,
                        ),
                      ),

                      const SizedBox(height: 28),

                      // Quote animation
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 400),
                        transitionBuilder: (child, animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: ScaleTransition(
                              scale: Tween<double>(
                                begin: 0.96,
                                end: 1.0,
                              ).animate(animation),
                              child: child,
                            ),
                          );
                        },
                        child: Text(
                          '"${currentQuote['quote']}"',
                          key: ValueKey(currentQuoteIndex),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 24,
                            height: 1.5,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF27233A),
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Small divider
                      Container(
                        width: 42,
                        height: 3,
                        decoration: BoxDecoration(
                          color: const Color(0xFF6C4DF6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),

                      const SizedBox(height: 18),

                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 400),
                        child: Text(
                          '— ${currentQuote['author']}',
                          key: ValueKey(
                            '${currentQuoteIndex}_author',
                          ),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic,
                            color: Color(0xFF777184),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                // New quote button
                SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: ElevatedButton.icon(
                    onPressed: generateNewQuote,
                    icon: const Icon(
                      Icons.shuffle_rounded,
                      size: 23,
                    ),
                    label: const Text(
                      'New Quote',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6C4DF6),
                      foregroundColor: Colors.white,
                      elevation: 3,
                      shadowColor:
                          const Color(0xFF6C4DF6).withOpacity(0.35),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                const Text(
                  'Tap the button for a little inspiration ✨',
                  style: TextStyle(
                    color: Color(0xFF8D8797),
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
