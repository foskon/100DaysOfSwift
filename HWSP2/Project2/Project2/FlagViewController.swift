import Foundation
import UIKit

class FlagViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    private var countries: [String]!
    private var score: Int!
    
    class func instantiate() -> FlagViewController {
        let vc: FlagViewController = UIStoryboard(name: "Flag", bundle: nil).instantiateViewController(identifier: "FlagViewController")
        vc.countries = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        vc.score = 0
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        flagButtonStyle(button1)
        flagButtonStyle(button2)
        flagButtonStyle(button3)
        
        askQuestion()
    }
    
    func askQuestion() {
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
    }
}



private func flagButtonStyle(_ button: UIButton) {
    button.layer.borderWidth = 1
    button.layer.borderColor = UIColor.lightGray.cgColor
}
