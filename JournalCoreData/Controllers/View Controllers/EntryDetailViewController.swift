//
//  EntryDetailViewController.swift
//  JournalCoreData
//
//  Created by Tiffany Sakaguchi on 4/26/21.
//

import UIKit

class EntryDetailViewController: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextField: UITextField!
    
    
    //MARK: - Properties
    
    var entry: Entry?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = titleTextField.text, !title.isEmpty,
              let body = bodyTextField.text, !body.isEmpty else { return }
        if let entry = entry {
            EntryController.sharedInstance.updateEntry(entry: entry, title: title, body: body)
        } else {
            EntryController.sharedInstance.createEntry(title: title, bodyText: body)
        }
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        titleTextField.text = ""
        bodyTextField.text = ""
    }
    
    
    
    func updateViews() {
        guard let entry = entry else { return }
        titleTextField.text = entry.title
        bodyTextField.text = entry.bodyText
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
