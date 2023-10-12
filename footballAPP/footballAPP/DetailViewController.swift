import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var homeTeamLabel: UILabel!
    @IBOutlet weak var visitorTeamLabel: UILabel!
    
    @IBOutlet weak var scoreHomeLabel: UILabel!
    @IBOutlet weak var scoreVisitorLabel: UILabel!
    // Ajoutez une propriété pour stocker le jeu que vous souhaitez afficher
    var game: Games?
    var visitor: VisitorTeam?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Vérifiez si game est défini
        if let game = game {
           
            
            homeTeamLabel.text = game.home_team.full_name
            scoreHomeLabel.text = "\(game.scoreHome)"
            visitorTeamLabel.text = game.visitor_team.full_name
            
        }
    }
}
