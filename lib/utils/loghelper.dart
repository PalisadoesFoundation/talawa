import 'dart:io';

import 'package:flutter_logs/flutter_logs.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';

class LogHelper {
  init() async {
    await FlutterLogs.initLogs(
      logLevelsEnabled: [
        LogLevel.INFO,
        LogLevel.WARNING,
        LogLevel.ERROR,
        LogLevel.SEVERE
      ],
      timeStampFormat: TimeStampFormat.TIME_FORMAT_READABLE,
      directoryStructure: DirectoryStructure.FOR_DATE,
      logTypesEnabled: ["device", "network", "errors"],
      logFileExtension: LogFileExtension.CSV,
      logsWriteDirectoryName: "MyLogs",
      logsExportDirectoryName: "MyLogs/Exported",
      debugFileOperations: true,
      isDebuggable: true,
      attachTimeStamp: true,
      autoClearLogs: true,
      autoDeleteZipOnExport: true,
      zipsRetentionPeriodInDays: 30,
      logSystemCrashes: true,
    );
    FlutterLogs.channel.setMethodCallHandler((call) async {
      if (call.method == 'logsExported') {
        final zipName = call.arguments.toString();
        Directory externalDirectory;

        if (Platform.isIOS) {
          externalDirectory = await getApplicationDocumentsDirectory();
        } else {
          externalDirectory = await getExternalStorageDirectory();
        }

        final File file = File("${externalDirectory.path}/$zipName");

        if (file.existsSync()) {
          // TODO: Make a api call to sever
          // var responseCode = await ApiFunctions().sendLogs(file.path);
          // if(responseCode == 200){

          // }
          Fluttertoast.showToast(
            msg: "The Logs are saved in ${file.path}",
            toastLength: Toast.LENGTH_LONG,
          );
        } else {
          FlutterLogs.logError(
              "LogHelper", "init(logsExported)", "File not found in storage.");
        }
      }
    });
  }

  log(LogLevel logLevel, String tag, String subTag, String logMessage,
      {Error error, Exception exception}) {
    switch (logLevel) {
      case LogLevel.INFO:
        if (error != null) {
          FlutterLogs.logErrorTrace(tag, subTag, logMessage, error);
        } else if (exception != null) {
          FlutterLogs.logThis(
              tag: tag,
              subTag: subTag,
              logMessage: logMessage,
              exception: exception,
              level: LogLevel.ERROR);
        } else {
          FlutterLogs.logInfo(tag, subTag, logMessage);
        }
        break;
      case LogLevel.WARNING:
        if (error != null) {
          FlutterLogs.logErrorTrace(tag, subTag, logMessage, error);
        } else if (exception != null) {
          FlutterLogs.logThis(
              tag: tag,
              subTag: subTag,
              logMessage: logMessage,
              exception: exception,
              level: LogLevel.ERROR);
        } else {
          FlutterLogs.logWarn(tag, subTag, logMessage);
        }
        break;
      case LogLevel.ERROR:
        if (error?.stackTrace != null) {
          FlutterLogs.logErrorTrace(tag, subTag, logMessage, error);
        } else if (exception != null) {
          FlutterLogs.logThis(
              tag: tag,
              subTag: subTag,
              logMessage: logMessage,
              exception: exception,
              level: LogLevel.ERROR);
        } else {
          FlutterLogs.logError(tag, subTag, logMessage);
        }
        break;
      case LogLevel.SEVERE:
        if (error?.stackTrace != null) {
          FlutterLogs.logErrorTrace(tag, subTag, logMessage, error);
        } else if (exception != null) {
          FlutterLogs.logThis(
              tag: tag,
              subTag: subTag,
              logMessage: logMessage,
              exception: exception,
              level: LogLevel.ERROR);
        } else {
          FlutterLogs.logError(tag, subTag, logMessage);
        }
        break;
    }
  }

  exportLogs() {
    FlutterLogs.exportLogs(exportType: ExportType.WEEKS);
  }
}
