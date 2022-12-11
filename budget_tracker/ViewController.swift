import UIKit
import SwiftUI

struct Something {
    let date: String;
    let debit: Int;
    let credit: Int;
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let cellReuseIdentifier = "cell";
    let tableView: UITableView = UITableView();
    let transactionController: TransactionController = TransactionController();
    var transactionsByMonth: [TransactionByDate] = [TransactionByDate(date: "", debit: 0, credit: 0, count: 0)];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)

        tableView.frame = CGRectMake(0, 0, UIScreen.main.bounds.width, UIScreen.main.bounds.height)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tableView.backgroundColor = UIColor.brown;
        self.transactionsByMonth = self.transactionController.fetchByMonth(month: "12", year: "2022");
//        self.transactionController.Insert(
//            payload: Transaction(
//                id: 2, amount: 879, description: "asasd", type: "debit", to_bank_id: "ashj", from_bank_id: "asj", category_id: "ajk", date: "2022-12-15", due: 0, row_id: "asdj"
//            )
//        )
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.transactionsByMonth.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70;
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier)! as UITableViewCell;
        
        let stack = UIStackView();
        cell.addSubview(stack);
        cell.backgroundColor = UIColor.red;
        
        stack.translatesAutoresizingMaskIntoConstraints = false;
        stack.axis = .horizontal;
        stack.alignment = .center;
        stack.distribution = .equalSpacing;
        stack.backgroundColor = UIColor.green
        stack.isLayoutMarginsRelativeArrangement = true;
        stack.leadingAnchor.constraint(equalTo: cell.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true; // padding leading
        stack.topAnchor.constraint(equalTo: cell.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true; // padding top
        stack.widthAnchor.constraint(equalToConstant: 350).isActive = true; // width of stack view
        stack.heightAnchor.constraint(equalToConstant: 40).isActive = true; // height of stack view

        let dateLabel = UILabel();
        dateLabel.text = self.transactionsByMonth[indexPath.row].date;
        dateLabel.backgroundColor = UIColor.blue;
        dateLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true

        let debitLabel = UILabel();
        debitLabel.text = "\(self.transactionsByMonth[indexPath.row].debit)";
        debitLabel.backgroundColor = UIColor.purple;
        debitLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        let creditLabel = UILabel();
        creditLabel.text = "\(self.transactionsByMonth[indexPath.row].credit)";
        creditLabel.backgroundColor = UIColor.yellow;
        creditLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        stack.addArrangedSubview(dateLabel);
        stack.addArrangedSubview(debitLabel);
        stack.addArrangedSubview(creditLabel);
        
        return cell
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
}

