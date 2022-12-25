import Foundation;
import UIKit;

class SchedularView: UIView {
    let scheduleStack: UIStackView = UIStackView();
    let dateField: UIView = UIView();
    let infoField: UIView = UIView();
    let dateLabel: UILabel = UILabel();
    let infoLabel: UILabel = UILabel();
    let timeLabel: UILabel = UILabel();
    let memberLabel: UILabel = UILabel();
    let controller: ViewController = ViewController();
    
    override init(frame: CGRect) {
        super.init(frame: frame);
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder);
    }
    
    required init() {
        super.init(frame: .zero);
        self.initialize();
    }
    
    private func initialize() -> Void {
        translatesAutoresizingMaskIntoConstraints = false;
        widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 50).isActive = true;
        heightAnchor.constraint(equalToConstant: 90).isActive = true;
        layer.cornerRadius = 20;
        layer.borderWidth = 2;
        layer.borderColor = UIColor.ThemeBlue.cgColor;
        layer.shadowColor = UIColor.gray.cgColor;
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 5
        addSubview(scheduleStack);
        
        self.scheduleStackConstraints();
    }
    
    private func scheduleStackConstraints() -> Void {
        scheduleStack.translatesAutoresizingMaskIntoConstraints = false;
        scheduleStack.axis = .horizontal;
        scheduleStack.isLayoutMarginsRelativeArrangement = true;
        scheduleStack.widthAnchor.constraint(equalTo: widthAnchor, constant: 0).isActive = true;
        scheduleStack.heightAnchor.constraint(equalTo: heightAnchor, constant: 0).isActive = true;
        scheduleStack.addArrangedSubview(dateField);
        scheduleStack.addArrangedSubview(infoField);
        
        dateField.addSubview(dateLabel);
        dateField.widthAnchor.constraint(equalToConstant: 90).isActive = true;
        dateField.backgroundColor = .ThemeBlue;
        dateField.layer.cornerRadius = 20;
        dateField.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner];
        
        infoField.addSubview(infoLabel)
        infoField.addSubview(timeLabel);
        infoField.addSubview(memberLabel);
        infoField.widthAnchor.constraint(equalToConstant: 160).isActive = true;
        infoField.backgroundColor = .white;
        infoField.layer.cornerRadius = 20;
        infoField.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner];
        infoField.layoutMargins = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0);
        
        self.dateFieldConstraints();
    }
    
    private func dateFieldConstraints() -> Void {
        dateLabel.text = "09:45    Join";
        dateLabel.lineBreakMode = .byWordWrapping;
        dateLabel.numberOfLines = 0;
        dateLabel.textColor = .white;
        dateLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false;
        dateLabel.widthAnchor.constraint(equalTo: dateField.widthAnchor, constant: 0).isActive = true;
        
        infoLabel.text = "Resume Consultation";
        infoLabel.textColor = .black;
        infoLabel.translatesAutoresizingMaskIntoConstraints = false;
        infoLabel.font = UIFont.systemFont(ofSize: 22, weight: .semibold);
        
        timeLabel.text = "30 min";
        timeLabel.textColor = .black;
        timeLabel.translatesAutoresizingMaskIntoConstraints = false;
        timeLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium);
        
        memberLabel.text = "Aslynn Dias";
        memberLabel.textColor = .black;
        memberLabel.translatesAutoresizingMaskIntoConstraints = false;
        memberLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium);
        
        NSLayoutConstraint.activate([
            dateLabel.leadingAnchor.constraint(equalTo: dateField.leadingAnchor, constant: 20),
            dateLabel.topAnchor.constraint(equalTo: dateField.topAnchor, constant: 20),
            infoLabel.leadingAnchor.constraint(equalTo: infoField.leadingAnchor, constant: 20),
            infoLabel.topAnchor.constraint(equalTo: infoField.topAnchor, constant: 20),
            timeLabel.leadingAnchor.constraint(equalTo: infoField.leadingAnchor, constant: 20),
            timeLabel.topAnchor.constraint(equalTo: infoField.topAnchor, constant: 50),
            memberLabel.leadingAnchor.constraint(equalTo: infoField.leadingAnchor, constant: 100),
            memberLabel.topAnchor.constraint(equalTo: infoField.topAnchor, constant: 50)
        ]);
    }
}
