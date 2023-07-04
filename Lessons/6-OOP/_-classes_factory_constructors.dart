// Factory Constructor

//   - can be either:

//       -  a unnamed constructor (Generator Constructor)
//       -  a named constructor (Identifier Constructor)

// Factory Named Constructor (Identifier Constructor)

//   - ALL named constructors MUST return an instance of their type
//   - factory named constructors have access to the constructor body
//     allowing logic that can't be handled in an initalizer list

// Unnamed Factory Constructors

//   - a generative constructor which
//     does not have to return an instance of its type

// Generative Constructor Redirection:

//   - can not redirect to a factory constructor using an initalizer list
//   - Logger._internal(String name) : this(name);

// Signature for LoggerCallback

typedef LoggerCallback = Logger Function();

class Logger {
  final String name;

  bool mute = false;

  static final _cache = <String, Logger>{};

  static Map<String, Logger> get cache => _cache;

  // Factory Named Constructor (Identifier Constructor)

  factory Logger.fromJSON(Map<String, String> json) {
    final String result = json['name'].toString();
    return Logger(result);
  }

  // Factory Unnamed Constructor (Generator Constructor)

  factory Logger(String name) {
    final LoggerCallback handleLogger = () => Logger._internal(name);

    return _cache.putIfAbsent(
      name,
      handleLogger,
    );
  }

  // Default Named Constructor
  Logger._internal(this.name);

  void log(String msg) => !mute ? print(msg) : null;

  @override
  String toString() => 'Logger(name: $name)';
}

// Simulate fetching data from an API (Application Programming Interface)

Future<Map<String, String>> useFetchLoggerApi() async {
  await Future.delayed(
    Duration(seconds: 1, milliseconds: 200),
  );

  return {'name': 'U.I.'};
}

Future<void> main() async {
  final Logger logger = Logger('U.I.');

  final Map<String, String> jsonData = await useFetchLoggerApi();

  final Logger loggerJson = Logger.fromJSON(jsonData);

  print('\nAPI Data result: $jsonData\n');

  logger.log('Logger.log: button clicked\n');

  print('Logger class variable: ${Logger.cache}\n');

  print('loggerJson name: ${loggerJson.name}\n');
}
