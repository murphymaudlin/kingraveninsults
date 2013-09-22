
module StaticPagesHelper
  MAX_LENGTH = 200
  PREVENT_REPEATS = true
  
  CODE_MEANINGS = {
    "<N>" => :noun,
    "<V>" => :verb,
    "<A>" => :adjective,
    "<NP>" => :noun_phrase,
    "<VP>" => :verb_phrase
  }
  
  SENTENCE_LENGTH_WEIGHTS = [0, 0, 10, 50, 200, 200, 100, 10, 2, 2, 1]
  
  NOUNS = {
    "bad" => nil,
    "plant" => nil,
    "planter" => nil,
    "dumpster" => nil,
    "fat" => nil,
    "kid" => nil,
    "nerd" => nil,
    "garbage" => nil,
    "trash" => nil,
    "scum" => nil,
    "pub" => nil,
    "clown" => nil,
    "fuck" => nil,
    "mad" => nil,
    "feeder" => nil,
    "bitch" => nil,
    "ass" => nil
  }
  
  VERBS = {
    "wrecked" => nil,
    "blasted" => nil,
    "rolled" => nil,
    "shitted" => nil,
    "fucked" => nil
  }
  
  ADJECTIVES = {
    "planting" => nil,
    "fucking" => nil,
    "typical" => nil,
    "feeding" => nil,
    "huge" => nil,
    "mammoth" => nil,
    "massive" => nil,
    "shitty" => nil
  }
    
  NOUN_PHRASE_TEMPLATES = {
    "<N>"     => nil,
    "<N><N>"     => nil,
    "<NP> <NP>" => 50,
    "<A> <NP>" => nil
  }
  
  VERB_PHRASE_TEMPLATES = {
    "<V>" => nil,
    "<V> on" => nil,
    "<N><V>" => nil,
    "<VP> and <VP>" => 10
  }
  
  INSULT_TEMPLATES = {
    "You're a <NP>" => nil,
    "You're a <NP> and a <NP>" => nil,
    "You're a <NP> and a <NP> to boot" => 1,
    "You're a <NP> and a <NP>, not to mention a <NP>" => 5,
    "You're just a <NP>" => nil,
    "Such a <NP>" => nil,
    "Get <VP>" => nil,
    "Get <VP>, <NP>" => nil,
    "Get <VP>, you <NP>" => nil,
    "You're like a <NP> getting <VP>" => 2,
    "You get <VP> every day of the week you <NP>" => 2,
    "Don't forget to get <VP>, <NP>" => 2,
    "Typical <NP>" => 200
  }
  
  def noun
    weighted_sample(NOUNS)
  end
  
  def verb
    weighted_sample(VERBS)
  end
  
  def adjective
    weighted_sample(ADJECTIVES)
  end
  
  def noun_phrase
    sample = evaluate_template(weighted_sample(NOUN_PHRASE_TEMPLATES))
    sample.split(' ').length < 3 ? sample : noun_phrase
  end
  
  def verb_phrase
    evaluate_template(weighted_sample(VERB_PHRASE_TEMPLATES))
  end
  
  def insult(length = nil)
    result = evaluate_template(weighted_sample(INSULT_TEMPLATES))
    until permit_insult?(result, length)
      result = evaluate_template(weighted_sample(INSULT_TEMPLATES))
    end
    result
  end
  
  def generate_insult(with_weights = true)
    return insult unless with_weights

    swap_a_for_an(insult(pick_length)) + "~"
  end
  
  def evaluate_template(template)
    begin
      return template if no_codes?(template)
    
      result = template.dup
      CODE_MEANINGS.each do |code, method_name|
        result.gsub!(code) { |c| send(method_name) } if result.match(code)
      end
      
      result
    rescue
      return evaluate_template(template)
    end
  end
  
  def no_codes?(template)
    CODE_MEANINGS.keys.none? { |code| template.match(code) }
  end
  
  def weighted_sample(weighted_hash)
    return weighted_hash.keys.sample if weighted_hash.values.uniq.size == 1
    
    leveled_weighted_hash = {}.tap do |result| 
      weighted_hash.each do |k, v|
        result[k] = weighted_hash[k] || 100
      end
    end
    
    probabilities_sum = leveled_weighted_hash.values.inject(&:+)
    
    pruned_weighted_hash = leveled_weighted_hash.select { |_, p| p > 0 }
    pruned_weighted_hash.each do |code, p|
      return code if p > rand(probabilities_sum)
      probabilities_sum -= p
    end
  end
  
  def repeated_words?(sentence)
    words = sentence.split(' ')
    
    i = 0
    while i < words.length - 1
      return true if words[i] == words[i + 1]
      
      i += 1
    end
    false
  end
  
  def permit_length?(sentence, length)
    return true unless length
    sentence.split(' ').count == length
  end
  
  def permit_insult?(insult, length)
    permit_length?(insult, length) && (PREVENT_REPEATS && !repeated_words?(insult))
  end
  
  def swap_a_for_an(string)
    words = string.split(' ')
    
    i = 0
    while i < (words.length - 1)
      if words[i] == 'a' && words[i + 1].start_with?('a', 'e', 'i', 'o', 'u')
        words[i] = 'an'
      end
      
      i += 1
    end
    
    words.join(' ')
  end
  
  def pick_length
    probabilities_sum = SENTENCE_LENGTH_WEIGHTS.inject(&:+)
    SENTENCE_LENGTH_WEIGHTS.each_with_index do |weight, i|
      return i if weight > rand(probabilities_sum)
      probabilities_sum -= weight
    end
    return nil
  end
end

class T
  include StaticPagesHelper
  
  def self.length_freq(n = 1000)
    tester = T.new
    
    results = Hash.new(1).tap do |results|
      n.times do 
        current = tester.pick_length
        results[current] += 1
      end
    end
    
    results.each do |freq, count|
      puts "#{count} instances of #{freq} (out of #{n})"
    end
    
    nil
  end
  
  def self.insult_freq(n = 1000)
    tester = T.new
    
    results = Hash.new(1).tap do |results|
      n.times do 
        current = tester.generate_insult
        results[current.split(' ').size] += 1
      end
    end
    
    results.each do |freq, count|
      puts "#{count} instances of #{freq}-length insults (out of #{n})"
    end
    
    nil
  end
  
  def self.repeated_words?(n = 1000)
    tester = T.new
    
    n.times do
      current = tester.generate_insult
      return true if tester.repeated_words? current
    end
    
    false
  end
end
