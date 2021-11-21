//
//  MenuViewController.swift
//  Let's Eat : A Recipe App
//
//  Created by Natalie on 11/10/21.
//

import UIKit

class MenuViewController: UIViewController {

    
    private let areaButton: UIButton = {
        let areaButton = UIButton(frame: CGRect(x:100, y: 300, width: 200, height: 50))
        areaButton.backgroundColor = .white
        areaButton.setTitle("Meals by Area", for: .normal)
        areaButton.layer.cornerRadius = 12
        areaButton.setTitleColor(.systemGray, for: .normal)
        areaButton.addTarget(self, action: #selector(areaButtonTapped), for: .touchUpInside)
        return areaButton
    }()
    
    private let letterButton: UIButton = {
        let letterButton = UIButton(frame: CGRect(x:100, y: 200, width: 200, height: 50))
        letterButton.backgroundColor = .white
        letterButton.layer.cornerRadius = 12
        letterButton.setTitle("Meals by first letter", for: .normal)
        letterButton.setTitleColor(.systemGray, for: .normal)
        letterButton.addTarget(self, action: #selector(letterButtonTapped), for: .touchUpInside)
        return letterButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightBlue
        title = "Menu"
    }
    
    override func viewDidAppear(_ animated: Bool) {
                view.addSubview(areaButton)
                view.addSubview(letterButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    //Button calls
    @objc func areaButtonTapped(){
        fetchAreas()
    }
    @objc func letterButtonTapped(){
        getLetter()
    }
    
    private func fetchAreas(){
        let task = APICaller.shared.getListData(with: "a=list", expecting: AreaList.self){ [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let model):
                    self?.showAreaList(with: model)
                    break
                case .failure(let error):
                    print(String(describing: error))
                    self?.failedToFetch()
                }
            }
        }
    }
    
    private func showAreaList(with model: AreaList){
        let areas = model.meals
        var areaList = [String]()
        for area in areas{
            areaList.append(area.strArea)
        }
        let vc = AreaListViewController()
        self.addChild(vc)
        vc.didMove(toParent: self)
        vc.areaList = areaList
        print(vc.parent)
//        let nav = UINavigationController(rootViewController: vc)
        self.navigationController?.pushViewController(vc, animated: false)
}
    
    private func getLetter(){
        let vc = LetterListViewController()
        self.addChild(vc)
        vc.didMove(toParent: self)
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

