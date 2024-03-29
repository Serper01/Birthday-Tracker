//
//  ViewController.swift
//  Birthday Tracker
//
//  Created by Serper Kurmanbek on 29.08.2023.
//

import UIKit
import CoreData
import UserNotifications

class AddBirthdayViewController: UIViewController {
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var birthdatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        birthdatePicker.maximumDate = Date()
    
       
    }
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        print("Меня зовут \(firstName) \(lastName).")
        let birthdate = birthdatePicker.date
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let newBirthday = Birthday(context: context)
        newBirthday.firstName = firstName
        newBirthday.lastName = lastName
        newBirthday.birthdate = birthdate as Date?
        newBirthday.birthdayId = UUID().uuidString
        if let uniqueId = newBirthday.birthdayId{
            print ("birthdayId: \(uniqueId)")
        }
        do {
            try context.save()
        }
        catch let error {
            print ("Не удалось сохранить из-за ошибки \(error).")
        }

    
        
        dismiss (animated: true,completion: nil)
    }
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
    dismiss(animated: true, completion: nil)
    }
}

 
