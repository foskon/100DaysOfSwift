//
//  BaseViewController.swift
//  HWS-P4
//
//  Created by Carlos Manzanas Navia on 3/11/20.
//  Copyright © 2020 foskon. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        viewControllerToPresent.modalPresentationStyle = .fullScreen
        super.present(viewControllerToPresent, animated: true, completion: completion)
    }
}

