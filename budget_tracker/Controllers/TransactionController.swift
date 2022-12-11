import Foundation;
import SQLite3;

struct Transaction {
    let id: Int;
    let amount: Int;
    let description: String;
    let type: String;
    let to_bank_id: String;
    let from_bank_id: String;
    let category_id: String;
    let date: String;
    let due: Int;
    let row_id: String;
}

struct TransactionByDate {
    let date: String;
    let debit: Int;
    let credit: Int;
    let count: Int;
}

class TransactionController {
    let db: OpaquePointer?;
    
    init() {
        self.db = DatabaseController().db;
    }
    
    func Insert(payload: Transaction) -> Bool {
        let insertStatementString = """
            INSERT INTO transactions (category_id, description, to_bank_id, amount, type, from_bank_id, due, date, row_id)
            VALUES (?, ?, ?, ?, ?, ?, ?, datetime(?), ?);
        """
        var insertStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(self.db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            sqlite3_bind_text(insertStatement, 1, (payload.category_id as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 2, (payload.description as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 3, (payload.to_bank_id as NSString).utf8String, -1, nil)
            sqlite3_bind_int(insertStatement, 4, Int32(payload.amount))
            sqlite3_bind_text(insertStatement, 5, (payload.type as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 6, (payload.from_bank_id as NSString).utf8String, -1, nil)            
            sqlite3_bind_int(insertStatement, 7, Int32(payload.due))
            sqlite3_bind_text(insertStatement, 8, (payload.date as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 9, (UUID().uuidString as NSString).utf8String, -1, nil)
            
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Successfully inserted row.")
                sqlite3_finalize(insertStatement);
                return true;
            } else {
                print("Could not insert row.")
                sqlite3_finalize(insertStatement);
                return false;
            }
        } else {
            print("INSERT statement could not be prepared.")
            sqlite3_finalize(insertStatement);
            return false;
        }
    }
    
    func ReadAll() -> [Transaction] {
        let queryStatementString = "SELECT * FROM transactions;"
        var queryStatement: OpaquePointer? = nil
        var transactions : [Transaction] = []
        
        if sqlite3_prepare_v2(self.db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let id = sqlite3_column_int(queryStatement, 0);
                let categoryId = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)));
                let description = String(describing: String(cString: sqlite3_column_text(queryStatement, 2)));
                let toBankId = String(describing: String(cString: sqlite3_column_text(queryStatement, 3)));
                let amount = sqlite3_column_int(queryStatement, 4)
                let type = String(describing: String(cString: sqlite3_column_text(queryStatement, 5)));
                let fromBankId = String(describing: String(cString: sqlite3_column_text(queryStatement, 6)));
                let due = sqlite3_column_int(queryStatement, 7)
                let date = String(describing: String(cString: sqlite3_column_text(queryStatement, 8)));
                let rowId = String(describing: String(cString: sqlite3_column_text(queryStatement, 9)));
                
                transactions.append(
                    Transaction(
                        id: Int(id),
                        amount: Int(amount),
                        description: description,
                        type: type,
                        to_bank_id: toBankId,
                        from_bank_id: fromBankId,
                        category_id: categoryId,
                        date: date,
                        due: Int(due),
                        row_id: rowId
                    )
                )
            }
        } else {
            print("SELECT statement could not be prepared")
        }
        
        sqlite3_finalize(queryStatement)
        return transactions;
    }
    
    func fetchByMonth(month: String, year: String) -> [TransactionByDate] {
        let query = """
            SELECT
                t.date,
                COALESCE(SUM(CASE WHEN t.type = 'debit' THEN amount END), 0) as debit,
                COALESCE(SUM(CASE WHEN t.type = 'credit' THEN amount END), 0) as credit,
                COUNT(*) as count
            FROM transactions t
            WHERE strftime('%m', t.date) = '\(month)' AND strftime('%Y', t.date) = '\(year)'
            GROUP BY DATE(t.date)
        """;
        
        var queryStatement: OpaquePointer? = nil
        var transactions: [TransactionByDate] = []
        
        if sqlite3_prepare_v2(self.db, query, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let date = String(describing: String(cString: sqlite3_column_text(queryStatement, 0)));
                let debit = sqlite3_column_int(queryStatement, 1);
                let credit = sqlite3_column_int(queryStatement, 2)
                let count = sqlite3_column_int(queryStatement, 3);
                transactions.append(
                    TransactionByDate(date: date, debit: Int(debit), credit: Int(credit), count: Int(count))
                )
            }
        } else {
            print("SELECT statement could not be prepared")
        }
        
        sqlite3_finalize(queryStatement)
        return transactions;
    }
}
