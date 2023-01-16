//
//  ReminderCollectionViewController.swift
//  Today
//
//  Created by Aleksei on 15.01.2023.
//

import UIKit

final class ReminderCollectionViewController: UICollectionViewController {
    
    // MARK: - Typealias
    
    typealias DataSource = UICollectionViewDiffableDataSource<Int, String>
    typealias Shapshot = NSDiffableDataSourceSnapshot<Int, String>
    
    // MARK: - Public Properties
    
    var dataSourse: DataSource!
    
    // MARK: - Life Cycles Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout
        
        let cellRegistrator = UICollectionView.CellRegistration { (cell: UICollectionViewListCell, indexPath: IndexPath, itemIdentifier: String) in
            let reminder = Reminder.sampleData[indexPath.item]
            var contentCell = cell.defaultContentConfiguration()
            
            contentCell.text = reminder.title
            
            cell.contentConfiguration = contentCell
        }
        
        dataSourse = DataSource(
            collectionView: collectionView, cellProvider: { (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: String) in
                return collectionView.dequeueConfiguredReusableCell(using: cellRegistrator, for: indexPath, item: itemIdentifier)
            }
        )
        
        var snapshot = Shapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(Reminder.sampleData.map( { $0.title } ))
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
