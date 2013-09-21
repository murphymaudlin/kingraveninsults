
module StaticPagesHelper
  MAX_LENGTH = 50
  
  CODE_MEANINGS = {
    "<N>" => :noun,
    "<V>" => :verb,
    "<A>" => :adjective,
    "<NP>" => :noun_phrase,
    "<VP>" => :verb_phrase
  }
  
  NOUNS = {
    "fuck" => 0,
    "dumpster" => 0
  }
  
  VERBS = {
    "fucked" => nil,
    "blasted" => nil
  }
  
  ADJECTIVES = {
    "planting" => nil,
    "fucking" => nil,
    "typical" => nil
  }
    
  NOUN_PHRASE_TEMPLATES = {
    "<N>"     => 50,
    "<N><N>"     => 25,
    "<NP> <NP>" => 5,
    "<A> <NP>" => 50
  }
  
  VERB_PHRASE_TEMPLATES = {
    "<V>" => nil,
    "<N><V>" => nil
  }
  
  INSULT_TEMPLATES = {
    "You're a <NP>" => nil,
    "You're just a <NP>" => nil,
    "Get <VP>, <NP>" => nil,
    "Get <VP> on, <NP>" => nil,
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
  
  def insult
    evaluate_template(weighted_sample(INSULT_TEMPLATES))
  end
  
  def evaluate_template(template)
    puts "entering... (template = #{template})"
    begin
      return template if no_codes?(template)
    
      result = template.dup
      CODE_MEANINGS.each do |code, method_name|
        raise if result.length > MAX_LENGTH
        result.gsub!(code) { |c| send(method_name) } if result.match(code)
      end
    
      result
    rescue
      puts "rescued!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
      return evaluate_template(template)
    end
  end
  
  def no_codes?(template)
    CODE_MEANINGS.keys.none? { |code| template.match(code) }
  end
  
  def weighted_sample(weighted_hash)
    return weighted_hash.keys.sample if weighted_hash.values.uniq.size == 1
    
    zeroed_weighted_hash = {}.tap do |zeroed_weighted_hash| 
      weighted_hash.each do |k, v|
        zeroed_weighted_hash[k] = weighted_hash[k] == nil ? 0 : weighted_hash[k]
      end
    end
    
    probabilities_sum = zeroed_weighted_hash.values.inject(&:+)
    
    pruned_weighted_hash = zeroed_weighted_hash.select { |_, p| p > 0 }
    
    pruned_weighted_hash.each do |code, p|
      return code if p > rand(probabilities_sum)
      probabilities_sum -= p
    end
  end
end

class T
  include StaticPagesHelper
end
t = T.new
