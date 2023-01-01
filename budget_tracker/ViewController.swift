import UIKit
import SwiftUI

class ViewController: UIViewController, UIScrollViewDelegate {
    let scroll = UIScrollView();
    let stack = UIStackView();
    
    override func viewDidLoad() {
        super.viewDidLoad();
        view.backgroundColor = .white;
        view.addSubview(scroll);
        scroll.delegate = self;
        scroll.contentSize = CGSize(width: 100, height: 100)
        scroll.addSubview(stack);
        scroll.translatesAutoresizingMaskIntoConstraints = false;
        scroll.backgroundColor = .blue;
        scroll.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scroll.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scroll.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scroll.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200).isActive = true
                
        stack.translatesAutoresizingMaskIntoConstraints = false;
        stack.isLayoutMarginsRelativeArrangement = true;
        stack.topAnchor.constraint(equalTo: scroll.topAnchor).isActive = true
        stack.leftAnchor.constraint(equalTo: scroll.leftAnchor).isActive = true
        stack.rightAnchor.constraint(equalTo: scroll.rightAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: scroll.bottomAnchor).isActive = true
        stack.heightAnchor.constraint(equalToConstant: 100).isActive = true
        stack.backgroundColor = .green;
        stack.axis = .horizontal;
        
        for i in 1...10 {
            let label = UILabel();
            label.text = "Hello \(i)";
            label.textColor = .black;
            stack.addArrangedSubview(label);
            label.widthAnchor.constraint(equalToConstant: 100).isActive = true
        }
    }
}

