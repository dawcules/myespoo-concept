import UIKit
import Flutter
import Firebase

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    FirebaseApp.configure()
    GeneratedPluginRegistrant.register(with: self)
    guard let controller = window?.rootViewController as? FlutterViewController else {
      fatalError("rootViewController is not type FlutterViewController")
    }
    let engine = controller.engine!
    let currentLocale = NSLocale.current
    if (currentLocale.languageCode != nil) {
      engine.localizationChannel?.invokeMethod("setLocale", arguments: [currentLocale.languageCode!, currentLocale.regionCode ?? "", currentLocale.scriptCode ?? "", currentLocale.variantCode ?? ""])
    }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
