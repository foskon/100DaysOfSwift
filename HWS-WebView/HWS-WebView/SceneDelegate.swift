//
//  SceneDelegate.swift
//  HWS-WebView
//
//  Created by Carlos Manzanas Navia on 3/11/20.
//  Copyright © 2020 foskon. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = getWindow(windowScene)
    }
}

private func getWindow(_ windowScene: UIWindowScene) -> UIWindow {
    let window = UIWindow(windowScene: windowScene)
    window.rootViewController = UINavigationController(rootViewController: WebViewController.instantiate())
    window.makeKeyAndVisible()
    return window
}
