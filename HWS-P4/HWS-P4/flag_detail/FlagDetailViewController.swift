//
//  FlagDetailViewController.swift
//  HWS-P4
//
//  Created by Carlos Manzanas Navia on 3/11/20.
//  Copyright © 2020 foskon. All rights reserved.
//

import UIKit

class FlagDetailViewController: BaseViewController {
    @IBOutlet private var flagImageView: UIImageView!
    
    private var flag: String!
    
    static func instantiate(flag: String) -> FlagDetailViewController {
        let vc = UIStoryboard(name: "FlagDetailView", bundle: nil).instantiateViewController(identifier: "FlagDetailViewController") as FlagDetailViewController
        vc.flag = flag
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(onActionTouch))
        flagImageView.image = UIImage(named: flag)
    }
    
    @objc func onActionTouch() {
        guard let image = UIImage(named: flag) else { return }
        present(UIActivityViewController(activityItems: [image], applicationActivities: nil), animated: true)
    }
}
