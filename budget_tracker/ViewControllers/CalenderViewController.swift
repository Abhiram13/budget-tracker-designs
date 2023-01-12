import UIKit;
import AVFoundation;

extension UIScrollView {
    
}

class CalenderViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad();
        let navBar: UINavigationBar = (self.navigationController?.navigationBar)!;
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.blue;
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]; // for large title
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]; // for small title
        
        view.backgroundColor = .white;
        
        navBar.barTintColor = .blue;
        navBar.topItem?.title = "Calender";
        navBar.prefersLargeTitles = true;
        navBar.standardAppearance = appearance;
        
        initialize();
    }
    
    private func initialize() -> Void {
        let scroller = UIScrollView();
        let segment = SegmentView();
        let container = SavingsContainerView();
        let topSpendingLabel = UILabel();
        let category = CategoryBox(category: "Home", color: .red);
        let category1 = CategoryBox(category: "Medicines", color: .green);
        let category2 = CategoryBox(category: "JHGhjh", color: .blue);
        let category3 = CategoryBox(category: "hjkk", color: .ThemePurple);
        let category4 = CategoryBox(category: "hjkk", color: .ThemeSkyPink);
        let category5 = CategoryBox(category: "hjkk", color: .ThemeSkyBlue);
        let category6 = CategoryBox(category: "hjkk", color: .ThemeGreen);
        let category7 = CategoryBox(category: "hjkk", color: .orange);
        let category8 = CategoryBox(category: "hjkk", color: .purple);
        let categoryScroll = UIScrollView();
        let categoryStack = UIStackView();
        
        view.addSubview(scroller);
        
        scroller.addSubview(segment);
        scroller.addSubview(container);
        scroller.addSubview(topSpendingLabel);
        scroller.addSubview(categoryScroll);
        scroller.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 2000)
        scroller.translatesAutoresizingMaskIntoConstraints = false;
        scroller.topAnchor.constraint(equalTo: view.topAnchor).isActive = true;
        scroller.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scroller.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scroller.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height - 50).isActive = true;
        
        //Segment view constraints
        segment.topAnchor.constraint(equalTo: scroller.topAnchor, constant: 20).isActive = true;
        segment.centerXAnchor.constraint(equalTo: scroller.centerXAnchor).isActive = true;
        
        // Container view contraints
        container.widthAnchor.constraint(equalTo: scroller.widthAnchor, constant: -50).isActive = true;
        container.topAnchor.constraint(equalTo: segment.bottomAnchor, constant: 20).isActive = true;
        container.heightAnchor.constraint(equalToConstant: 200).isActive = true;
        container.centerXAnchor.constraint(equalTo: scroller.centerXAnchor).isActive = true;
        
        topSpendingLabel.text = "Top Spending";
        topSpendingLabel.font = .systemFont(ofSize: 25, weight: .semibold);
        topSpendingLabel.translatesAutoresizingMaskIntoConstraints = false;
        topSpendingLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true;
        topSpendingLabel.topAnchor.constraint(equalTo: container.bottomAnchor, constant: 20).isActive = true;
        
        categoryScroll.translatesAutoresizingMaskIntoConstraints = false;
        categoryScroll.contentSize = CGSize(width: UIScreen.main.bounds.width + 400, height: 110)
        categoryScroll.topAnchor.constraint(equalTo: topSpendingLabel.bottomAnchor, constant: 15).isActive = true;
        categoryScroll.leftAnchor.constraint(equalTo: topSpendingLabel.leftAnchor).isActive = true
        categoryScroll.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        categoryScroll.heightAnchor.constraint(equalToConstant: 110).isActive = true;
        categoryScroll.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true;
//        categoryScroll.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true;
        categoryScroll.addSubview(categoryStack);
        categoryScroll.showsVerticalScrollIndicator = false;
        categoryScroll.showsHorizontalScrollIndicator = false;
        
        categoryStack.axis = .horizontal;
        categoryStack.alignment = .fill;
        categoryStack.spacing = 10;
        categoryStack.translatesAutoresizingMaskIntoConstraints = false;
//        categoryStack.leadingAnchor.constraint(equalTo: categoryScroll.leadingAnchor).isActive = true;
        categoryStack.heightAnchor.constraint(equalToConstant: 110).isActive = true;
        categoryStack.addArrangedSubview(category);
        categoryStack.addArrangedSubview(category1);
        categoryStack.addArrangedSubview(category2);
        categoryStack.addArrangedSubview(category3);
        categoryStack.addArrangedSubview(category4);
//        categoryStack.addArrangedSubview(category5);
//        categoryStack.addArrangedSubview(category6);
//        categoryStack.addArrangedSubview(category7);
//        categoryStack.addArrangedSubview(category8);
        
//        category.leadingAnchor.constraint(equalTo: topSpendingLabel.leadingAnchor).isActive = true;
//        category.topAnchor.constraint(equalTo: topSpendingLabel.bottomAnchor, constant: 15).isActive = true;
    }
    
    private func SegmentView() -> UISegmentedControl {
        let segment = UISegmentedControl(items: ["Expense", "Income"]);
        segment.selectedSegmentIndex = 0;
        segment.translatesAutoresizingMaskIntoConstraints = false;
        segment.selectedSegmentTintColor = .blue;
        segment.setWidth(180, forSegmentAt: 0);
        segment.setWidth(180, forSegmentAt: 1);
        
        return segment;
    }
    
    private func SavingsContainerView() -> UIView {
        let container = UIView();
        let titleLabel = UILabel();
        let amountLabel = UILabel();
        let bar = BarGraphView(amount: "$10,000.00", title: "Earned", width: 0.6, color: .ThemeSkyBlue);
        let spentBar = BarGraphView(amount: "$10,000.00", title: "Spend", width: 0.45, color: .ThemeSkyPink);
        
        container.addSubview(titleLabel);
        container.addSubview(amountLabel);
        container.addSubview(bar);
        container.addSubview(spentBar);
        container.translatesAutoresizingMaskIntoConstraints = false;
        container.backgroundColor = .white;
        container.layer.cornerRadius = 20;
        container.layer.shadowColor = UIColor.gray.cgColor;
        container.layer.shadowOpacity = 0.1
        container.layer.shadowOffset = CGSize(width: -1, height: 1)
        container.layer.shadowRadius = 5
        
        // Title Label contraints
        titleLabel.translatesAutoresizingMaskIntoConstraints = false;
        titleLabel.text = "March Savings";
        titleLabel.textColor = .gray;
        titleLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 25).isActive = true;
        titleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 30).isActive = true;
        titleLabel.font = .systemFont(ofSize: 14, weight: .medium);
        
        // Amount Label contraints
        amountLabel.translatesAutoresizingMaskIntoConstraints = false;
        amountLabel.text = "$7,456.00";
        amountLabel.textColor = .black;
        amountLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true;
        amountLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true;
        amountLabel.font = .systemFont(ofSize: 30, weight: .bold);
        
        // First Bar Graph contraints
        bar.widthAnchor.constraint(equalTo: container.widthAnchor, constant: -60).isActive = true;
        bar.topAnchor.constraint(equalTo: amountLabel.bottomAnchor, constant: 20).isActive = true;
        bar.leadingAnchor.constraint(equalTo: amountLabel.leadingAnchor).isActive = true;
        
        // Second Bar Graph contraints
        spentBar.widthAnchor.constraint(equalTo: bar.widthAnchor).isActive = true;
        spentBar.topAnchor.constraint(equalTo: bar.bottomAnchor, constant: 15).isActive = true;
        spentBar.leadingAnchor.constraint(equalTo: bar.leadingAnchor).isActive = true;
        
        return container;
    }
    
    private func BarGraphView(amount: String, title: String, width: CGFloat, color: UIColor) -> UIView {
        let bar = UIView();
        let barAmount = UIView();
        let amountLabel = UILabel();
        let titlelabel = UILabel();
        let radius: CGFloat = 15;
        
        bar.addSubview(amountLabel);
        bar.addSubview(titlelabel);
        bar.addSubview(barAmount);
        bar.translatesAutoresizingMaskIntoConstraints = false;
        bar.backgroundColor = .LightWhite;
        bar.layer.cornerRadius = radius;
        bar.heightAnchor.constraint(equalToConstant: 25).isActive = true;
        
        barAmount.translatesAutoresizingMaskIntoConstraints = false;
        barAmount.backgroundColor = color;
        barAmount.layer.cornerRadius = radius;
        barAmount.heightAnchor.constraint(equalTo: bar.heightAnchor).isActive = true;
        barAmount.widthAnchor.constraint(equalTo: bar.widthAnchor, multiplier: width).isActive = true;
        
        amountLabel.translatesAutoresizingMaskIntoConstraints = false;
        amountLabel.text = amount;
        amountLabel.textColor = .gray;
        amountLabel.font = .systemFont(ofSize: 14, weight: .medium);
        amountLabel.trailingAnchor.constraint(equalTo: bar.trailingAnchor, constant: -20).isActive = true;
        amountLabel.centerYAnchor.constraint(equalTo: bar.centerYAnchor).isActive = true;
        amountLabel.layer.zPosition = 1; // acts as Z-Index
        
        titlelabel.translatesAutoresizingMaskIntoConstraints = false;
        titlelabel.text = title;
        titlelabel.textColor = .white;
        titlelabel.font = .systemFont(ofSize: 14, weight: .medium);
        titlelabel.leadingAnchor.constraint(equalTo: bar.leadingAnchor, constant: 20).isActive = true;
        titlelabel.centerYAnchor.constraint(equalTo: bar.centerYAnchor).isActive = true;
        titlelabel.layer.zPosition = 1; // acts as Z-Index
        
        return bar;
    }
    
    private func CategoryBox(category: String, color: UIColor) -> UIView {
        let parentView = UIView();
        let childView = UIView();
        let label = UILabel();
        
        parentView.addSubview(childView);
        parentView.addSubview(label);
        parentView.translatesAutoresizingMaskIntoConstraints = false;
        parentView.widthAnchor.constraint(equalToConstant: 70).isActive = true;
        parentView.heightAnchor.constraint(equalToConstant: 110).isActive = true;
        
        childView.translatesAutoresizingMaskIntoConstraints = false;
        childView.widthAnchor.constraint(equalTo: parentView.widthAnchor).isActive = true;
        childView.heightAnchor.constraint(equalTo: parentView.widthAnchor).isActive = true;
        childView.backgroundColor = color;
        childView.layer.cornerRadius = 15;
        
        label.text = category;
        label.translatesAutoresizingMaskIntoConstraints = false;
        label.topAnchor.constraint(equalTo: childView.bottomAnchor, constant: 10).isActive = true;
        label.centerXAnchor.constraint(equalTo: parentView.centerXAnchor).isActive = true;
        label.font = .systemFont(ofSize: 14, weight: .regular)
        
        return parentView;
    }
}
