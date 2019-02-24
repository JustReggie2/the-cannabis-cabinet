strains_list = {
  "Bugatti OG" => {
    category: "Hybrid",
    positives: "Relaxing and good for pain.",
    negatives: "Dry eyes and dry mouth."
  },
  "White Fire 43" => {
    category: "Indica",
    positives: "Relaxing and good for insomnia.",
    negatives: "Dry eyes."
  },
  "Candyland" => {
    category: "Sativa",
    positives: "Happy and good for depression.",
    negatives: "Dry mouth."
  },
  "Pink Lemonade" => {
    category: "Hybrid",
    positives: "Happy and good for stress.",
    negatives: "Dry mouth and can become anxious."
  },
  "Forbidden Fruit" => {
    category: "Indica",
    positives: "Relaxing and good for stress.",
    negatives: "Dry mouth."
  },
  "Harlequin" => {
    category: "Sativa",
    positives: "Uplifting and good for pain.",
    negatives: "Dry Mouth."
  },
  "Blue Dream" => {
    category: "Hybrid",
    positives: "Happy and good for stress.",
    negatives: "Dry mouth and dry eyes."
  },
  "Girl Scout Cookies" => {
    category: "Hybrid",
    positives: "Happy, Relaxed, Euphoric, Uplifting. Good for stress, depression, & pain.",
    negatives: "Dry mouth and dry eyes."
  },
  "OG Kush" => {
    category: "Hybrid",
    positives: "Relaxed, Happy, Euphoric, Uplifting. Good for stress, depression, pain, & insomnia.",
    negatives: "Dry mouth and dry eyes."
  },
  "Gorilla Glue #4" => {
    category: "Hybrid",
    positives: "Relaxed, Happy, Euphoric, Uplifting. Good for stress, pain, depression, & insomnia.",
    negatives: "Dry mouth and dry eyes."
  },
  "White Widow" => {
    category: "Hybrid",
    positives: "Happy, Relaxed, Uplifting, Euphoric, Creative. Good for stress, depression, & pain.",
    negatives: "Dry mouth and dry eyes."
  },
  "Pineapple Express" => {
    category: "Hybrid",
    positives: "Happy, Uplifting, Relaxed, Euphoric, Energetic. Good for depression, stress, pain, & fatigue.",
    negatives: "Dry mouth and dry eyes."
  },
  "Trainwreck" => {
    category: "Hybrid",
    positives: "Euphoric, Happy, Uplifting, Relaxed. Good for stress, pain, & depression.",
    negatives: "Dry mouth and dry eyes."
  },
  "Sherbert" => {
    category: "Hybrid",
    positives: "Relaxed, Happy, Euphoric, Uplifting. Good for stress, depression, & pain.",
    negatives: "Dry mouth and dry eyes."
  },
  "Sour Diesel" => {
    category: "Sativa",
    positives: "Happy, Uplifting, Energetic, Euphoric. Good for stress, depression, & pain.",
    negatives: "Dry Mouth and dry eyes."
  },
  "Jack Herer" => {
    category: "Sativa",
    positives: "Happy, Energetic, Uplifting, Euphoric, Creative. Good for stress, depression, & pain.",
    negatives: "Dry Mouth and dry eyes."
  },
  "Purple Haze" => {
    category: "Sativa",
    positives: "Euphoric, Happy, Uplifting, Relaxed, Creative. Good for stress, depression, pain, fatigue, & nausea.",
    negatives: "Dry Mouth, dizziness, & dry eyes."
  },
  "Grapefruit" => {
    category: "Sativa",
    positives: "Happy, Energetic, Uplifting, Euphoric, Talkative. Good for depression, stress, & headaches.",
    negatives: "Dry Mouth."
  },
  "Super Silver Haze" => {
    category: "Sativa",
    positives: "Happy, Uplifting, Energetic, Relaxed, Euphoric. Good for stress, depression, pain, & fatigue.",
    negatives: "Dry Mouth."
  },
  "Lemon Haze" => {
    category: "Sativa",
    positives: "Happy, Uplifting, Euphoric, Energetic, Relaxed. Good for stress, depression, & pain.",
    negatives: "Dry Mouth & dry eyes."
  },
  "Durban Poison" => {
    category: "Sativa",
    positives: "Energetic, Uplifting, Focused, Happy, Euphoric. Good for depression, stress, & fatigue.",
    negatives: "Dry Mouth."
  },
  "Jack the Ripper" => {
    category: "Sativa",
    positives: "Happy, Energetic, Creative, Focused, Euphoric. Good for stress, depression, & pain.",
    negatives: "Dry Mouth."
  },
  "Bubba Kush" => {
    category: "Indica",
    positives: "Relaxed, Sleepy, Happy. Good for stress, pain, insomnia, & depression.",
    negatives: "Dry mouth."
  },
  "Northern Lights" => {
    category: "Indica",
    positives: "Relaxed, Happy, Sleepy, Euphoric. Good for stress, insomnia, pain, & depression.",
    negatives: "Dry mouth."
  },
  "Purple Kush" => {
    category: "Indica",
    positives: "Relaxed, Happy, Sleepy, Euphoric. Good for stress, pain, insomnia, depression, & fatigue.",
    negatives: "Dry mouth & dry eyes."
  },
  "LA Confidential" => {
    category: "Indica",
    positives: "Relaxed, Euphoric, Happy, Sleepy. Good for stress, pain, insomnia, & depression.",
    negatives: "Dry mouth & dry eyes."
  },
  "Platinum OG" => {
    category: "Indica",
    positives: "Relaxed, Sleepy, Happy, Euphoric. Good for stress, insomnia, pain, & depression.",
    negatives: "Dry mouth & dry eyes."
  },
  "Critical Mass" => {
    category: "Indica",
    positives: "Relaxed, Happy, Euphoric. Good for stress, pain, depression, inflammation, & insomnia.",
    negatives: "Dry mouth & dry eyes."
  },
  "Super Skunk" => {
    category: "Indica",
    positives: "Relaxed, Happy, Sleepy. Good for pain, stress, depression, insomnia, & headaches.",
    negatives: "Dry mouth."
  },
  "G13" => {
    category: "Indica",
    positives: "Relaxed, Happy, Uplifting, Euphoric, Hungry. Good for stress, pain, depression, & lack of appetite.",
    negatives: "Dry mouth."
  }
}

strains_list.each do |name, strain_hash|
  s = Strain.new
  s.name = name
  strain_hash.each do |attribute, value|
    s[attribute] = value
  end
  s.save
end
