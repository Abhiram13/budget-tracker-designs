import UIKit
import SwiftUI

struct Transaction {
    let date: String;
    let debit: Int;
    let credit: Int;
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Data model: These strings will be the data for the table view cells
//    let animals: [String] = ["Horse", "Cow", "Camel", "Sheep", "Goat"]
    
    let transactions: [Transaction] = [
        Transaction(date: "2022-10-20", debit: 234, credit: 5644),
        Transaction(date: "2022-12-12", debit: 67, credit: 678),
        Transaction(date: "2022-11-16", debit: 89, credit: 45),
    ]
    
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "cell"
    
    var tableView: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.green;
        
        tableView.frame = CGRectMake(0, 0, UIScreen.main.bounds.width, UIScreen.main.bounds.height)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        self.view.addSubview(tableView)
    }
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.transactions.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier)! as UITableViewCell;
        
        let stack = UIStackView();
        cell.addSubview(stack);
        cell.backgroundColor = UIColor.red;
        
        stack.translatesAutoresizingMaskIntoConstraints = false;
        stack.axis = .horizontal;
        stack.alignment = .fill;
        stack.distribution = .fillEqually;
        stack.spacing = 60
        stack.backgroundColor = UIColor.green
        stack.isLayoutMarginsRelativeArrangement = true;
        stack.leadingAnchor.constraint(equalTo: cell.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true;
        stack.trailingAnchor.constraint(equalTo: cell.safeAreaLayoutGuide.trailingAnchor, constant: 10).isActive = true;
                
        
        let dateLabel = UILabel();
        dateLabel.text = self.transactions[indexPath.row].date;
        
        let debitLabel = UILabel();
        debitLabel.text = "\(self.transactions[indexPath.row].debit)";
        
        let creditLabel = UILabel();
        creditLabel.text = "\(self.transactions[indexPath.row].credit)";
        
        stack.addArrangedSubview(dateLabel);
        stack.addArrangedSubview(debitLabel);
        stack.addArrangedSubview(creditLabel);
        
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
}

