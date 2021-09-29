//
//  Texts.swift
//  Lesson3
//
//  Created by Tagir Kabirov on 29.09.2021.
//

import Foundation
class Text {
    static let texts = ["🐨The rise of technology and industry may have distanced us superficially from nature, but it has not changed our reliance on the natural world: most of what we use and consume on a daily basis remains the product of multitudes of interactions within nature, and many of those interactions are imperiled.", "🐱Fresh water: There is no physical substance humans require more than freshwater: without water we can only survive a few hellish days. While pollution and overuse has threatened many of the world’s drinking water sources, nature has an old-fashioned solution, at least, to pollution. Healthy freshwater ecosystems—watersheds, wetlands, and forests—naturally clean pollution and toxins from water. Soils, microorganisms, and plant roots all play a role in filtering and recycling out pollutants with a price far cheaper than building a water filtration plant. According to research, the more biodiverse the ecosystem, the faster and more efficiently water is purified.", "🐹Pollination: Imagine trying to pollinate every apple blossom in an orchard: this is what nature does for us. Insects, birds, and even some mammals, pollinate the world’s plants, including much of human agriculture. Around 80% of the world’s plants require a different species to act as pollinator.", "🦁Seed dispersal: Much like pollination, many of the world’s plants require other species to move their seeds from the parent plant to new sprouting ground. Seeds are dispersed by an incredibly wide-variety of players: birds, bats, rodents, megafauna like elephants and tapir, and even, researchers have recently discovered, fish. Seed dispersal is especially important for tropical forests where a majority of plants depend on animals to move.", "🐻Pest control: A recent study found that bats save US agriculture billions of dollars a year simply by doing what they do naturally: eating insects, many of which are potentially harmful to US crops."]
    
    static func getText() -> String {
        return texts[Int.random(in: 0..<texts.count)]
    }
}

