TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder. 

```dart
final _logger = Logger();

void Function(String, {dynamic error, StackTrace? stackTrace}) debudlog = (
  String message, {
  dynamic error,
  StackTrace? stackTrace,
}) =>
    _logger.log(
      message,
      error: error,
      stackTrace: stackTrace,
      level: Level.debug,
    );
```

see [example](./example/blocship_logger_example.dart) 

## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.
