#  ToDoList
## Yandex ШМР
[https://www.youtube.com/playlist?list=PLQC2_0cDcSKBUXhSGqAbVAp3SFBKPnpFI](https://www.youtube.com/playlist?list=PLQC2_0cDcSKBUXhSGqAbVAp3SFBKPnpFI)

## View Methods
### Плэйсхолдер для TextView, исчезающий при начале редактирования

```swift
class ViewController: UIViewController, UITextViewDelegate {

@IBOutlet weak var descriptionTextView: UITextView!

override func viewDidLoad() {
        super.viewDidLoad()
        descriptionTextView.delegate = self
        descriptionTextView.text = "placeholder"
        descriptionTextView.textColor = .lightGray
}
 
 func textViewDidBeginEditing(_ textView: UITextView) {
        if descriptionTextView.textColor == .lightGray {
            descriptionTextView.text = ""
            descriptionTextView.textColor = .black
        }
    }
}
```

![TextViewPlaceholder](/readmeFiles/TextViewPlaceholder.gif)
