//
//  ViewController.swift
//  ToDoList
//
//  Created by Василий Буланов on 19.05.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buildLabel: UILabel!
    private let version = (Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String) ?? ""
    override func viewDidLoad() {
        super.viewDidLoad()
        buildLabel.text = String(localized: "welcome_screen_title") + " " + version
    }

}
