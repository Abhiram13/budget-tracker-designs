import UIKit;
import AVFoundation;

class CalenderViewController: UIViewController {
    let calendarView = UICalendarView();
    
    override func viewDidLoad() {
        super.viewDidLoad();
        view.addSubview(calendarView);
        view.backgroundColor = .white;
        self.initialize();
    }
    
    private func initialize() -> Void {
        let gregorianCalendar = Calendar(identifier: .gregorian);
        calendarView.calendar = gregorianCalendar;
        calendarView.locale = Locale(identifier: "zh_TW");
        calendarView.fontDesign = .rounded;
        calendarView.visibleDateComponents = DateComponents(calendar: Calendar(identifier: .gregorian), year: 2022, month: 6, day: 6)
        
        let fromDateComponents = DateComponents(calendar: Calendar(identifier: .gregorian), year: 2022, month: 1, day: 1)
        let toDateComponents = DateComponents(calendar: Calendar(identifier: .gregorian), year: 2022, month: 12, day: 31)
        
        guard let fromDate = fromDateComponents.date, let toDate = toDateComponents.date else {
            return
        }
        
        let calendarViewDateRange = DateInterval(start: fromDate, end: toDate)
        calendarView.availableDateRange = calendarViewDateRange
    }
}
