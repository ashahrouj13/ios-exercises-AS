//
//  ViewController.swift
//  WW-Exercise-01
//
//  Created by Paul Newman on 7/13/16.
//  Copyright © 2016 Weight Watchers. All rights reserved.
//

import UIKit
import PureLayout
import AlamofireImage

class ViewController: UIViewController {
    
    var didSetupContrainsts = false
    var label = UILabel().configureForAutoLayout()
    var imageView = UIImageView().configureForAutoLayout()
    var tableView = UITableView().configureForAutoLayout()
    
    var messagesArray: [MessagesModel] = []
    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.white
        createSubviews()
        setupAPIManager()
    }
    
    // setup and get data related to specific endpoint by networker manager.
    private func setupAPIManager() {
      
        let apiManager = APIManager.init()
        let router = APIRouter.init(endpoint: APIEndpoint.getMessages())
        apiManager.request(apiRouter: router, showAlert: false, completionHandler: { [weak self] (response,_) in
            
            guard let strongSelf = self else { return }
            guard let messages = response as? [MessagesModel] else { return }
            strongSelf.messagesArray = messages
            strongSelf.tableView.reloadData()
            
        })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Private methods
    
    private func createSubviews() {
        
        label.text = "Summer Grilling"
        label.textAlignment = .center
        view.addSubview(label)
        
        if let imageUrl = URL(string: "http://www.weightwatchers.com/images/1033/dynamic/foodandrecipes/2015/07/TANDORI_GRILLED_SHRIMP_1053_800x800.jpg") {
            imageView.contentMode = .scaleAspectFit
            imageView.af_setImage(withURL: imageUrl)
        }
        
        view.addSubview(imageView)
       
        tableView.rowHeight = 50.0
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)
        
        view.setNeedsUpdateConstraints()
        view.updateConstraintsIfNeeded()
    }
    
    // MARK: - Auto layout
    
    override func updateViewConstraints() {
        if !didSetupContrainsts {
            
            label.autoSetDimensions(to: CGSize(width: 100, height: 20))
            label.autoPin(toTopLayoutGuideOf: self, withInset: 50)
            label.autoAlignAxis(toSuperviewAxis: .vertical)
            
            // setup image
            imageView.autoPinEdge(.top, to: .bottom, of: label, withOffset: 20)
            imageView.autoPin(toTopLayoutGuideOf: self, withInset: 70)
            imageView.autoSetDimension(.height, toSize: 200)
            imageView.autoAlignAxis(toSuperviewAxis: .vertical)
            
            // setup tableview
            tableView.autoPinEdge(toSuperviewEdge: .bottom)
            tableView.autoMatch(.width, to: .width, of: view)
            tableView.autoAlignAxis(toSuperviewAxis: .vertical)
            tableView.autoPinEdge(.top, to: .bottom, of: imageView, withOffset: 10.0)
            
            didSetupContrainsts = true
        }
        
        super.updateViewConstraints()
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messagesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let currentObject = messagesArray[indexPath.row]
        
        cell.textLabel?.text = currentObject.title
        if let imageUrl = URL(string: "http://www.weightwatchers.com/" + currentObject.image) {
            cell.imageView?.af_setImage(withURL: imageUrl, placeholderImage: UIImage(named: "place_holder"))
        }
        
        return cell
    }
}
