//
//  AppDelegate.swift
//  recipes
//
//  Created by Inés Rojas on 6/08/23.
//

import Foundation
import UIKit
import GoogleMaps
//import GooglePlaces

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        let google_api_key = ProcessInfo.processInfo.environment["GMS_SERVICES_API_KEY"] ?? ""
        GMSServices.provideAPIKey(google_api_key)
        return true
    }
}
