import UIKit;
import AVFoundation;

struct Category {
    let title: String;
    let color: UIColor;
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
        let categoryScroll = UIScrollView();
        let categoryStack = UIStackView();
        let montlyBudgetLabel = UILabel();
        let budgetScroll = UIScrollView();
        let budgetStack = UIStackView();
        
        let categories: [Category] = [
            .init(title: "Houses", color: .CategoryBlue),
            .init(title: "Transport", color: .CategoryPink),
            .init(title: "Office", color: .CategoryOrange),
            .init(title: "Education", color: .CategoryBlue),
            .init(title: "Medicines", color: .CategoryPink),
            .init(title: "Food", color: .CategoryOrange),
        ]
        
        view.addSubview(scroller);
        
        scroller.addSubview(segment);
        scroller.addSubview(container);
        scroller.addSubview(topSpendingLabel);
        scroller.addSubview(categoryScroll);
        scroller.addSubview(montlyBudgetLabel);
        scroller.addSubview(budgetScroll);
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
        categoryScroll.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        categoryScroll.heightAnchor.constraint(equalToConstant: 110).isActive = true;
        categoryScroll.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true;
        categoryScroll.leadingAnchor.constraint(equalTo: topSpendingLabel.leadingAnchor).isActive = true
        categoryScroll.addSubview(categoryStack);
        categoryScroll.showsVerticalScrollIndicator = false;
        categoryScroll.showsHorizontalScrollIndicator = false;
        
        categoryStack.axis = .horizontal;
        categoryStack.alignment = .fill;
        categoryStack.spacing = 10;
        categoryStack.translatesAutoresizingMaskIntoConstraints = false;
        categoryStack.heightAnchor.constraint(equalToConstant: 110).isActive = true;
        
        montlyBudgetLabel.text = "Monthly Budget";
        montlyBudgetLabel.font = .systemFont(ofSize: 25, weight: .semibold);
        montlyBudgetLabel.translatesAutoresizingMaskIntoConstraints = false;
        montlyBudgetLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true;
        montlyBudgetLabel.topAnchor.constraint(equalTo: categoryScroll.bottomAnchor, constant: 20).isActive = true;
        
        budgetScroll.translatesAutoresizingMaskIntoConstraints = false;
        budgetScroll.contentSize = CGSize(width: UIScreen.main.bounds.width + 600, height: 110)
        budgetScroll.topAnchor.constraint(equalTo: montlyBudgetLabel.bottomAnchor, constant: 20).isActive = true;
        budgetScroll.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        budgetScroll.heightAnchor.constraint(equalToConstant: 140).isActive = true;
        budgetScroll.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true;
        budgetScroll.leadingAnchor.constraint(equalTo: montlyBudgetLabel.leadingAnchor).isActive = true
        budgetScroll.addSubview(budgetStack);
        budgetScroll.showsVerticalScrollIndicator = false;
        budgetScroll.showsHorizontalScrollIndicator = false;
        
        budgetStack.axis = .horizontal;
        budgetStack.alignment = .fill;
        budgetStack.spacing = 10;
        budgetStack.translatesAutoresizingMaskIntoConstraints = false;
        budgetStack.heightAnchor.constraint(equalToConstant: 140).isActive = true;
        budgetStack.addArrangedSubview(BudgetView(color: .CategoryPink, barColor: .ThemeSkyPink));
        budgetStack.addArrangedSubview(BudgetView(color: .CategoryBlue, barColor: .ThemeBlue));
        budgetStack.addArrangedSubview(BudgetView(color: .CategoryPink, barColor: .ThemeSkyPink));
        
        for category in categories {
            categoryStack.addArrangedSubview(CategoryBox(category: category.title, color: category.color));
        }
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
    
    private func BudgetView(color: UIColor, barColor: UIColor) -> UIView {
        let container = UIView();
        let categoryBox = UIView();
        let titleLabel = UILabel();
        let amountLabel = UILabel();
        let barView = BarGraphView(amount: "$1000.00", title: "$500.00", width: 0.5, color: barColor);
        
        container.backgroundColor = .white;
        container.layer.shadowColor = UIColor.gray.cgColor;
        container.layer.shadowOpacity = 0.1
        container.layer.shadowOffset = CGSize(width: -1, height: 1)
        container.layer.shadowRadius = 5;
        container.layer.cornerRadius = 20;
        container.translatesAutoresizingMaskIntoConstraints = false;
        container.widthAnchor.constraint(equalToConstant: 300).isActive = true;
        container.heightAnchor.constraint(equalToConstant: 140).isActive = true;
        container.addSubview(categoryBox);
        container.addSubview(titleLabel);
        container.addSubview(amountLabel);
        container.addSubview(barView);
        
        categoryBox.layer.cornerRadius = 13;
        categoryBox.backgroundColor = color;
        categoryBox.translatesAutoresizingMaskIntoConstraints = false;
        categoryBox.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20).isActive = true;
        categoryBox.topAnchor.constraint(equalTo: container.topAnchor, constant: 20).isActive = true;
        categoryBox.widthAnchor.constraint(equalToConstant: 50).isActive = true;
        categoryBox.heightAnchor.constraint(equalToConstant: 50).isActive = true;
        
        titleLabel.text = "Transportation";
        titleLabel.font = .systemFont(ofSize: 18, weight: .semibold);
        titleLabel.translatesAutoresizingMaskIntoConstraints = false;
        titleLabel.topAnchor.constraint(equalTo: categoryBox.topAnchor).isActive = true;
        titleLabel.leadingAnchor.constraint(equalTo: categoryBox.trailingAnchor, constant: 10).isActive = true;
        
        amountLabel.text = "$20 Per day";
        amountLabel.textColor = .gray;
        amountLabel.font = .systemFont(ofSize: 16, weight: .medium);
        amountLabel.translatesAutoresizingMaskIntoConstraints = false;
        amountLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 25).isActive = true;
        amountLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true;
        
        barView.leadingAnchor.constraint(equalTo: categoryBox.leadingAnchor).isActive = true;
        barView.topAnchor.constraint(equalTo: categoryBox.bottomAnchor, constant: 20).isActive = true;
        barView.widthAnchor.constraint(equalTo: container.widthAnchor, constant: -40).isActive = true;
        
        return container;
    }
}
