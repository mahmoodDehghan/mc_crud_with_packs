# flutter_app_template

A new Flutter project template with bdd initialization and integration(acceptance) test. 

## Getting Started

first check pubspec packages version and update them.
to check the bdd behavior run following commands in seprate terminals:

chromedriver --port=4444

flutter drive --driver=test_driver/integration_test_driver.dart --target=acceptance_test/gherkin_suite_test.dart -d chrome

after change in future and suite test with these cammand update generated class

flutter pub run build_runner clean

flutter pub run build_runner build --delete-conflicting-outputs

or use build with delete config flag or watch.

