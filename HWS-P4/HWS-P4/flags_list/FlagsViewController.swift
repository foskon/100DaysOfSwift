//
//  ViewController.swift
//  HWS-P4
//
//  Created by Carlos Manzanas Navia on 29/10/20.
//  Copyright © 2020 foskon. All rights reserved.
//

import UIKit

class FlagsViewController: BaseTableViewController {
    
    static func instantiate() -> FlagsViewController {
        UIStoryboard(name: "FlagsView", bundle: nil)
            .instantiateViewController(identifier: "FlagsViewController") as FlagsViewController 
    }
    
    private var flags = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        flags = loadFlags()
        tableView.register(UINib(nibName: "FlagCell", bundle: nil), forCellReuseIdentifier: "FlagCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        flags.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FlagCell", for: indexPath) as! FlagCell
        cell.setup(flags[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        180
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = FlagDetailViewController.instantiate(flag: flags[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}



private func loadFlags() -> [String] {
    let fm = FileManager.default
    guard let path = Bundle.main.resourcePath else {
        print("Error: Bundle.main.resourcePath error")
        return []
    }
    
    var items = [String]()
    do {
        items = try fm.contentsOfDirectory(atPath: path).filter { $0.hasPrefix("flag_") }
    } catch {
        print("Error: no flag_ file found")
    }
    return items
}
