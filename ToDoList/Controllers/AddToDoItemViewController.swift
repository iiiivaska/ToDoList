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

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionTextView.delegate = self
        descriptionTextView.text = "Что надо сделать?"
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
