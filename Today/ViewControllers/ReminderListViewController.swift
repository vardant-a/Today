//
//  ReminderListViewController.swift
//  Today
//
//  Created by Aleksei on 15.01.2023.
//

import UIKit

final class ReminderListViewController: UIViewController {
    
    // MARK: - Private lazy Properties
    
    private lazy var reminderCollectionVC: ReminderCollectionViewController = {
        let collectionVC = ReminderCollectionViewController()
        
        return collectionVC
    }()

    // MARK: - Life Cycles Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        
    }
}

    // MARK: - Setup Constrains

extension ReminderListViewController {
    private func setConstrains() {
        
    }
}
