//
//  CharacterDetailViewController.swift
//  TheBreakinBad
//
//  Created by AvanticaMAC2 on 2/10/21.
//

import UIKit

class CharacterDetailViewController: UIViewController {

    @IBOutlet var name: UILabel!
    @IBOutlet var image: UIImageView!
    @IBOutlet var nickname: UILabel!
    @IBOutlet var birthday: UILabel!
    @IBOutlet var status: UILabel!
    @IBOutlet var occupation: UILabel!
    
    var selectedCharacter: Character?
    
    lazy var presenter = CharacterDetailPresenter(viewController: self)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setCharacter()
    }
    
    func setCharacter() {
        
        defer{ GlobalProgressHUD.hide()}
        
        self.name.text = selectedCharacter?.name
        
        let url = URL(string: (selectedCharacter?.img)!)

        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async {
                self.image.image = UIImage(data: data!)
            }
        }
        
        self.nickname.text = selectedCharacter?.nickName
        self.birthday.text = selectedCharacter?.birthday
        self.status.text = selectedCharacter?.status
        self.occupation.text = selectedCharacter?.occupation![0]
        
        
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

extension CharacterDetailViewController: CharacterDetailPresenterView {
    func selectedCharacter(character: Character) {
        self.selectedCharacter = character
    }
    
    
}
