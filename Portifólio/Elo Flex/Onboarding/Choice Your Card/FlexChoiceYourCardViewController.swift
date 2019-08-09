//
//  FlexChoiceYourCardViewController.swift
//  Elo
//
//  Created by Diego Vasconcelos on 25/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import Foundation

class FlexChoiceYourCardViewController: UIViewController {
    
    lazy var choiceView: FlexChoiceYourCardView = {
        let view = FlexChoiceYourCardView()
        view.tableView.delegate = self
        view.tableView.dataSource = self
        view.tableView.register(FlexChoiceTableViewCell.self, forCellReuseIdentifier: FlexChoiceTableViewCell.identifier)
        view.tableView.separatorStyle = .none
        
        
        return view
    }()
    
    var cards: [CatCreditCardModel]?
    
    var navigator: FlexFirstAddCardNavigator?
    
    init(navigator: FlexFirstAddCardNavigator? = nil) {
        self.navigator = navigator
        super.init(nibName: nil, bundle: Bundle.main)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = choiceView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        let cardMock = [CatCreditCardModel(networkId: 4, networkName: "Diego A. Vasconcelos", digFour: "5658"),
                        CatCreditCardModel(networkId: 5, networkName: "Islas A. D.", digFour: "5698"),
                        CatCreditCardModel(networkId: 6, networkName: "Bruna Machado", digFour: "5659")]
        cards = cardMock
//        choiceView.tableView.tableFooterView = button
//        choiceView.tableView.reloadData()
    }
    
    @objc func handler(_ sender: CatEloButtonBlack) {
        
    }
}

extension FlexChoiceYourCardViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cards?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FlexChoiceTableViewCell.identifier, for: indexPath) as! FlexChoiceTableViewCell
        cell.selectionStyle = .none
        cell.separatorInset = UIEdgeInsets(top: 0, left: cell.bounds.width, bottom: 0, right: 0)
        cell.ownLabel.text = cards?[indexPath.row].networkName ?? "---"
        cell.numberLabel.text = "**** **** **** \(cards?[indexPath.row].digFour ?? "9999")"
//        cell.cardNumberLabel.text = "Elo Nanquim ****" + cards[indexPath.row].digFour!
//        cell.trashButton.addTarget(self, action: #selector(didTapDeleteCard), for: .touchUpInside)
        
        if indexPath.row == 0 {
        cell.circleColor = .redBradescoColor
        cell.setupCircle()
        } else if indexPath.row == 1 {
            cell.circleColor = .yellowBBColor
            cell.setupCircle()
        } else {
            cell.circleColor = .blueCaixaEletronicaColor
            cell.setupCircle()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! FlexChoiceTableViewCell
        cell.clickedAction()
        
        navigator?.start(destination: .home)
        //se quiser depois passar alguma informacao para home partindo daqui é so mandar pelo parametro ai.
        
        
        
    }
    
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = AddCardHeaderView()
//        headerView.addButton.addTarget(self, action: #selector(didTapAddCard), for: .touchUpInside)
//        return headerView
//    }
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 90
//    }
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        // this will turn on `masksToBounds` just before showing the cell
//        cell.contentView.layer.masksToBounds = true
//    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footerView: FlexChoiceYourCardFooter = {
            let view = FlexChoiceYourCardFooter()
            view.button.addTarget(self, action: #selector(handler(_:)), for: .touchUpInside)
            return view
        }()
        
        return footerView
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
