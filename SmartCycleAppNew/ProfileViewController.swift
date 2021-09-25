//
//  ProfileViewController.swift
//  SmartCycleAppNew
//
//  Created by Ryan Hamby on 5/13/20.
//  Copyright © 2020 ecoSolve. All rights reserved.
//

import UIKit
import LBTAComponents
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage
import FirebaseFirestore

private let reuseIdentifier = "SettingsCell"

class ProfileViewController: UIViewController {
    
    var tableView: UITableView!
    var userInfoHeader: UserInfoHeader!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
     //   navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log Out", style: .done, target: self, action: #selector(handleSignOutButtonTapped))
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        configureTableView()
    }
    

    
    @objc func handleSignOutButtonTapped() {
        let signOutAction = UIAlertAction(title: "Log Out", style: .destructive) { (action) in
            do {
                try Auth.auth().signOut()
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                           var viewController: UIViewController
                        viewController = storyboard.instantiateViewController(withIdentifier: "introNAV")
                viewController.modalPresentationStyle = .fullScreen
                self.present(viewController, animated: true, completion: nil)
            } catch let err {
                print("Failed to sign out with error", err)
                Service.showAlert(on: self,style: .alert, title: "Log Out Error", message: err.localizedDescription)
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        Service.showAlert(on: self, style: .actionSheet, title: nil, message: nil, actions: [signOutAction, cancelAction],completion: nil)
    }
    
    func configureTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 60
        
        tableView.register(SettingsCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)
        tableView.frame = view.frame
        
        let frame = CGRect(x: 0, y: 80, width: view.frame.width, height: 100)
        userInfoHeader = UserInfoHeader(frame: frame)
        tableView.tableHeaderView = userInfoHeader
        tableView.tableFooterView = UIView()
    }
    
    func configureUI() {
        configureTableView()
        navigationController?.navigationBar.barTintColor = .white
        navigationItem.title = "Profile"
    }
    
    var index = NSIndexPath(row: 0, section: 0)
    
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return SettingsSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = SettingsSection(rawValue: section) else {return 0}
        switch section {
        case .Social: return SettingsOptions.allCases.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }

 func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row == 0) {
        if let viewController = storyboard?.instantiateViewController(identifier: "editProfVC") as? EditProfileViewController {
            navigationController?.pushViewController(viewController, animated: true)
            }
        }
        else if (indexPath.row == 2) {
        self.handleSignOutButtonTapped()
        }
        else if (indexPath.row == 1) {
            if let viewController = storyboard?.instantiateViewController(identifier: "redeemedRewardsVC") as? RedeemedRewardsViewController {
                  navigationController?.pushViewController(viewController, animated: true)
                  }
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SettingsCell
        guard let section = SettingsSection(rawValue: indexPath.section) else {return UITableViewCell()}
        switch section {
        case .Social: let social = SettingsOptions(rawValue: indexPath.row)
        cell.textLabel?.text = social?.description
             }
        return cell
    }

}
