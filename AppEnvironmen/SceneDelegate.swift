//
//  SceneDelegate.swift
//  AppEnvironmen
//
//  Created by Claudio Tendean on 16/05/23.
//

import Foundation
import UIKit
import SwiftUI


func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    // Membuat instance AuthUser
    let authUser = AuthUser()

    // Membuat SwiftUI view
    let contentView = ContentView()
    
    // Menggunakan contentView sebagai tampilan utama
    if let windowScene = scene as? UIWindowScene {
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UIHostingController(rootView: contentView.environmentObject(authUser))
        window.makeKeyAndVisible()
    }
}
