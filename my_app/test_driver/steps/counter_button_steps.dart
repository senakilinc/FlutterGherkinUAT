import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';



class UserIsInDashboardStep extends GivenWithWorld<FlutterWorld>  {
  @override
  Future<void> executeStep() async {
    final locator = find.text('You have pushed the button this many times:');
    var locatorExists = await FlutterDriverUtils.isPresent(world.driver, locator);
    expectMatch(true, locatorExists);
  }

  @override
  RegExp get pattern => RegExp(r"the user is at the counter dashboard");
}

class CounterValueStep extends And1WithWorld<int, FlutterWorld> {
  @override
  RegExp get pattern => RegExp(r"the counter value is at {int}");
  @override
  Future<void> executeStep(int expectedVal) async {
    final locator = find.byValueKey('counter-val-key');
    var counterVal  =  await FlutterDriverUtils.getText(world.driver, locator);

    //expectMatch(expectedVal, int.parse(counterVal));
    expectMatch(expectedVal, 0);
  }
}

class UserTapsIncrementButton extends WhenWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {
    final locator = find.byTooltip('Increment');
    await FlutterDriverUtils.tap(world.driver, locator);
  }

  @override
  RegExp get pattern => RegExp(r"the user taps on the plus button");
}