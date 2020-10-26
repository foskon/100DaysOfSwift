import Foundation
import UIKit

class FlagViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    private var countries: [String]!
    private var correctAnswer = 0
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
        countries.shuffle()
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        correctAnswer = Int.random(in: 0...2)
        title = "Score: \(score ?? 0) - " + countries[correctAnswer].uppercased()
    }
    
    @IBAction func onTouchFlag(_ sender: UIButton) {
        let isRightAnswer = toFlagNumber(sender) == correctAnswer
        let title = isRightAnswer ? "Correct" : "Wrong"
        score = isRightAnswer ? score + 1 : score - 1
        
        let ac = UIAlertController(title: title, message: "Your score is \(score ?? 0).", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: { _ in
            self.askQuestion()
        }))
        present(ac, animated: true)
    }
    
    private func toFlagNumber(_ sender: UIButton) -> Int {
        if sender == button1 { return 0 }
        else if sender == button2 { return 1 }
        else { return 2 }
    }
}



private func flagButtonStyle(_ button: UIButton) {
    button.layer.borderWidth = 1
    button.layer.borderColor = UIColor.lightGray.cgColor
}
