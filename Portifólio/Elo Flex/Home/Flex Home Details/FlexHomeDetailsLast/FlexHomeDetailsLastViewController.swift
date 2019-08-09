//
//  FlexHomeDetailsLastViewController.swift
//  Elo
//
//  Created by Diego Vasconcelos on 01/08/19.
//  Copyright © 2019 4all. All rights reserved.
//

import UIKit

class FlexHomeDetailsLastViewController: UIViewController {
    
    lazy var lastView: FlexHomeDetailsLastView = {
        let view = FlexHomeDetailsLastView()
        
        view.imageView.image = UIImage(named: "carImage")!
        view.tableView.delegate = self
        view.tableView.dataSource = self
        view.tableView.separatorStyle = .none
        view.tableView.alwaysBounceVertical = false
        
        return view
    }()
    
    lazy var backButton: FlexHideNavigationView = {
        let view =  FlexHideNavigationView()
        view.backButton.addTarget(self, action: #selector(handlerBackButton(_:)), for: .touchUpInside)
        return view
    }()
    
    var isChoiceFlux: Bool? 
    
    var currentBannerIndex: Int?
    var navigator: FlexHomeNavigator?
    
    init(navigator: FlexHomeNavigator? = nil, fututeViewModel: Int? = nil) {
        self.navigator = navigator
        self.currentBannerIndex = fututeViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = lastView
        self.view.addSubview(backButton)
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func handlerBackButton(_ sender: UIButton) {
        navigator?.backToPreviousViewController()
    }
    
    @objc func handlerPopUpModal(_ sender: UIButton) {
//        navigator?.navigateModal(to: .popUp)
        navigator?.showModaL()
    }
    @objc func handlerChangeViewController(_ sender: UIButton) {
        navigator?.start(destination: .changeViewController)
    }
}

extension FlexHomeDetailsLastViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: FlexHomeDetailsLastTableViewCell.reusableIdentifier, for: indexPath) as! FlexHomeDetailsLastTableViewCell
            
            cell.bind(iconName: "VectorheadSet", description: "Atendimento 24h horas por dia, 7 dias por semana.")
            cell.selectionStyle = .none
            
            let separator = CALayer()
            separator.backgroundColor = UIColor.eloGray.cgColor
            separator.frame = CGRect(x: 0, y: 69, width: self.view.frame.size.width, height: 1)
            cell.layer.insertSublayer(separator, at:100)
            
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: FlexHomeDetailsLastTableViewCell.reusableIdentifier, for: indexPath) as! FlexHomeDetailsLastTableViewCell
            
            cell.bind(iconName: "Vectormedalha", description: "Serviço com garantia")
            
            cell.selectionStyle = .none
            
            let separator = CALayer()
            separator.backgroundColor = UIColor.eloGray.cgColor
            separator.frame = CGRect(x: 0, y: 59, width: self.view.frame.size.width, height: 1)
            cell.layer.insertSublayer(separator, at:100)
            
            return cell
            
        case 2:
            
            if let isTrue = self.isChoiceFlux, isTrue {
                let cell = tableView.dequeueReusableCell(withIdentifier: FlexHomeDetailsFooterChangeCell.reusableIdentifier, for: indexPath) as! FlexHomeDetailsFooterChangeCell
                cell.selectionStyle = .none
                cell.actionButton.addTarget(self, action: #selector(handlerChangeViewController(_:)), for: .touchUpInside)
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: FlexHomeDetailsLastTableViewFooterCell.reusableIdentifier, for: indexPath) as! FlexHomeDetailsLastTableViewFooterCell
                cell.selectionStyle = .none
                cell.actionButton.addTarget(self, action: #selector(handlerPopUpModal(_:)), for: .touchUpInside)
                return cell
            }
            
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 0:
            return 70.0
        case 1:
            return 60.0
        case 2:
            return 150.0
        default:
            return 0
        }
    }
    
}
