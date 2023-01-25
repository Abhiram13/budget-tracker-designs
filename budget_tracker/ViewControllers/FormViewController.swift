import Foundation;
import UIKit;

class FormViewController: UIViewController {
    let text = TextField();
    let button = UIButton();
    var toggle: Bool = false;
    let picker = UIPickerView()
    let Num = ["1","2","3","4","5","6"];
    let label = UILabel();
    let clearText = UITextField();
    let toolbar = UIToolbar();
    
    override func viewDidLoad() {
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed));
        super.viewDidLoad();
        view.backgroundColor = .green;
        self.tabBarController?.tabBar.isHidden = true;
//        view.addSubview(text);
//        view.addSubview(button);
//        view.addSubview(picker)
        view.addSubview(label);
        view.addSubview(clearText);
        
        picker.delegate = self;
        picker.dataSource = self;
        
        toolbar.sizeToFit();
        toolbar.setItems([doneBtn], animated: true);
        
        label.text = "Hello World";
        label.isUserInteractionEnabled = false;
        label.translatesAutoresizingMaskIntoConstraints = false;
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true;
        
        clearText.translatesAutoresizingMaskIntoConstraints = false;
        clearText.topAnchor.constraint(equalTo: label.topAnchor).isActive = true;
        clearText.leadingAnchor.constraint(equalTo: label.leadingAnchor).isActive = true;
        clearText.trailingAnchor.constraint(equalTo: label.trailingAnchor).isActive = true;
        clearText.bottomAnchor.constraint(equalTo: label.bottomAnchor).isActive = true;
        clearText.backgroundColor = .clear;
        clearText.inputAccessoryView = toolbar;
        clearText.inputView = picker;
        
//        text.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true;
//        text.heightAnchor.constraint(equalToConstant: 50).isActive = true;
//        text.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true;
//        text.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true;
//
//        button.setTitle("Button", for: .normal)
//        button.addTarget(self, action: #selector(click), for: .touchUpInside);
//        button.translatesAutoresizingMaskIntoConstraints = false;
//        button.topAnchor.constraint(equalTo: text.bottomAnchor, constant: 20).isActive = true;
//        button.leadingAnchor.constraint(equalTo: text.leadingAnchor).isActive = true;
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false;
    }
    
    @objc private func click() {
        self.modalPresentationStyle = .fullScreen;
//        self.present(ModalView(), animated: true, completion: nil);
    }
    
    @objc private func donePressed() {
        self.view.endEditing(true);
    }
}

extension FormViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Num.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Num[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        label.text = Num[row];
    }
}

func TextField() -> UITextField {
    let textField = UITextField();
    textField.text = "";
    textField.placeholder = "Hello World";
    textField.translatesAutoresizingMaskIntoConstraints = false;
    textField.layer.borderWidth = 2;
    textField.layer.borderColor = UIColor.black.cgColor;
    textField.layer.cornerRadius = 10;
    
    return textField;
}
