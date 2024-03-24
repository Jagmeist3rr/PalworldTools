//
//  File.swift
//  PalworldTools
//
//  Created by Javier Rendon on 3/14/24.
//

import Foundation
import SwiftUI

struct Pals: Hashable {
    var name: String
    var icon: Image
    var title: String
    var number: String
    var element: [String]
    var drops: [String]
    var food: Int
    var foodimage: [Image]
    var partnerSkill: String
    var partnerSkillDescription: String
    var worksuitabilty: [String: Int]
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(title)
        hasher.combine(number)
        hasher.combine(element)
        hasher.combine(drops)
        hasher.combine(food)
        hasher.combine(partnerSkill)
    }
}

extension Pals: Equatable {
    static func == (lhs: Pals, rhs: Pals) -> Bool {
        // Compare all properties to determine equality
        lhs.name == rhs.name &&
        lhs.icon == rhs.icon &&
        lhs.title == rhs.title &&
        lhs.number == rhs.number &&
        lhs.element == rhs.element &&
        lhs.drops == rhs.drops &&
        lhs.food == rhs.food &&
        lhs.foodimage == rhs.foodimage &&
        lhs.partnerSkill == rhs.partnerSkill
    }
}

class PalsWrapper: ObservableObject {
    @Published var pals: Pals
    
    init(pals: Pals) {
        self.pals = pals
    }
}

class PalsManager: ObservableObject{
    //Class where Pal information is good
    @Published var palsManager: [Pals]
    init(palsManager: [Pals]) {
        self.palsManager = palsManager
        
        var foodImages: [Image] = []
        for _ in 0..<2 { // Assuming `food` is always 2 as per your example
            foodImages.append(Image("Food_On")) // Replace "Food_On" with your actual food image name
        }
        
        self.palsManager = [
            Pals(name: "Lamball", icon: Image("Lamball"), title: "Big Floof", number: "#001", element: ["Neutral"], drops: ["Wool", "Lamball Mutton"], food: 2, foodimage: foodImages, partnerSkill: "Fluffy Shield", partnerSkillDescription: "When activated, equips to the player and becomes a shield. Sometimes drops Wool when assigned to Ranch.", worksuitabilty: ["Handiwork": 1, "Transporting": 1, "Farming": 1]),
            Pals(name: "Cattiva", icon: Image("Cattiva"), title: "The Cat's Pajamas", number: "#002", element: ["Neutral"], drops: ["Red Berries"], food: 2, foodimage: foodImages, partnerSkill: "Cat Helper", partnerSkillDescription: "While in team, Cattiva helps carry supplies, increasing the player's max carrying capacity.", worksuitabilty: ["Handiwork": 1,"Gathering":1,"Mining":1,"Transporting":1]),
            Pals(name: "Chikipi", icon: Image("Chikipi"), title: "Plumb & Juicy", number: "#003", element: ["Neutral"], drops: ["Egg", "Chikipi Poultry"], food: 1, foodimage: foodImages, partnerSkill: "Egg Layer", partnerSkillDescription: "Sometimes lays an Egg when assigned to Ranch.", worksuitabilty: ["Gathering": 1, "Farming":1]),
            Pals(name: "Lifmunk", icon: Image("Lifmunk"), title: "Coward of the Steppe", number: "#004", element: ["Grass"], drops: ["Berry Seeds", "Medical Supplies(L)"], food: 1, foodimage: foodImages, partnerSkill: "Lifmunk Recoil", partnerSkillDescription: "When activated, leaps into the player's head and uses a submachine gun to follows up player attacks.", worksuitabilty: ["Planting": 1, "Handiwork": 1,"Gathering":1,"Lumbering": 1, "Medicine Production": 1]),
            Pals(name: "Foxparks", icon: Image("Foxparks"), title: "Revealer of Paths", number: "#005", element: ["Fire"], drops: ["Leather", "Flame Organ"], food: 2, foodimage: foodImages, partnerSkill: "Huggy Fire", partnerSkillDescription: "When activated, leaps into the player's head and uses a submachine gun to follows up player attacks.", worksuitabilty: ["Kindling": 1]),
            Pals(name: "Fuack", icon: Image("Fuack"), title: "Rowdy Wave Ripper", number: "#006", element: ["Water"], drops: ["Leather", "Pal Fluids"], food: 2, foodimage: foodImages, partnerSkill: "Surfing Slam", partnerSkillDescription: "When activated, Fuack body surfs towards an enemy and slams into them.", worksuitabilty: ["Watering": 1, "Handiwork": 1, "Transporting": 1]),
            Pals(name: "Sparkit", icon: Image("Sparkit"), title: "Livewire Tabby", number: "#007", element: ["Electric"], drops: ["Electric Organ"], food: 2, foodimage: foodImages, partnerSkill: "Static Electricity", partnerSkillDescription: "While in team, increases attack power of Electric Pals", worksuitabilty: ["Generating Electricity": 1, "Handiwork": 1, "Transporting": 1]),
            Pals(name: "Tanzee", icon: Image("Tanzee"), title: "Dexterous Primate", number: "008#", element: ["Grass"], drops: ["Mushroom"], food: 2, foodimage: foodImages, partnerSkill: "Cheery Rifle", partnerSkillDescription: "When activated, Tanzee will mercilessly fire an assault rifle at nearby enemies.", worksuitabilty: ["Plating": 1, "Handiwork": 1, "Gathering": 1, "Transporting": 1]),
            Pals(name: "Rooby", icon: Image("Rooby"), title: "Chief of the Herd", number: "#009", element: ["Fire"], drops: ["Flame Organ", "Leather"], food: 2, foodimage: foodImages, partnerSkill: "Tiny Spark", partnerSkillDescription: "While in team, increases attach power of Fire Pals", worksuitabilty: ["Kindling": 1]),
            Pals(name: "Pengullet", icon: Image("Pengullet"), title: "Ate Too Much", number: "#010", element: ["Water", "Ice"], drops: ["Ice Organ", "Pal Fluids"], food: 2, foodimage: foodImages, partnerSkill: "Pengullet Cannon", partnerSkillDescription: "When activated, the player equips a Rocket Launcher and fires Pengullet as ammunition. Pengullet explodes on contact and is incapacitated.", worksuitabilty: ["Watering": 1, "Handiwork": 1, "Cooling": 1, "Transporting": 1]),
            Pals(name: "Penking", icon: Image("Penking"), title: "Pioneer of the Frozen Sea", number: "#011", element: ["Water", "Ice"], drops: ["Ice Organ", "Penking Plume"], food: 8, foodimage: foodImages, partnerSkill: "Brave Sailor", partnerSkillDescription: "When fighting together, Fire Pals drop more items when defeated", worksuitabilty: ["Water": 2, "Handiwork": 2, "Mining": 2, "Cooling": 2, "Transporting": 2]),
            Pals(name: "Jolthog", icon: Image("Jolthog"), title: "Don't Touch!", number: "012", element: ["Electric"], drops: ["Electric Orga"], food: 2, foodimage: foodImages, partnerSkill: "Jolt Bomb", partnerSkillDescription: "When activated, equips Jolthog to the player's hand. When thrown at an enemy, causes an electrical explosion upon impact.", worksuitabilty: ["Generating Electricity": 1]),
            Pals(name: "Gumoss", icon: Image("Gumoss"), title: "Suddenly Transformed", number: "#013", element: ["Grass", "Ground"], drops: ["Berry Seeds", "Gumoss Leaf"], food: 1, foodimage: foodImages, partnerSkill: "Logging Assistance", partnerSkillDescription: "While in team, improves efficiency of cuttinh trees", worksuitabilty: ["Planting": 1]),
            Pals(name: "Vixy", icon: Image("Vixy"), title: "Star of the Steppe", number: "#014", element: ["Neutral"], drops: ["Leather", "Bones"], food: 1, foodimage: foodImages, partnerSkill: "Dig Here!", partnerSkillDescription: "Sometimes digs up items from the ground when assigned to Ranch", worksuitabilty: ["Gathering": 1, "Farming": 1]),
            Pals(name: "Hoocrates", icon: Image("Hoocrates"), title: "Purveyor of Wisdom", number: "#015", element: ["Dark"], drops: ["Fiber", "High Grade Technical Manual"], food: 3, foodimage: foodImages, partnerSkill: "Dark Knowledge", partnerSkillDescription: "While in team, increases attack of Dark Pals", worksuitabilty: ["Gathering": 1]),
            Pals(name: "Teafant", icon: Image("Teafant"), title: "Adorable Watering Can", number: "#016", element: ["Water"], drops: ["Pal Fluids"], food: 2, foodimage: foodImages, partnerSkill: "Soothing Shower", partnerSkillDescription: "When activated, spouts mysterious water that soothes wounds and restores player's HP.", worksuitabilty: ["Watering": 1]),
            Pals(name: "Depresso", icon: Image("Depresso"), title: "Several Sleepless Nights Later", number: "#017", element: ["Dark"], drops: ["Venom Gland"], food: 2, foodimage: foodImages, partnerSkill: "Caffeine Inoculation", partnerSkillDescription: "When activated, Depresso drinks a massive amount of energy drinks, causing its movement speed to increase.", worksuitabilty: ["Handiwork": 1, "Mining": 1, "Transporting": 1]),
            Pals(name: "Cremis", icon: Image("Cremis"), title: "Darling Furball", number: "#018", element: ["Neutral"], drops: ["Wool"], food: 2, foodimage: foodImages, partnerSkill: "Fluffy Wool", partnerSkillDescription: "While in team, increases attack power of Neutral Pals. Sometimes drops Wool when assigned to Ranch.", worksuitabilty: ["Gathering": 1, "Farming": 1]),
            Pals(name: "Daedream", icon: Image("Daedream"), title: "Dream Eater", number: "#019", element: ["Dark"], drops: ["Venom Gland", "Small Pal Soul"], food: 3, foodimage: foodImages, partnerSkill: "Dream Chaser", partnerSkillDescription: "While in team, appears near the player. Follows up player attacks with magic bullets.", worksuitabilty: ["Handiwork": 1, "Gathering": 1, "Transporting": 1]),
            Pals(name: "Rushoar", icon: Image("Rushoar"), title: "Woodland Ruffian", number: "#020", element: ["Ground"], drops: ["Rushoar Pork", "Leather", "Bone"], food: 3, foodimage: foodImages, partnerSkill: "Hard Head", partnerSkillDescription: "Can be ridden. Increases efficiency of destroying boulders while mounted", worksuitabilty: ["Mining":1]),
            Pals(name: "Nox", icon: Image("Nox"), title: "Dusken Aristocrat", number: "#021", element: ["Dark"], drops: ["Leather", "Small Pal Soul"], food: 2, foodimage: foodImages, partnerSkill: "Kuudere", partnerSkillDescription: "When fighting together, applies Dark damage to the player's attacks.", worksuitabilty: ["Gathering": 1]),
            Pals(name: "Fuddler", icon: Image("Fuddler"), title: "Underground Explorer", number: "#022", element: ["Ground"], drops: ["Leather"], food: 2, foodimage: foodImages, partnerSkill: "Ore Dectector", partnerSkillDescription: "When activated, generates subtle vibrations to detect nearby ore", worksuitabilty: ["Handiwork": 1, "Mining": 1, "Transporting": 1]),
            Pals(name: "Killamari", icon: Image("Killamari"), title: "Emotionless", number: "#023", element: ["Dark"], drops: ["Venom Gland"], food: 3, foodimage: foodImages, partnerSkill: "Fried Squid", partnerSkillDescription: "While in team, can be summoned and used instead of a glider. Can float for long periods of time while gliding.", worksuitabilty: ["Gathering": 1,"Transporting": 2]),
            Pals(name: "Mau", icon: Image("Mau"), title: "Noble Glimmer", number: "#024", element: ["Dark"], drops: ["Gold Coin"], food: 1, foodimage: foodImages, partnerSkill: "Gold Digger", partnerSkillDescription: "Sometimes digs up Gold Coins when assigned to Ranch", worksuitabilty: ["Farming": 1]),
            Pals(name: "Celaray", icon: Image("Celaray"), title: "Soaring Skyfish", number: "#025", element: ["Water"], drops: ["Pal Fluids"], food: 3, foodimage: foodImages, partnerSkill: "Zephyr Glider", partnerSkillDescription: "While in team, can be summoned and used instead of a glider. Allows you to move quickly for long periods of time while gliding with this Pal.", worksuitabilty: ["Watering": 1, "Transporting": 1]),
            Pals(name: "Direhowl", icon: Image("Direhowl"), title: "Hunter of the Steppe", number: "#026", element: ["Neutral"], drops: ["Leather", "Ruby", "Gold Coin"], food: 3, foodimage: foodImages, partnerSkill: "Direhowl Rider", partnerSkillDescription: "Can be ridden. Moves slightly faster than most mounts.", worksuitabilty: ["Gathering": 1]),
            Pals(name: "Tocotoco", icon: Image("Tocotoco"), title: "Boom or Bust", number: "#027", element: ["Neutral"], drops: ["Gunpowder", "Toctoco Feather"], food: 2, foodimage: foodImages, partnerSkill: "Eggbomb Launcher", partnerSkillDescription: "When activated, equips to the player and transforms into an egg launcher.", worksuitabilty: ["Gathering": 1]),
            Pals(name: "Flopie", icon: Image("Flopie"), title: "Star of the Flower Beds", number: "#028", element: ["Grass"], drops: ["Medical Supplies(L)", "Wheat Seeds"], food: 3, foodimage: foodImages, partnerSkill: "Helper Bunny", partnerSkillDescription: "While in team, appears nearby the player. Automatically picks up nearby items.", worksuitabilty: ["Planting": 1, "Handiwork": 1, "Gathering": 1, "Medicine Production": 1, "Transporting": 1]),
            Pals(name: "Mozzarina", icon: Image("Mozzarina"), title: "Grade A Beef", number: "#029", element: ["Neutral"], drops: ["Mozzarina Meat", "Milk"], food: 3, foodimage: foodImages, partnerSkill: "Milk Maker", partnerSkillDescription: "Sometimes produces Milk when assigned to Ranch", worksuitabilty: ["Farming": 1]),
            Pals(name: "Bristla", icon: Image("Bristla"), title: "Thorny Rose", number: "#030", element: ["Grass"], drops: ["Wheat Seeds", "Lettuce Seeds"], food: 5, foodimage: foodImages, partnerSkill: "Princess Gaze", partnerSkillDescription: "When in team, increases attack power of Grass Pals", worksuitabilty: ["Planting":1,"Handiwork":1,"Gathering":1,"Medicine Production":2,"Transporting":1]),
            Pals(name: "Gobfin", icon: Image("Gobfin"), title: "Sea Thug", number: "#031", element: ["Water"], drops: ["Pal Fluids"], food: 3, foodimage: foodImages, partnerSkill: "Angry Shark", partnerSkillDescription: "When activated, attacks targeted enemy with a powerful Aqua Gun. While in team, increases player's attack power.", worksuitabilty: ["Watering":2,"Handiwork":1,"Transporting":1]),
            Pals(name: "Hangyu", icon: Image("Hangyu"), title: "Bringer of Luck", number: "#032", element: ["Ground"], drops: ["Fiber"], food: 2, foodimage: foodImages, partnerSkill: "Flying Trapeze", partnerSkillDescription: "While in team, can be summoned and be used instead of a glider. Carries the player up high while gliding.", worksuitabilty: ["Handiwork":1,"Gathering":1,"Transporting":2]),
            Pals(name: "Mossanda", icon: Image("Mossanda"), title: "Guardian of the Forest", number: "#033", element: ["Grass"], drops: ["Mushroom", "Leather", "Tomato Seeds"], food: 5, foodimage: foodImages, partnerSkill: "Grenadier Panda", partnerSkillDescription: "Can be ridden. Can rapidly fire a grenade launcher while mounted.", worksuitabilty: ["Planting":2,"Handiwork":2,"Lumbering":2,"Transporting":3]),
            Pals(name: "Woolipop", icon: Image("Woolipop"), title: "Giant Cotton Candy", number: "#034", element: ["Neutral"], drops: ["Cotton Candy", "High Quality Pal Oil"], food: 2, foodimage: foodImages, partnerSkill: "Candy Pop", partnerSkillDescription: "Sometimes drops Cotton Candy when assigned to Ranch.", worksuitabilty: ["Farming":1]),
            Pals(name: "Caprity", icon: Image("Caprity"), title: "Walking Farm", number: "#035", element: ["Grass"], drops: ["Caprity Meat", "Red Berries", "Horn"], food: 4, foodimage: foodImages, partnerSkill: "Berry Picker", partnerSkillDescription: "Sometimes drops Red Berries from its back when assigned to Ranch", worksuitabilty: ["Planting":2,"Farming":1]),
            Pals(name: "Melpaca", icon: Image("Melpaca"), title: "Pompous Shanks", number: "#036", element: ["Neutral"], drops: ["Leather", "Wool"], food: 3, foodimage: foodImages, partnerSkill: "Pacapaca Wool", partnerSkillDescription: "Can be ridden. Sometimes drops Wool when assigned to Ranch.", worksuitabilty: ["Farming":1]),
            Pals(name: "Eikthyrdeer", icon: Image("Eikthyrdeer"), title: "Protector of the Herd", number: "#037", element: ["Neutral"], drops: ["Leather", "Horn","Eikthyrdeer Venison"], food: 5, foodimage: foodImages, partnerSkill: "Guardian of the Forest", partnerSkillDescription: "Can be ridden. Can perform a double jump while mounted. Increases efficiency of cutting trees.", worksuitabilty: ["Lumbering":2]),
            Pals(name: "Nitewing", icon: Image("Nitewing"), title: "Wings of the Firmament", number: "#038", element: ["Neutral"], drops: ["Leather"], food: 7, foodimage: foodImages, partnerSkill: "Travel Companion", partnerSkillDescription: "Can be ridden as a flying mount.", worksuitabilty: ["Gathering":2]),
            Pals(name: "Ribbunny", icon: Image("Ribbunny"), title: "Heart-melting Smile", number: "#039", element: ["Neutral"], drops: ["Leather", "Beautiful Flower"], food: 2, foodimage: foodImages, partnerSkill: "Skilled Fingers", partnerSkillDescription: "While in team, increases attack power of Neutral Pals. While at base, increases work efficiency if working at Weapon Workbench.", worksuitabilty: ["Handiwork":1,"Gathering":1,"Transporting":1]),
            Pals(name: "Incineram", icon: Image("Incineram"), title: "Hyena of the Wild", number: "#040", element: ["Fire", "Dark"], drops: ["Horn", "Leather"], food: 4, foodimage: foodImages, partnerSkill: "Flameclaw Hunter", partnerSkillDescription: "When activated, attacks targeted enemy with a powerful Hellfire Claw.", worksuitabilty: ["Kindling":1,"Handiwork":2,"Mining":1,"Transporting":2]),
            Pals(name: "Cinnamoth", icon: Image("Cinnamoth"), title: "Butterfly Promenade", number: "#041", element: ["Grass"], drops: ["Honey", "Lettuce Seeds", "Wheat Seeds"], food: 3, foodimage: foodImages, partnerSkill: "Mysterious Scales", partnerSkillDescription: "When activated, attacks target enemy with Poison Fog.", worksuitabilty: ["Planting":2,"Medicine Production":1]),
            Pals(name: "Arsox", icon: Image("Arsox"), title: "Blazing Brute", number: "#042", element: ["Fire"], drops: ["Horn","Flame Organ"], food: 5, foodimage: foodImages, partnerSkill: "Warm Body", partnerSkillDescription: "Can be ridden. Keeps the rider warm in cold environments.", worksuitabilty: ["Kindling":2,"Lumbering":1]),
            Pals(name: "Dumud", icon: Image("Dumud"), title: "Perpetual Procrastinator", number: "#043", element: ["Ground"], drops: ["Raaw Dumud","High Quality Pal Oil"], food: 4, foodimage: foodImages, partnerSkill: "Soil Improver", partnerSkillDescription: "While in team, increases attack power of Ground Pals.", worksuitabilty: ["Watering":1,"Mining":2,"Transporting":1]),
            Pals(name: "Cawgnito", icon: Image("Cawgnito"), title: "Shawdow-cloaked Schemer", number: "#044", element: ["Dark"], drops: ["Bone","Venom Gland","Small Pal Soul"], food: 5, foodimage: foodImages, partnerSkill: "Telepeck", partnerSkillDescription: "When activated, attacks targeted enemy with a powerful Phantem Peck.", worksuitabilty: ["Lumbering":1]),
            Pals(name: "Leezpunk", icon: Image("Leezpunk"), title: "Self-proclaimed Genius", number: "#045", element: ["Dark"], drops: ["Copper Key","Silver Key"], food: 3, foodimage: foodImages, partnerSkill: "Sixth Sense", partnerSkillDescription: "When activated, utilizes its sixth sense to detect nearby dungeons.", worksuitabilty: ["Handiwork":1,"Gathering":1,"Transporting":1]),
            Pals(name: "Loupmoon", icon: Image("Loupmoon"), title: "Enraptured by Moonlight", number: "#046", element: ["Dark"], drops: ["Bone"], food: 5, foodimage: foodImages, partnerSkill: "Claws Glistening in the Dark", partnerSkillDescription: "When activated, attacks targeted enemy with a powerful Jumping Claw.", worksuitabilty: ["Handiwork":2]),
            Pals(name: "Galeclaw", icon: Image("Galeclaw"), title: "Proud Courier", number: "#047", element: ["Neutral"], drops: ["Galeclaw Poultry", "Leather"], food: 4, foodimage:foodImages, partnerSkill: "Glawclaw Rider", partnerSkillDescription: "While in team, can be summoned and used instead of a glider. Allows you to fire a gun while gliding with this Pal.", worksuitabilty: ["Gathering":2]),
            Pals(name: "Robinquill", icon: Image("Robinquill"), title: "Archer of the Forest", number: "#048", element: ["Grass"], drops: ["Wheat Seeds", "Arrow"], food: 3, foodimage: foodImages, partnerSkill: "Hawk Eye", partnerSkillDescription: "While fighting together, allows you to deal more damage to weak points", worksuitabilty: ["Planting":1,"Handiwork":2,"Gathering":2,"Lumbering":1,"Medicine Production":1,"Transporting":2]),
            Pals(name: "Gorirat", icon: Image("Gorirat"), title: "Jungle Punk", number: "#049", element: ["Neutral"], drops: ["Leather","Bone"], food: 3, foodimage: foodImages, partnerSkill: "Full-power Gorilla Mode", partnerSkillDescription: "When activated, unleashes a primal fury that increases Gorirat's attack power.", worksuitabilty: ["Handiwork":1,"Lumbering":2,"Transporting":3]),
            Pals(name: "Beegarde", icon: Image("Beegarde"), title: "Guardian Commander", number: "#050", element: ["Grass"], drops: ["Honey"], food: 3, foodimage: foodImages, partnerSkill: "Worker Bee", partnerSkillDescription: "Sometimes drops Honey when assigned to Ranch. While in team, Elizabee's stats will be increased.", worksuitabilty: ["Planting":1,"Handiwork":1,"Gathering":1,"Lumbering":1,"Medicine Production":1,"Transporting":2,"Farming":1]),
            Pals(name: "Elizabee", icon: Image("Elizabee"), title: "Empress of the Hive", number: "#051", element: ["Grass"], drops: ["Honey","Elizabee's Staff"], food: 7, foodimage: foodImages, partnerSkill: "Queen Bee Command", partnerSkillDescription: "While fighting together, stats will increase the more Beegarde are in your team.", worksuitabilty: ["Planting":2,"Handiwork":2,"Lumbering":1,"Medicine Production":2, "Gathering":2]),
            Pals(name: "Grintale", icon: Image("Grintale"), title: "Marshmellow", number: "#052", element: ["Neutral"], drops: ["High Quality Pal Oil"], food: 4, foodimage: foodImages, partnerSkill: "Plump Body", partnerSkillDescription: "Can be ridden. Enhances Neutral attacks while mounted.", worksuitabilty: ["Gathering":2]),
            Pals(name: "Swee", icon: Image("Swee"), title: "Curious Floof", number: "#053", element: ["Ice"], drops: ["Wool"], food: 2, foodimage: foodImages, partnerSkill: "Fluffy", partnerSkillDescription: "While in team, Sweepa's stats will be increased", worksuitabilty: ["Gathering":1,"Cooling":1]),
            Pals(name: "Sweepa", icon: Image("Sweepa"), title: "Majesty of Fuzz", number: "#054", element: ["Ice"], drops: ["Wool"], food: 3, foodimage: foodImages, partnerSkill: "King of Fluff", partnerSkillDescription: "While fighting together, stats will increase the more Swee are in your team.", worksuitabilty: ["Gathering":2,"Cooling":2]),
            Pals(name: "Chillet", icon: Image("Chillet"), title: "Dance of the Plains", number: "#055", element: ["Ice","Dragon"], drops: ["Leather"], food: 3, foodimage: foodImages, partnerSkill: "Wriggling Weasel", partnerSkillDescription: "Can be ridden. Applies Dragon damage to the player's attack while mounted.", worksuitabilty: ["Gathering":1,"Cooling":1]),
            Pals(name: "Univolt", icon: Image("Univolt"), title: "Swift Deity", number: "#056", element: ["Electic"], drops: ["Leather","Electric Organ","Horn","Horn"], food: 5, foodimage: foodImages, partnerSkill: "Swift Deity", partnerSkillDescription: "Can be ridden. Applies Electric damage to the player's attacks while mounted.", worksuitabilty: ["Generating Electricity":2,"Lumbering":1]),
            Pals(name: "Foxicle", icon: Image("Foxicle"), title: "Claws of Ice", number: "#057", element: ["Ice"], drops: ["Leather","Ice Organ"], food: 3, foodimage: foodImages, partnerSkill: "Aurorau Guide", partnerSkillDescription: "While in a team, increases attack power of Ice pals.", worksuitabilty: ["Cooling":2]),
            Pals(name: "Pyrin", icon: Image("Pyrin"), title: "Steed of Flames", number: "#058", element: ["Fire"], drops: ["Flame Organ","Leather"], food: 5, foodimage: foodImages, partnerSkill: "Red Hare", partnerSkillDescription: "Can be ridden. Applies Fire damage to the player's attacks while mounted", worksuitabilty: ["Kindling":2,"Lumbering":1]),
            Pals(name: "Reindrix", icon: Image("Reindrix"), title: "Beast of Blizzards", number: "#059", element: ["Ice"], drops: ["Reindrix Venison","Leather","Horn","Ice Organ"], food: 7, foodimage: foodImages, partnerSkill: "Cool Body", partnerSkillDescription: "Can be ridden. Keeps the rider cool in hot tempratures.", worksuitabilty: ["Lumbering":2,"Cooling":2]),
            Pals(name: "Rayhound", icon: Image("Rayhound"), title: "Electro-charged Zoomies", number: "#060", element: ["Electric"], drops: ["Electric Organ"], food: 5, foodimage: foodImages, partnerSkill: "Jumping Force", partnerSkillDescription: "Can be ridden. Can double jump while mounted.", worksuitabilty: ["Generating Electricity":2]),
            Pals(name: "Kitsun", icon: Image("Kitsun"), title: "Guardain of the Azure Flame", number: "#061", element: ["Fire"], drops: ["Flame Organ","Leather"], food: 4, foodimage: foodImages, partnerSkill: "Clear Mind", partnerSkillDescription: "Can be ridden. Unaffected by the cold or heat while riding this Pal.", worksuitabilty: ["Kindling":2]),
            Pals(name: "Dazzi", icon: Image("Dazzi"), title: "Born of the Storm", number: "#062", element: ["Electric"], drops: ["Electric Organ"], food: 2, foodimage: foodImages, partnerSkill: "Lady of Lightning", partnerSkillDescription: "While in team, appears near the player. Follows up player attacks while lightning bolts.", worksuitabilty: ["Generating Electricity":1,"Handiwork":1,"Transporting":1]),
            Pals(name: "Lunaris", icon: Image("Lunaris"), title: "Extraterrestrial", number: "#063", element: ["Neutral"], drops: ["Paldium Fragment"], food: 2, foodimage: foodImages, partnerSkill: "Antigravity", partnerSkillDescription: "While in team, Lunaris manipulates gravity, increasing the player's max carrying capacity.", worksuitabilty: ["Handiwork":3, "Gathering":1,"Transporting":1]),
            Pals(name: "Dinossom", icon: Image("Dinossom"), title: "Guardian of Blossoming Gardens", number: "#064", element: ["Grass","Dragon"], drops: ["Wheat Seeds"], food: 6, foodimage: foodImages, partnerSkill: "Fragrant Dragon", partnerSkillDescription: "Can be ridden. Enhances Grass attacks while mounted.", worksuitabilty: ["Planting":2,"Lumbering":2]),
            Pals(name: "Surfent", icon: Image("Surfent"), title: "The Ocean's Wrath", number: "#065", element: ["Water"], drops: ["Pal Fluids"], food: 5, foodimage: foodImages, partnerSkill: "Swift Swimmer", partnerSkillDescription: "Can be ridden to travel on water. While mounted, prevents stamin depletion while moving over the water.", worksuitabilty: ["Watering":2]),
            Pals(name: "Maraith", icon: Image("Maraith"), title: "Messenger of Death", number: "#066", element: ["Dark"], drops: ["Bone","Small Pal Soul"], food: 3, foodimage: foodImages, partnerSkill: "Messenger of Death", partnerSkillDescription: "Can be ridden. Applies Dark damage to the player's attacks while mounted.", worksuitabilty: ["Gathering":2,"Mining":1]),
            Pals(name: "Digtoise", icon: Image("Digtoise"), title: "Drilling Machine", number: "#067", element: ["Ground"], drops: ["Ore","High Quality Pal Oil"], food: 5, foodimage: foodImages, partnerSkill: "Drill Crusher", partnerSkillDescription: "When activated, performs Shell Spin, follows the player while spinning, and mines ores efficiently.", worksuitabilty: ["Mining":3]),
            Pals(name: "Tombat", icon: Image("Tombat"), title: "Trickster", number: "#068", element: ["Dark"], drops: ["Leather","Small Pal Soul"], food: 5, foodimage: foodImages, partnerSkill: "Ultrasonic Sensor", partnerSkillDescription: "When activated, uses ultrasonic waves to detect the location of nearby Pals.", worksuitabilty: ["Gathering":2,"Mining":2,"Transporting":2]),
            Pals(name: "Lovander", icon: Image("Lovander"), title: "Pal on the Prowl", number: "#069", element: ["Neutral"], drops: ["Mushroom","Cake","Suspicious Juice","Strange Juice","Memory Wiping Machine"], food: 5, foodimage: foodImages, partnerSkill: "Heart Drain", partnerSkillDescription: "While fighting together, grants the player and Lovander the life steal effect which absorbs some of the received damage and restores HP.", worksuitabilty: ["Handiwork":2,"Mining":1,"Medicine Production":2,"Transporting":2]),
            Pals(name: "Flambelle", icon: Image("Flambelle"), title: "Molten Daughter", number: "#070", element: ["Fire"], drops: ["Flame Organ","High Quality Pal Oil"], food: 2, foodimage: foodImages, partnerSkill: "Magma Tears", partnerSkillDescription: "Sometimes produces Flame Organ when assigned to the Ranch.", worksuitabilty: ["Kindling":1,"Handiwork":1,"Transporting":1,"Farming":1]),
            Pals(name: "Vanwyrm", icon: Image("Vanwyrm"), title: "Aerial Marauder", number: "#071", element: ["Fire","Dark"], drops: ["Bone","Ruby","Gold Coin"], food: 6, foodimage: foodImages, partnerSkill: "Aerial Marauder", partnerSkillDescription: "Can be ridden as a flying mount. Increases damage player deals to enemy weak points while mounted.", worksuitabilty: ["Kindling":1,"Transporting":3]),
            Pals(name: "Bushi", icon: Image("Bushi"), title: "Vagrant Warrior", number: "#072", element: ["Fire"], drops: ["Bone","Ingot"], food: 4, foodimage: foodImages, partnerSkill: "Brandish Blade", partnerSkillDescription: "When activated, attacks targeted enemy with a powerful Iaigiri.", worksuitabilty: ["Kindling":2,"Handiwork":1,"Gathering":1,"Lumbering":3,"Transporting":2]),
            Pals(name: "Beakon", icon: Image("Beakon"), title: "Wings of Thunder", number: "#073", element: ["Electric"], drops: ["Eletric Organ"], food: 7, foodimage: foodImages, partnerSkill: "Thunderous", partnerSkillDescription: "Can be ridden as a flying mount. Applies Electric damage to the player's attacks while mounted.", worksuitabilty: ["Generating Electricity":2,"Gathering":1,"Transporting":3]),
            Pals(name: "Ragnahawk", icon: Image("Beakon"), title: "Wings of Inferno", number: "#074", element: ["Fire"], drops: ["Flame Organ"], food: 7, foodimage: foodImages, partnerSkill: "Flame Wing", partnerSkillDescription: "Can be ridden as a flying mount. Applies Fire damage to the player's attacks while mounted.", worksuitabilty: ["Kindling":3,"Transporting":3]),
            Pals(name: "Katress", icon: Image("Katress"), title: "Phantasmal Feline", number: "#075", element: ["Dark"], drops: ["Leather","Katress Hair","High Grade Technical Manual"], food: 5, foodimage: foodImages, partnerSkill: "Grimoire Collector", partnerSkillDescription: "While fighting together, Neutral Pals drop more items when defeated.", worksuitabilty: ["Handiwork":2,"Medicine Production":2,"Transporting":2]),
            Pals(name: "Wixen", icon: Image("Wixen"), title: "Fire Licked Furball", number: "#076", element: ["Fire"], drops: ["Flame Organ","High Grade Technial Manual"], food: 5, foodimage: foodImages, partnerSkill: "Lord Fox", partnerSkillDescription: "When fighting together, applies Fire damage to the player's attacks.", worksuitabilty: ["Kindling":2,"Handiwork":3,"Transporting":2]),
            Pals(name: "Verdash", icon: Image("Verdash"), title: "Gale of the Forest", number: "#077", element: ["Grass"], drops: ["Leather","Bones"], food: 3, foodimage: foodImages, partnerSkill: "Grassland Speedster", partnerSkillDescription: "When fighting together, increases player's movement speed and applies Grass damage to the player's attacks", worksuitabilty: ["Planting":2,"Handiwork":3,"Gathering":3,"Lumbering":2,"Transporting":2]),
            Pals(name: "Vaelet", icon: Image("Vaelet"), title: "Voice of the Violets", number: "#078", element: ["Grass"], drops: ["Medical Supplies(L)","Tomato Seeds"], food: 3, foodimage: foodImages, partnerSkill: "Purification of Gaia", partnerSkillDescription: "While fighting together, Ground Pals drop more items when defeated", worksuitabilty: ["Planting":2,"Handiwork":2,"Gathering":2,"Medicine Production":3,"Transporting":1]),
            Pals(name: "Sibelyx", icon: Image("Sibelyx"), title: "Pallid Lady", number: "#079", element: ["Ice"], drops: ["High Quality Cloth","Ice Organ"], food: 5, foodimage: foodImages, partnerSkill: "Silk Maker", partnerSkillDescription: "When activated, attacks targeted enemy with a powerful Blizzard Spike. Sometimes produces High Quality Cloth when assigned to Ranch", worksuitabilty: ["Medicine Production":2, "Cooling":2,"Farming":1]),
            Pals(name: "Elphidran", icon: Image("Elphidran"), title: "Gentle Sky Dragon", number: "#080", element: ["Dragon"], drops: ["High Quality Pal Oil"], food: 6, foodimage: foodImages, partnerSkill: "Amicable Holy Dragon", partnerSkillDescription: " Can be ridden as a flying mount. While fighting together, Dark Pals drop more items when defeated", worksuitabilty: ["Lumbering":2]),
            Pals(name: "Kelpsea", icon: Image("Kelpsea"), title: "Child of the Deep", number: "#081", element: ["Water"], drops: ["Raw Kelpsea","Pal Fluids"], food: 1, foodimage: foodImages, partnerSkill: "Aqua Spout", partnerSkillDescription: "While in team, increases attack power of Water Pals.", worksuitabilty: ["Watering":1]),
            Pals(name: "Azurobe", icon: Image("Azurobe"), title: "Lady of the Lake", number: "#082", element: ["Water","Dragon"], drops: ["Cloth","Precious Dragon Stone"], food: 6, foodimage: foodImages, partnerSkill: "Watering Dance", partnerSkillDescription: "Can be ridden to travel on water. Applies Water damage to the player's attacks while mounted.", worksuitabilty: ["Watering":3]),
            Pals(name: "Cyrolinx", icon: Image("Cyrolinx"), title: "Predator of Snow", number: "#083", element: ["Ice"], drops: ["Ice Organ"], food: 7, foodimage: foodImages, partnerSkill: "Dragon Hunter", partnerSkillDescription: "While fighting together, Dragon Pals drop more items when defeated.", worksuitabilty: ["Handiwork":1,"Lumbering":2,"Cooling":3]),
            Pals(name: "Blazehowl", icon: Image("Blazehowl"), title: "Crimson Goliath", number: "#084", element: ["Fire"], drops: ["Flame Organ"], food: 7, foodimage: foodImages, partnerSkill: "Hellflame Lion", partnerSkillDescription: "Can be ridden. While fighting together, Grass Pals drop more items when defeated.", worksuitabilty: ["Kindling":3,"Lumbering":2]),
            Pals(name: "Relaxaurus", icon: Image("Relaxaurus"), title: "Gluttonous Dragon", number: "#085", element: ["Dragon","Water"], drops: ["High Quality Pal Oil","Ruby"], food: 7, foodimage: foodImages, partnerSkill: "Hungry Missle", partnerSkillDescription: "Can be ridden. Can rapidly fire a missile launcher while mounted", worksuitabilty: ["Watering":2,"Transporting":1]),
            Pals(name: "Broncherry", icon: Image("Broncherry"), title: "Winds of Spring", number: "#086", element: ["Grass"], drops: ["Broncherry Meat","Tomato Seeds"], food: 7, foodimage: foodImages, partnerSkill: "Overaffectionate", partnerSkillDescription: "Can be ridden. While in team, Broncherry helps carry supplies, increasing the player's max carrying capacity", worksuitabilty: ["Planting":3]),
            Pals(name: "Petallia", icon: Image("Petallia"), title: "Lady of the Garden", number: "#087", element: ["Grass"], drops: ["Beautiful Flower"], food: 3, foodimage: foodImages, partnerSkill: "Blessing of the Flower Spirit", partnerSkillDescription: "When activated, uses medicinal flowers to restore the player's HP.", worksuitabilty: ["Planting":3,"Handiwork":2,"Gathering":2,"Medicine Production":2,"Transporting":1]),
            Pals(name: "Reptyro", icon: Image("Reptyro"), title: "Magma-born Juggernaut", number: "#088", element: ["Fire","Ground"], drops: ["Flame Organ"], food: 5, foodimage: foodImages, partnerSkill: "Ore-loving Beast", partnerSkillDescription: "Can be ridden. Improves efficiency of mining ores while mounted.", worksuitabilty: ["Kindling":3,"Mining":3]),
            Pals(name: "Kingpaca", icon: Image("Kingpaca"), title: "Supreme Fluff Commander", number: "#089", element: ["Neutral"], drops: ["Wool"], food: 7, foodimage: foodImages, partnerSkill: "King of Muscles", partnerSkillDescription: "Can be ridden. While in team, Kingpaca helps carry supplies, increasing the player's max carrying capacity.", worksuitabilty: ["Gathering":1]),
            Pals(name: "Mammorest", icon: Image("Mammorest"), title: "King of the Forest", number: "#090", element: ["Grass"], drops: ["High Quality Pal Oil","Leather","Mammorest Meat"], food: 8, foodimage: foodImages, partnerSkill: "Gaia Crusher", partnerSkillDescription: "Can be ridden. Improves efficiency of cutting trees and mining ores while mounted.", worksuitabilty: ["Planting":2,"Lumbering":2,"Mining":2]),
            Pals(name: "Wumpo", icon: Image("Wumpo"), title: "Guardian of the Snowy Mountain", number: "#091", element: ["Ice"], drops: ["Ice Organ","Beautiful Flower"], food: 8, foodimage: foodImages, partnerSkill: "Guardain of the Snowy Mountain", partnerSkillDescription: "Can be ridden. While in team, Wumpo helps carry supplies, increasing the player's max carrying capacity.", worksuitabilty: ["Handiwork":2,"Lumbering":3,"Cooling":2,"Transporting":4]),
            Pals(name: "Warsect", icon: Image("Warsect"), title: "Unyielding Colossus", number: "#092", element: ["Ground","Grass"], drops: ["Honey"], food: 6, foodimage: foodImages, partnerSkill: "Hard Armor", partnerSkillDescription: "When fighting together, increases player's defense and applies Fire damage to the player's attacks.", worksuitabilty: ["Planting":1,"Handiwork":1,"Lumbering":3,"Transporting":3]),
            Pals(name: "Fenglope", icon: Image("Fenglope"), title: "Drifting Cloud", number: "#093", element: ["Neutral"], drops: ["Leather","Hirn"], food: 6, foodimage: foodImages, partnerSkill: "Wind and Clouds", partnerSkillDescription: "Can be ridden. Can double jump while mounted.", worksuitabilty: ["Lumbering":2]),
            Pals(name: "Felbat", icon: Image("Felbat"), title: "Gloom-shrouded Bloodsucker", number: "#094", element: ["Dark"], drops: ["Cloth","Small Pal Soul"], food: 5, foodimage: foodImages, partnerSkill: "Life Steal", partnerSkillDescription: "While fighting together, grants the player and Felbat the life steal effect which absorbs some of the received damage and restores HP.", worksuitabilty: ["Medicine Production":3]),
            Pals(name: "Quivern", icon: Image("Quivern"), title: "Wings of White", number: "#095", element: ["Dragon"], drops: ["High Quality Pal Oil"], food: 4, foodimage: foodImages, partnerSkill: "Sky Dragon's Affection", partnerSkillDescription: "Can be ridden as a flying mount. Enhances Dragon attacks while mounted.", worksuitabilty: ["Handiwork":1,"Gathering":2,"Mining":2,"Transporting":3]),
            Pals(name: "Blazamut", icon: Image("Blazamut"), title: "Cursed Tyrant", number: "#096", element: ["Fire"], drops: ["Coal","Flame Organ"], food: 8, foodimage: foodImages, partnerSkill: "Maga Kaiser", partnerSkillDescription: "Can be ridden. Enhances Fire attacks while mounted.", worksuitabilty: ["Kindling":3,"Mining":4]),
            Pals(name: "Helzephyr", icon: Image("Helzephyr"), title: "Wings of Death", number: "#097", element: ["Dark"], drops: ["Venom Gland","Medium Pal Soul"], food: 8, foodimage: foodImages, partnerSkill: "Wings of Death", partnerSkillDescription: "Can be ridden as a flying mount. Applies Dark damage to the player's attacks while mounted.", worksuitabilty: ["Transporting":3]),
            Pals(name: "Astegon", icon: Image("Astegon"), title: "Ravager of Stars", number: "#098", element: ["Dragon","Dark"], drops: ["Pal Metal Ingot","Pure Quartz"], food: 9, foodimage: foodImages, partnerSkill: "Black Ankylosaur", partnerSkillDescription: "Can be ridden a flying mount. Increases damage dealt to ore while mounted.", worksuitabilty: ["Handiwork":1,"Mining":4]),
            Pals(name: "Menasting", icon: Image("Menasting"), title: "Unstoppable Stinger", number: "#099", element: ["Dark","Ground"], drops: ["Coal","Venom Gland"], food: 7, foodimage: foodImages, partnerSkill: "Steel Scorpion", partnerSkillDescription: "When fighting together, increases the player's defense and Electric Pals drop more items when defeated", worksuitabilty: ["Lumering":2,"Mining":3]),
            Pals(name: "Anubis", icon: Image("Anubis"), title: "Guardian of the Dark Sun", number: "#100", element: ["Ground"], drops: ["Bone","Large Pal Soul","Innovative Technical Manual"], food: 6, foodimage: foodImages, partnerSkill: "Guardian of the Desert", partnerSkillDescription: "When fighting together, applies Ground damage to the player's attacks. Sometimes dodges attacks with a high speed sidestep while in a battle.", worksuitabilty: ["Handiwork":4,"Mining":3,"Transporting":2]),
            Pals(name: "Jormuntide", icon: Image("Jormuntide"), title: "Emperor of the Sea", number: "#101", element: ["Dragon","Water"], drops: ["Pal Fluids"], food: 7, foodimage: foodImages, partnerSkill: "Stormbringer Sea Dragon", partnerSkillDescription: "Can be ridden to travel on water. While mounted, prevents stamina depletion while moving over water.", worksuitabilty: ["Watering":4]),
            Pals(name: "Suzaku", icon: Image("Suzaku"), title: "Ruler of the Crimson Dawn", number: "#102", element: ["Fire"], drops: ["Flame Organ"], food: 8, foodimage: foodImages, partnerSkill: "Wings of Flame", partnerSkillDescription: "Can be ridden as a flying mount. Enhances Fire attacks while mounted.", worksuitabilty: ["Kindling":3]),
            Pals(name: "Grizzbolt", icon: Image("Grizzbolt"), title: "Claws of Lightning", number: "#103", element: ["Electric"], drops: ["Leather","Electric Organ"], food: 7, foodimage: foodImages, partnerSkill: "Yellow Tank", partnerSkillDescription: "Can be ridden. Can rapidly fire a minigun while mounted.", worksuitabilty: ["Generating Electricity":3,"Handiwork":2,"Lumbering":2]),
            Pals(name: "Lyleen", icon: Image("Lyleen"), title: "Lily Empress", number: "#104", element: ["Grass"], drops: ["Medical Supplies(l)","Beautiful Flower","Innovative Techincal Manual"], food: 6, foodimage: foodImages, partnerSkill: "Harvest Goddess", partnerSkillDescription: "When activated, the queen's soothing graces greatly restore the player's HP.", worksuitabilty: ["Planting":4,"Handiwork":3,"Gathering":2,"Medicine Production":3]),
            Pals(name: "Faleris", icon: Image("Faleris"), title: "Sential of Dawn", number: "#105", element: ["Fire"], drops: ["Flame Organ"], food: 8, foodimage: foodImages, partnerSkill: "Scorching Predator", partnerSkillDescription: "Can be ridden as a flying mount. While fighting together, Ice Pals drop more items when defeated.", worksuitabilty: ["Kindling":3,"Transporting":3]),
            Pals(name: "Orserk", icon: Image("Orserk"), title: "Roaring Thunder", number: "#106", element: ["Dragon","Electric"], drops: ["Electric Organ"], food: 7, foodimage: foodImages, partnerSkill: "Ferocious Thunder Dragon", partnerSkillDescription: "While fighting together, Water Pals drop more items when defeated.", worksuitabilty: ["Generating Electricity":4,"Handiwork":2,"Transporting":3]),
            Pals(name: "Shadowbeak", icon: Image("Shadowbeak"), title: "Unknown Life Form", number: "#107", element: ["Dark"], drops: ["Pal Metal Ingot","Carbon Fiber","Innovative Technical Mannual"], food: 8, foodimage: foodImages, partnerSkill: "Modified DNA", partnerSkillDescription: "Can be ridden as a flying mount. Enhances Dark attacks while mounted.", worksuitabilty: ["Gathering":1]),
            Pals(name: "Paladius", icon: Image("Paladius"), title: "Holy Knight of Legend", number: "#108", element: ["Neutral"], drops: ["Pal Metal Ingot","Diamon"], food: 9, foodimage: foodImages, partnerSkill: "Holy Knight of the Firmament", partnerSkillDescription: "Can be ridden. Can triple jump while mounted.", worksuitabilty: ["Lumbering":2,"Mining":2]),
            Pals(name: "Necromus", icon: Image("Necromus"), title: "Dark Knight of Legend", number: "#109", element: ["Dark"], drops: ["Pal Metal Ingot","Large Pal Soul"], food: 9, foodimage: foodImages, partnerSkill: "Dark Knight of the Abyss", partnerSkillDescription: "Can be ridden. Can double jump while mounted.", worksuitabilty: ["Lumbering":2,"Mining":2]),
            Pals(name: "Frostallion", icon: Image("Frostallion"), title: "Legendary Steed of Ice", number: "#110", element: ["Ice"], drops: ["Ice Organ","Diamond"], food: 7, foodimage: foodImages, partnerSkill: "Ice Steed", partnerSkillDescription: "Can be ridden as a flying mount. Changes the player's attack type to Ice and enhances Ice attacks while mounted.", worksuitabilty: ["Cooling":4]),
            Pals(name: "Jetragon", icon: Image("Jetragon"), title: "Legendary Celestial Dragon", number: "#111", element: ["Dragon"], drops: ["Pure Quartz","Polymer","Carbon Fiber","Diamond"], food: 9, foodimage: foodImages, partnerSkill: "Aerial Missle", partnerSkillDescription: "Can be ridden as a flying mount. Can rapidly fire a missile launcher while mounted.", worksuitabilty: ["Gathering":3])
            ]
    }
    /*need to get images for the ones below
    Rushoar, Nox, Fuddler, Killamari, Mau, Celaray, Direhowl,Tocotoco,Flopie,Mozzarina, Bristla,
     Gobfin, Hangyu,Mossanda,Woolipop,Caprity,Melpaca,Eikthyrdeer,Nitewing,Ribbunny,Incineram,
     Cinnamoth, Arsox,Dumud,Cawgnito, Leezpunk, Loupmoon,Galeclaw,Robinquill,Gorirat,Beegarde,
     Elizabee,Grintale,Swee,Sweepa,Chillet,Univolt,Foxicle,Pyrin,Reindrix,Rayhound,Kitsun,
     Dazzi,Lunaris,Dinossom,Surfent,Maraith,Digtoise,Tombat,Lovander,Flambelle,Vanwyrm,
     Bushi,Beakon,Beakon,Ragnahawk,Katress,Wixen,Verdash,Vaelet,Sibelyx,Elphidran,
     Kelpsea,Azurobe,Cyrolinx,Blazehowl,Relaxaurus,Broncherry,Petallia,Reptyro,Kingpaca,
     Mammorest,Wumpo,Warsect,Fenglope,Felbat,Quivern,Blazamut,Helzephyr,Astegon,Menasting,
     Anubis,Jormuntide,Suzaku,Grizzbolt,Lyleen,Faleris,Orserk,Shadowbeak,Paladius,Necromus,
     Frostallion,Jetragon
     
     
     
     Rushoar Pork,Mozzarina Meat,Milk,Fiber,Cotton Candy,Caprity Meat, Eikthyrdeer Venison,
     Beautiful Flower, Honey,Raw Dumud, Copper Key, Silver Key, Galeclaw Poultry,Arrow,
     Elizabee's Staf,Reindrix Venison,Cake,Suspicious Juice, Strange Juice,Memory Wiping Machine,
     High Grade Technical Manual,Raw Kelpsea,Broncherry Meat,Mammorest Meat,Innovative Technical Manual
     */
    func elementIcons(element: String) -> Image{
        switch element{
            //Displays icon for images
        case "Neutral":
            return Image("\(element)_icon")
        case "Dark":
            return Image("\(element)_icon")
        case "Electric":
            return Image("\(element)_icon")
        case "Fire":
            return Image("\(element)_icon")
        case "Grass":
            return Image("\(element)_icon")
        case "Ground":
            return Image("\(element)_icon")
        case "Ice":
            return Image("\(element)_icon")
        case "Water":
            return Image("\(element)_icon")
        case "Dragon":
            return Image("\(element)_icon")
            default:
                return Image("Neutral_icon")
        }
    }
    
    func workIcons(work: String) -> Image{
        switch work{
            //Displays Icons for work suitabilty
        case "Handiwork":
            return Image("\(work)_Icon")
        case "Kindling":
            return Image("\(work)_Icon")
        case "Watering":
            return Image("\(work)_Icon")
        case "Generating Electricity":
            return Image("Generating_Electricity_Icon")
        case "Gathering":
            return Image("\(work)_Icon")
        case "Lumbering":
            return Image("\(work)_Icon")
        case "Mining":
            return Image("\(work)_Icon")
        case "Medicine Production":
            return Image("Medicine_Production_Icon")
        case "Cooling":
            return Image("\(work)_Icon")
        case "Transporting":
            return Image("\(work)_Icon")
        case "Farming":
            return Image("\(work)_Icon")
        case "Planting":
            return Image("\(work)_Icon")
        default:
            return Image("Handiwork_Icon")
        }
    }
    
    func colorForElement(workname: String, worklist: [String: Int]) -> Color {
        if worklist.keys.contains(workname) {
            // Used to change font to black if work suitability is found for pal
            return .black
        } else {
            return .white
        }
    }
    
    func palNametoIcon(palName: String) -> Image{
        return Image(palName)
    }
    
    func numberForElement(workname: String, worklist: [String: Int]) -> Int {
        //returns value of work suitabilty if found for pal
        if let value = worklist[workname] {
            return value
        } else {
            return 0
        }
    }

    
}
