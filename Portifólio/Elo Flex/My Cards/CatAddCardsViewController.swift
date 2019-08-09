//
//  CatAddCardsViewController.swift
//  Elo
//
//  Created by Bruna on 15/07/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit

class CatAddCardsViewController: UIViewController {

    lazy var myCardsView: CatAddCardsView = {
        var view = CatAddCardsView()
        view.tableView.delegate = self
        view.tableView.dataSource = self
//        view.addButton.addTarget(self, action: #selector(didTapAddCard), for: .touchUpInside)
//        view.trashButton.addTarget(self, action: #selector(didTapDeleteCard), for: .touchUpInside)
        
        return view
    }()
    
    var cards: [CatCreditCardModel] = [CatCreditCardModel]() {
        didSet{
            myCardsView.tableView.reloadData()
        }
    }
    
    var isFirstFlow: Bool?
    
    private var navigator: CatCardsNavigator?
    private var viewModel: ComboEloCardViewModelProtocol//ComboEloMyCardsViewModelProtocol
    // MARK: Life Cycle
    init(viewModel: ComboEloCardViewModelProtocol = ComboEloCardViewModel(), navigator: CatCardsNavigator? = nil) {
        self.viewModel = viewModel
        self.navigator = navigator
        super.init(nibName: nil, bundle: Bundle.main)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = myCardsView
        configBind()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Meus Cartões"
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        if let nav = navigationController as? CatEloNavigationController{
            
            if let bool = isFirstFlow, bool {
                nav.navigationBar.backItem?.title = ""
            } else {
                nav.addRightButtonItem(navItem: navigationItem)
            }
            nav.resetTitlePosition()
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem!.title = ""
        
        let cardMock = [CatCreditCardModel(networkId: 4, networkName: "Diego A. Vasconcelos", digFour: "5658"),
                        CatCreditCardModel(networkId: 5, networkName: "Islas A. D.", digFour: "5698"),
                        CatCreditCardModel(networkId: 6, networkName: "Hanna M. C. Oliveira", digFour: "5659"),
                        CatCreditCardModel(networkId: 7, networkName: "Benvinda C. Oliveira", digFour: "5660")]
        cards = cardMock
//        cards = Defaults.catGetUserCards()!
//        if let card = Defaults.catGetUserCard() {
//            myCardsView.bind(card: card)
//        }else{
//            myCardsView.deleteCardFromView()
//        }
        
    }
    private func configBind() {
        viewModel.error.bind { [weak self] msg in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.showDefaultAlert(withTitle: msg, andMessage: "")
            }
        }
        
        viewModel.loading.bind { [weak self] loading in
            guard let self = self else { return }
            DispatchQueue.main.async {
                loading ? self.showLoader() : self.hideLoader()
            }
        }
    }
    
    @objc func didTapAddCard(){
//        viewModel.goToAddCard()
        navigator?.navigate(to: .addCard)
    }
    
    @objc func didTapDeleteCard(){
//        viewModel.showDeleteCardAlert()
        navigator?.showAlert(alert: .removeCardAlert)
    }
}

extension CatAddCardsViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CatCardsTableViewCell.identifier, for: indexPath) as! CatCardsTableViewCell
        cell.selectionStyle = .none
        cell.separatorInset = UIEdgeInsets(top: 0, left: cell.bounds.width, bottom: 0, right: 0)
        cell.cardNumberLabel.text = "Elo Nanquim ****" + cards[indexPath.row].digFour!
        cell.trashButton.addTarget(self, action: #selector(didTapDeleteCard), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = AddCardHeaderView()
        headerView.addButton.addTarget(self, action: #selector(didTapAddCard), for: .touchUpInside)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 90
    }

}

extension CatAddCardsViewController: UITableViewDelegate{
    
}
