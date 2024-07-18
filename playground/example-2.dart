void main() {
  // Example function that can throw an error
  int divide(int a, int b) {
    if (b == 0) {
      throw ArgumentError('Division by zero');
    }
    return a ~/ b; // Integer division
  }

  // Try to execute code that might throw an error
  try {
    int result = divide(10, 0);
    print('Result: $result');
  } catch (e) {
    // Catch the error and print an error message
    print('An error occurred: $e');
  } finally {
    // Code that will run regardless of an error occurring or not
    print('Division attempt completed.');
  }

  // Another example using Future and async/await for error handling
  fetchData() async {
    try {
      String data = await fetchFromServer();
      print('Data received: $data');
    } catch (e) {
      print('An error occurred while fetching data: $e');
    } finally {
      print('Fetch attempt completed.');
    }
  }

  // Call the async function
  fetchData();
}

// Simulated function to fetch data from a server
Future<String> fetchFromServer() async {
  // Simulate a network delay
  await Future.delayed(Duration(seconds: 2));
  // Simulate a server error
  throw Exception('Server error');
}
