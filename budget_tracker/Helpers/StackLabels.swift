import Foundation;
import UIKit;

class StackLabelDesign {
    static func AmountLabel(content: String) -> UILabel {
        let label: UILabel = UILabel();
        label.text = content;
        label.textAlignment = .center;
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold);
        label.translatesAutoresizingMaskIntoConstraints = false;
        
        return label;
    }
    
    static func DurationTypeLabel(content: String) -> UILabel {
        let label: UILabel = UILabel();
        label.text = content;
        label.textAlignment = .center;
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular);
        label.translatesAutoresizingMaskIntoConstraints = false;
        
        return label;
    }
    
    static func AmountStatusLabel(content: String, textColor: UIColor) -> UILabel {
        let label: UILabel = UILabel();
        label.text = content;
        label.textAlignment = .center;
        label.textColor = textColor;
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold);
        label.translatesAutoresizingMaskIntoConstraints = false;
        
        return label;
    }
}
