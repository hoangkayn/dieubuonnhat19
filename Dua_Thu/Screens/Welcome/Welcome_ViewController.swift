//
//  Welcome_ViewController.swift
//  App_Dua_Thu
//
//  Created by Nguyễn Khánh Hoàng on 23/08/2022.
//
import UIKit
class Welcome_ViewController: UIViewController {
    var number = 0
    @IBOutlet weak var click_button: UIButton!
    @IBOutlet weak var img_logo: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
     
        img_logo.alpha = 0
        click_button.alpha = 0
        UIView.animate(withDuration: 2) { [self] in
            img_logo.alpha = 1
        } completion: { [self] (done) in
            click_button.alpha = 1
            let timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.update), userInfo: Timer.self, repeats: true)
        }

    }
    @objc func update(){
        if(number == 0){
            number = 1
            click_button.alpha = CGFloat(number)
        }
       else if(number == 1){
            number = 0
            click_button.alpha = CGFloat(number)
        }
    }
}
 
    
