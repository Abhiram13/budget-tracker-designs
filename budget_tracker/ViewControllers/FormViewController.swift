import Foundation;
import UIKit;

class FormViewController: UIViewController {
    let text = TextField();
    let button = UIButton();
    var toggle: Bool = false;
    let label = UILabel();
    var txt: String = "Button";
    let datePicker = UIDatePicker();
    let dateInput = TextField();
    
    override func viewDidLoad() {
        super.viewDidLoad();
        view.backgroundColor = .green;
        self.tabBarController?.tabBar.isHidden = true;
        view.addSubview(text);
        view.addSubview(button);
        view.addSubview(label);
        view.addSubview(dateInput);
        
        label.text = txt;
        label.isUserInteractionEnabled = false;
        label.translatesAutoresizingMaskIntoConstraints = false;
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true;
        
        text.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true;
        text.heightAnchor.constraint(equalToConstant: 50).isActive = true;
        text.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true;
        text.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true;

        button.setTitle(txt, for: .normal)
        button.addTarget(self, action: #selector(click), for: .touchUpInside);
        button.translatesAutoresizingMaskIntoConstraints = false;
        button.topAnchor.constraint(equalTo: text.bottomAnchor, constant: 20).isActive = true;
        button.leadingAnchor.constraint(equalTo: text.leadingAnchor).isActive = true;
        
        dateInput.translatesAutoresizingMaskIntoConstraints = false;
        dateInput.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20).isActive = true;
        dateInput.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true;
        dateInput.heightAnchor.constraint(equalToConstant: 50).isActive = true;
        dateInput.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true;
        
        createDatePicker();
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false;
    }
    
    @objc private func click() {
        self.modalPresentationStyle = .fullScreen;
        self.present(ChildViewController() { data in
            self.label.text = data;
        }, animated: true, completion: nil);
    }
    
    private func toolBarForDate() -> UIToolbar {
        let toolbar = UIToolbar();
        toolbar.sizeToFit();
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneForDate));
        toolbar.setItems([doneBtn], animated: true);
        
        return toolbar;
    }
    
    private func createDatePicker() {
        datePicker.preferredDatePickerStyle = .wheels;
        datePicker.datePickerMode = .date;
        
        dateInput.textAlignment = .center;
        dateInput.inputAccessoryView = toolBarForDate();
        dateInput.inputView = datePicker;
    }
    
    @objc private func doneForDate() {
        let dateFormat = DateFormatter();
        dateFormat.dateStyle = .medium;
        dateFormat.timeStyle = .none;
        
        dateInput.text = dateFormat.string(from: datePicker.date);
        view.endEditing(true);
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

class ChildViewController: UIViewController {
    var callBack: ((_ data: String) -> Void);
    let banks: [String] = ["Text one", "Text two", "Text three", "Text four"];
    let stack = UIStackView();
    let scroll = UIScrollView();
    
    required init?(coder: NSCoder) {
        self.callBack = {(data: String) -> Void in return};
        super.init(coder: coder);
    }
    
    init(callback: @escaping (String) -> Void) {
        self.callBack = callback;
        super.init(nibName: nil, bundle: nil);
    }
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white;        
        
        view.addSubview(scroll);
        scroll.addSubview(stack);
        
        scroll.translatesAutoresizingMaskIntoConstraints = false;
        scroll.contentSize = CGSize(width: view.frame.width, height: 1000);
        
        stack.translatesAutoresizingMaskIntoConstraints = false;
        stack.backgroundColor = .yellow;
        stack.axis = .vertical;
        stack.distribution = .equalSpacing;
        
        for bank in banks {
            let label = UILabel();
            let tapGesture = CustomTapGesture(target: self, action: #selector(tap));
            label.text = bank;
            label.translatesAutoresizingMaskIntoConstraints = false;
            label.heightAnchor.constraint(equalToConstant: 50).isActive = true;
            label.isUserInteractionEnabled = true;
            label.addGestureRecognizer(tapGesture);
            tapGesture.value = bank;
            stack.addArrangedSubview(label);
        }
        
        NSLayoutConstraint.activate([
            scroll.widthAnchor.constraint(equalTo: view.widthAnchor),
            scroll.heightAnchor.constraint(equalTo: view.heightAnchor),
            stack.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30),
            stack.topAnchor.constraint(equalTo: scroll.topAnchor, constant: 20),
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ]);
    }
    
    @objc private func tap(sender: CustomTapGesture) {
        self.callBack(sender.value!);
        self.dismiss(animated: true);
    }
}

class CustomTapGesture: UITapGestureRecognizer {
    var value: String?;
}
