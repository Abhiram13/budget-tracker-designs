import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.green
    }
}

struct ViewControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ViewController {
        ViewController();
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
    }
}

struct ViewControllerPreviews: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
    }
}

