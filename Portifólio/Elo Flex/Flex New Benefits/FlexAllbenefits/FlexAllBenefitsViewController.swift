//
//  FlexAllBenefitsViewController.swift
//  Elo
//
//  Created by Diego Vasconcelos on 05/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit

class FlexAllBenefitsViewController: UIViewController {
    
    lazy var allBenefitsView: FlexAllBenefitsView = {
        let view = FlexAllBenefitsView()

//        view.tableView.contentInset = UIEdgeInsets(top: -35, left: 0, bottom: 0, right: 0)
//        view.tableView.sectionFooterHeight = 5
        
        view.tableView.delegate = self
        view.tableView.dataSource = self
        
        view.tableView.allowsSelection = false
        
        return view
    }()
    
    var expandableBenefits = [[Int]]()//[(array: [Int], bool: Bool)]//[[(int: Int, bool: Bool)]]()
    var isExpandable = [Bool]()
    
    
    var headerView: [FlexAllBenefitsTableViewHeaderView]?
    
    override func loadView() {
        super.loadView()
        self.view = allBenefitsView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        expandableBenefits = [[2,2],[2,2],[2,2]]
        isExpandable = [true, true, true]
        self.allBenefitsView.tableView.reloadData()
        //[(array: [2, 2], bool: false), (array: [2, 2], bool: false), (array: [2, 2], bool: false)]
        //[[(int: 2, bool: false), (int: 2, bool: false)],[(int: 2, bool: false)],[(int: 2, bool: false), (int: 2, bool: false)]]
        
    }

    @objc func handleExpandClose(button: UIButton){
        let section = button.tag
        var indexPaths = [IndexPath]()
        
        for row in expandableBenefits[section].indices {
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
        }
        
        let index = IndexPath(row: indexPaths.last!.row + 1, section: section)
        indexPaths.append(index)
        
        isExpandable[section] = !isExpandable[section]
        
//        let header = allBenefitsView.tableView.headerView(forSection: section) as? FlexAllBenefitsTableViewHeaderView
        
//        self.headerView?[section].newImage.value = isExpandable[section]
        
        if isExpandable[section] {
            self.allBenefitsView.tableView.beginUpdates()
            self.allBenefitsView.tableView.deleteRows(at: indexPaths, with: .fade)
            self.allBenefitsView.tableView.endUpdates()
        } else {
            
            self.allBenefitsView.tableView.beginUpdates()
            self.allBenefitsView.tableView.insertRows(at: indexPaths, with: .fade)
            self.allBenefitsView.tableView.endUpdates()
            
        }
        
//        for row in (expandableHistory![section].history.transactions!.indices){
//            let indexPath = IndexPath(row: row, section: section)
//            indexPaths.append(indexPath)
//        }
//
//        let isExpanded = expandableHistory![section].isExpanded
//        expandableHistory![section].isExpanded = !isExpanded
//        if isExpanded{
//            accountView.tableView.deleteRows(at: indexPaths, with: .fade)
//            //            headerView.showGreyLine()
//        }else{
//            accountView.tableView.insertRows(at: indexPaths, with: .fade)
//            //            headerView.hideGreyLine()
//        }
    }
}

extension FlexAllBenefitsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.expandableBenefits.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView: FlexAllBenefitsTableViewHeaderView = {
            let view = FlexAllBenefitsTableViewHeaderView()
            view.backgroundColor = .white
            view.mainButton.addTarget(self, action: #selector(handleExpandClose), for: .touchUpInside)
            return view
        }()
        //aqui será configurado uma viewModel futura
        headerView.bind()
        
        headerView.mainButton.tag = section
        
//        let history = expandableHistory![section].history
//        let accountCellViewModel = AccountCellViewModel.init(date: history.date ?? "", card: "", plan: history.subscription ?? "", status: "Fechado", price: Double(history.totalValue!).currencyFormatter, bonus: "\(history.bonus ?? 0) MB")
//        headerView.configHeaderViewInfo(accountCellViewModel: accountCellViewModel)

        self.headerView?.append(headerView)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.isExpandable[section] {
            return 0
        }
        return self.expandableBenefits[section].count + 1 //aqui vai ser determinado a quantidade de itens expandidos
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0...(self.expandableBenefits[indexPath.section].count - 1):
            
            let cell = tableView.dequeueReusableCell(withIdentifier: FlexAllBenefitsTableViewCell.reusableIdentifier, for: indexPath) as! FlexAllBenefitsTableViewCell
            
            return cell
        case self.expandableBenefits[indexPath.section].count:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: FlexAllBenefitsTableViewCellFooter.reusebleIdentifier, for: indexPath) as! FlexAllBenefitsTableViewCellFooter
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //        if indexPath.row == 0{
        //            return 43
        //        }
        return 90
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
