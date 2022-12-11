import Foundation;
import SQLite3;

struct ExistFilePath {
    let isExist: Bool;
    let path: String;
}

class DatabaseController {
    private let dbPath: String;
    var db: OpaquePointer?;
    
    init() {
        self.dbPath = "transactions.sqlite";
        self.db = OpenDatabase();
        self.createBankTable();
        self.createCategoryTable();
        self.createTransactionsTable();
    }
    
    private func OpenDatabase() -> OpaquePointer? {
        let file: ExistFilePath = self.checkFile();
        let fileURL: String;
        
        if file.isExist {
            fileURL = file.path;
        } else {
            fileURL = try! FileManager.default
                .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                .appendingPathComponent(dbPath).path;
        }
        
        if sqlite3_open(fileURL, &db) != SQLITE_OK {
            print("error opening database")
            return nil;
        }
        
        return db
    }
    
    private func createTransactionsTable() {
        if self.check(table: "transactions") {
            return;
        }
        
        let createTableString = """
            CREATE TABLE IF NOT EXISTS transactions(
                id INTEGER PRIMARY KEY AUTOINCREMENT, category_id INTEGER, description TEXT, to_bank_id INTEGER, amount INTEGER, type TEXT, from_bank_id INTEGER, due INTEGER, date TEXT
            );
        """
        var createTableStatement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(self.db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK {
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                print("transactions table created.")
            } else {
                print("transactions table could not be created.")
            }
        } else {
            print("CREATE TABLE transactions statement could not be prepared.")
        }
        
        sqlite3_finalize(createTableStatement)
    }
    
    private func alter() {
//        if self.check(table: "transactions") {
//            return;
//        }
        
        let createTableString = """
            ALTER TABLE transactions ADD COLUMN row_id TEXT;
        """
        var createTableStatement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(self.db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK {
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                print("transactions table altered.")
            } else {
                print("transactions table could not be altered.")
            }
        } else {
            print("ALTER TABLE transactions statement could not be prepared.")
        }
        
        sqlite3_finalize(createTableStatement)
    }
    
    private func createCategoryTable() {
        if self.check(table: "categories") {
            return;
        }
        
        let createTableString = """
            CREATE TABLE IF NOT EXISTS categories(id INTEGER PRIMARY KEY AUTOINCREMENT, category TEXT);
        """
        var createTableStatement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(self.db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK {
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                print("categories table created.")
            } else {
                print("categories table could not be created.")
            }
        } else {
            print("CREATE TABLE categories statement could not be prepared.")
        }
        
        sqlite3_finalize(createTableStatement)
    }
    
    private func createBankTable() {
        if self.check(table: "banks") {
            return;
        }
        
        let createTableString = """
            CREATE TABLE IF NOT EXISTS banks(
                id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT
            );
        """
        var createTableStatement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(self.db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK {
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                print("banks table created.")
            } else {
                print("banks table could not be created.")
            }
        } else {
            print("CREATE TABLE banks statement could not be prepared.")
        }
        
        sqlite3_finalize(createTableStatement)
    }
    
    private func check(table: String) -> Bool {
        let createTableString = "SELECT count(*) FROM sqlite_master WHERE type='table' AND name='\(table)';"
        var createTableStatement: OpaquePointer? = nil
        var x: Int;
        
        if sqlite3_prepare_v2(self.db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK {
            while sqlite3_step(createTableStatement) == SQLITE_ROW {
                let id = sqlite3_column_int(createTableStatement, 0);
                x = Int(id);
                sqlite3_finalize(createTableStatement)
                return x > 0;
            }
        } else {
            print("Something wrong")
            sqlite3_finalize(createTableStatement)
            return false;
        }
        
        sqlite3_finalize(createTableStatement)
        return false;
    }
    
    private func checkFile() -> ExistFilePath {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentDirectory = paths[0];
        let myFilePath = (documentDirectory as NSString).appendingPathComponent("transactions.sqlite")
        return ExistFilePath(
            isExist: FileManager.default.fileExists(atPath: myFilePath),
            path: myFilePath
        )
    }
}
