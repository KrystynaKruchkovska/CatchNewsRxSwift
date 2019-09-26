//
//  AppFlowCoordinator.swift
//  CatchNewsRxSwift
//
//  Created by Krystyna Kruchkovska on 9/26/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import UIKit

class Coordinator {
    var rootViewController: UIViewController = UIViewController()
    var nextFlowCoordinator: Coordinator?

}

class AppFlowCoordinator: Coordinator {
    var window: UIWindow!

    init(window:UIWindow) {
        self.window = window
    }

    func initializeApp() {
        let navigationController = UINavigationController()
        rootViewController = navigationController
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        runBaseController()
    }

    private func runBaseController() {

        let vc = BaseViewController()
        rootViewController.show(vc, sender: nil)

    }
}
