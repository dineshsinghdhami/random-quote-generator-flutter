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
      backgroundColor: const Color(0xFFF7F5FF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 20,
          ),
          child: Column(
            children: [
              const SizedBox(height: 20),

              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.auto_awesome,
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

              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 36,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 30,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      decoration: const BoxDecoration(
                        color: Color(0xFFF0ECFF),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.format_quote_rounded,
                        color: Color(0xFF6C4DF6),
                        size: 36,
                      ),
                    ),

                    const SizedBox(height: 28),

                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 350),
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

                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 350),
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

              SizedBox(
                width: double.infinity,
                height: 58,
                child: ElevatedButton.icon(
                  onPressed: generateNewQuote,
                  icon: const Icon(
                    Icons.refresh_rounded,
                    size: 24,
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
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              const Text(
                'Tap the button for inspiration',
                style: TextStyle(
                  color: Color(0xFF97919F),
                  fontSize: 14,
                ),
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}