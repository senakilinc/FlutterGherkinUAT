import 'dart:async';
import 'dart:io';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';

import 'steps/counter_button_steps.dart';

Future<void> main() {
  final config = FlutterTestConfiguration()
    ..features = [Glob(r"test_driver/features/**.feature")]
    ..reporters = [
      ProgressReporter(),
      TestRunSummaryReporter(),
      JsonReporter(path: './report.json')
    ] 
    ..hooks = []
    ..stepDefinitions = [
      UserIsInDashboardStep(),
      CounterValueStep(),
      UserTapsIncrementButton()
    ]
    ..customStepParameterDefinitions = [

    ]
    //..logFlutterProcessOutput = true 
    //..verboseFlutterProcessLogs = true 
    ..restartAppBetweenScenarios = true
    //..targetAppWorkingDirectory = '../'
    ..targetAppPath = "test_driver/app.dart"
    ..targetDeviceId = 'macos'
    //..runningAppProtocolEndpointUri = 'http://localhost:50392/#/'
    //'ws://127.0.0.1:49898/U2WgzMRMI2w=/ws'
    ..keepAppRunningAfterTests = false; 
  return GherkinRunner().execute(config);
}