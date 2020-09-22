import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet private weak var imageView: UIImageView!
    
    private var imageName: String!
    
    static func instantiate(imageName: String) -> DetailViewController {
        let vc: DetailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "DetailViewController")
        vc.imageName = imageName
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        title = imageName
        renderImage(imageName: imageName)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    private func renderImage(imageName: String) {
        if let image = UIImage(named: imageName) {
            imageView.image = image
        }
    }
}
