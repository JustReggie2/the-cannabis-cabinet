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
