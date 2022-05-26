//
//  AddToDoItemViewController.swift
//  ToDoList
//
//  Created by Василий Буланов on 26.05.2022.
//

import UIKit

class AddToDoItemViewController: UIViewController, UITextViewDelegate {

    // MARK: - Properties
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var barLabel: UINavigationItem!

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        cancelButton.title = String(localized: "cancel_button")
        saveButton.title = String(localized: "save_button")
        barLabel.title = String(localized: "case_label")
        descriptionTextView.delegate = self
        descriptionTextView.text = String(localized: "what_need_to_do")
        descriptionTextView.textColor = .lightGray
        descriptionTextView.layer.cornerRadius = 6
        descriptionTextView.textContainerInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    }

    // MARK: - Methods

    func textViewDidBeginEditing(_ textView: UITextView) {
        if descriptionTextView.textColor == .lightGray {
            descriptionTextView.text = ""
            descriptionTextView.textColor = .black
        }
    }
}
