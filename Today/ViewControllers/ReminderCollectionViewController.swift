//
//  ReminderCollectionViewController.swift
//  Today
//
//  Created by Aleksei on 15.01.2023.
//

import UIKit

final class ReminderCollectionViewController: UICollectionViewController {
    
    // MARK: - Public Properties
    
    var dataSourse: DataSource!
    
    // MARK: - Life Cycles Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout
        
        let cellRegistrator = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
        
        dataSourse = DataSource(
            collectionView: collectionView, cellProvider: { (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: String) in
                collectionView.dequeueConfiguredReusableCell(
                    using: cellRegistrator,
                    for: indexPath,
                    item: itemIdentifier
                )
            }
        )
        
        var snapshot = Shapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(
            Reminder.sampleData.map( { $0.title } )
        )
        dataSourse.apply(snapshot)
        
        collectionView.dataSource = dataSourse
    }
}

    // MARK: - Private Methods

extension ReminderCollectionViewController {
    private func listLayout() -> UICollectionViewCompositionalLayout {
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.showsSeparators = false
        listConfiguration.backgroundColor = .clear
        
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }
}
