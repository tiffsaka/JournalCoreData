//
//  EntryController.swift
//  JournalCoreData
//
//  Created by Tiffany Sakaguchi on 4/26/21.
//

import CoreData

class EntryController {
    
    //MARK: - Properties
    
    static let sharedInstance = EntryController()
    
    var entries: [Entry] = []
    
    private lazy var fetchRequest: NSFetchRequest<Entry> = {
        let request = NSFetchRequest<Entry>(entityName: "Entry")
        request.predicate = NSPredicate(value: true)
        return request
    }()
    
    //MARK: - Functions
    
    func createEntry(title: String, bodyText: String) {
        let entry = Entry(title: title, bodyText: bodyText)
        
        self.entries.append(entry)
        CoreDataStack.saveContext()
    }
    
    func fetchEntries() {
        let entries = (try? CoreDataStack.context.fetch(self.fetchRequest)) ?? []
        print(entries.count)
        self.entries = entries
    }
    
    func updateEntry(entry: Entry, title: String, body: String){
//        entry.title = title
//        entry.bodyText = body
        CoreDataStack.saveContext()
    }
    
    
}//End of class


