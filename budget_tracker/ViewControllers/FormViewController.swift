import Foundation;
import UIKit;

class FormViewController: UIViewController {
    let descriptionField = TextField(placeholder: "Description", keyboard: .asciiCapable);
    let amountField = TextField(placeholder: "Amount", keyboard: .numberPad);
    let fromBankField = TextField(placeholder: "From bank", keyboard: .asciiCapable);
    let toBankField = TextField(placeholder: "To bank", keyboard: .asciiCapable);
    let categoryField = TextField(placeholder: "Category", keyboard: .asciiCapable);
    let dateInput = TextField(placeholder: "Transaction Date", keyboard: .default);
    let datePicker = UIDatePicker();
    let submitButton = UIButton();
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.tabBarController?.tabBar.isHidden = true;
        view.backgroundColor = .white;
        view.addSubview(descriptionField);
        view.addSubview(amountField);
        view.addSubview(fromBankField);
        view.addSubview(toBankField);
        view.addSubview(categoryField);
        view.addSubview(dateInput);
        view.addSubview(submitButton);
        
        descriptionField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true;
        descriptionField.heightAnchor.constraint(equalToConstant: 50).isActive = true;
        descriptionField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true;
        descriptionField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true;
        
        amountField.widthAnchor.constraint(equalTo: descriptionField.widthAnchor).isActive = true;
        amountField.heightAnchor.constraint(equalTo: descriptionField.heightAnchor).isActive = true;
        amountField.leadingAnchor.constraint(equalTo: descriptionField.leadingAnchor).isActive = true;
        amountField.topAnchor.constraint(equalTo: descriptionField.bottomAnchor, constant: 20).isActive = true;
        
        fromBankField.widthAnchor.constraint(equalTo: amountField.widthAnchor).isActive = true;
        fromBankField.heightAnchor.constraint(equalTo: amountField.heightAnchor).isActive = true;
        fromBankField.leadingAnchor.constraint(equalTo: amountField.leadingAnchor).isActive = true;
        fromBankField.topAnchor.constraint(equalTo: amountField.bottomAnchor, constant: 20).isActive = true;
        fromBankField.addTarget(self, action: #selector(fromBankAction), for: .touchDown);
        
        toBankField.widthAnchor.constraint(equalTo: fromBankField.widthAnchor).isActive = true;
        toBankField.heightAnchor.constraint(equalTo: fromBankField.heightAnchor).isActive = true;
        toBankField.leadingAnchor.constraint(equalTo: fromBankField.leadingAnchor).isActive = true;
        toBankField.topAnchor.constraint(equalTo: fromBankField.bottomAnchor, constant: 20).isActive = true;
        toBankField.addTarget(self, action: #selector(toBankAction), for: .touchDown);
        
        categoryField.widthAnchor.constraint(equalTo: toBankField.widthAnchor).isActive = true;
        categoryField.heightAnchor.constraint(equalTo: toBankField.heightAnchor).isActive = true;
        categoryField.leadingAnchor.constraint(equalTo: toBankField.leadingAnchor).isActive = true;
        categoryField.topAnchor.constraint(equalTo: toBankField.bottomAnchor, constant: 20).isActive = true;
        categoryField.addTarget(self, action: #selector(click), for: .touchDown);
        
        dateInput.translatesAutoresizingMaskIntoConstraints = false;
        dateInput.topAnchor.constraint(equalTo: categoryField.bottomAnchor, constant: 20).isActive = true;
        dateInput.widthAnchor.constraint(equalTo: categoryField.widthAnchor).isActive = true;
        dateInput.heightAnchor.constraint(equalToConstant: 50).isActive = true;
        dateInput.leadingAnchor.constraint(equalTo: categoryField.leadingAnchor).isActive = true;
        
        submitButton.setTitle("Submit", for: .normal)
        submitButton.addTarget(self, action: #selector(submit), for: .touchUpInside);
        submitButton.translatesAutoresizingMaskIntoConstraints = false;
        submitButton.topAnchor.constraint(equalTo: dateInput.bottomAnchor, constant: 20).isActive = true;
        submitButton.leadingAnchor.constraint(equalTo: dateInput.leadingAnchor).isActive = true;
        submitButton.heightAnchor.constraint(equalToConstant: 50).isActive = true;
        submitButton.widthAnchor.constraint(equalTo: dateInput.widthAnchor).isActive = true;
        submitButton.layer.cornerRadius = 10;
        submitButton.backgroundColor = .systemBlue;
        
        createDatePicker();
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false;
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
    
    @objc private func click() {
        self.modalPresentationStyle = .fullScreen;
        self.present(ChildViewController() { data in
            self.categoryField.text = data;
        }, animated: true, completion: nil);
    }
    
    @objc private func fromBankAction() {
        self.modalPresentationStyle = .fullScreen;
        self.present(ChildViewController() { data in
            self.fromBankField.text = data;
        }, animated: true, completion: nil);
    }
    
    @objc private func toBankAction() {
        self.modalPresentationStyle = .fullScreen;
        self.present(ChildViewController() { data in
            self.toBankField.text = data;
        }, animated: true, completion: nil);
    }
    
    @objc private func submit() {
        print("description: \(descriptionField.text!)");
        print("amount: \(amountField.text!)");
        print("from bank: \(fromBankField.text!)");
        print("to bank: \(toBankField.text!)");
        print("catgeory: \(categoryField.text!)");
        print("date: \(dateInput.text!)");
    }
}

func TextField(placeholder: String, keyboard: UIKeyboardType) -> UITextField {
    let textField = UITextField();
    textField.text = "";
    textField.placeholder = placeholder;
    textField.translatesAutoresizingMaskIntoConstraints = false;
    textField.layer.borderWidth = 2;
    textField.layer.borderColor = UIColor.black.cgColor;
    textField.layer.cornerRadius = 10;
    textField.textAlignment = .center;
    textField.keyboardType = keyboard;
    
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
