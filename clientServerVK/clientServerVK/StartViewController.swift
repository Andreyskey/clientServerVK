//
//  StartViewController.swift
//  clientServerVK
//
//  Created by Андрей Волков on 03.04.2022.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let apiServeice = APIService()
        apiServeice.getFriends()
        apiServeice.getSearchGroup()
        apiServeice.getPhotos()
        apiServeice.getGroup()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
