
module StaticPagesHelper
  DEFAULT = {
    max_length: 200,
    prevent_repeats: true,

    code_meanings: {
      "<N>" => :noun,
      "<NS>" => :noun_single,
      "<V>" => :verb,
      "<A>" => :adjective,
      "<NP>" => :noun_phrase,
      "<VP>" => :verb_phrase
    },

    sentence_length_weights: [0, 0, 10, 50, 200, 200, 100, 10, 2, 2, 1],

    nouns: {
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
      "ass" => nil,
      "can" => nil,
      "dick" => nil,
      "nub" => nil,
      "bin" => nil,
      "fucker" => nil
    },

    noun_singles: {
      "tryhard"     => nil,
      "shitter"     => nil,
      "whale"       => 5,
      "walrus"      => 5
    },

    verbs: {
      "wrecked"       => nil,
      "blasted"       => nil,
      "rolled"        => nil,
      "shitted"       => nil,
      "fucked"        => nil,
      "canned"        => nil,
      "roasted"       => nil,
      "YOLO swagged"  => 10,
      "rolled"        => nil
    },

    adjectives: {
      "planting"      => nil,
      "fucking"       => nil,
      "typical"       => nil,
      "feeding"       => nil,
      "huge"          => nil,
      "mammoth"       => nil,
      "massive"       => nil,
      "shitty"        => nil,
      "public"        => nil
    },

    noun_phrase_templates: {
      "<N>"           => nil,
      "<NS>"          => 50,
      "<N><N>"        => nil,
      "<NP> <NP>"     => 50,
      "<A> <NP>"      => nil
    },

    verb_phrase_templates: {
      "<V>"           => nil,
      "<V> on"        => nil,
      "<N><V>"        => nil,
      "<VP> and <VP>" => 10,
      "fucking <VP>"  => nil
    },

    insult_templates: {
      "You're a <NP>"                                     => nil,
      "You're a <NP> and a <NP>"                          => nil,
      "You're a <NP> and a <NP> to boot"                  => 1,
      "You're a <NP> and a <NP>, not to mention a <NP>"   => 10,
      "You're just a <NP>"                                => nil,
      "You're such a <NP>"                                => nil,
      "Such a <NP>"                                       => nil,
      "Get <VP>"                                          => nil,
      "Get <VP>, <NP>"                                    => nil,
      "Get <VP>, you <NP>"                                => nil,
      "You're like a <NP> getting <VP>"                   => 10,
      "You get <VP> every day of the week you <NP>"       => 10,
      "Don't forget to get <VP>, <NP>"                    => 10,
      "Typical <NP>"                                      => nil,
      "<NP> detected"                                     => nil,
      "I've never seen such a <A> <NP>"                   => 4
    }
  }

  CLASSIC = {
    max_length: 200,
    prevent_repeats: true,
    code_meanings: {
      "<N>" => :noun,
      "<V>" => :verb,
      "<A>" => :adjective,
      "<NP>" => :noun_phrase,
      "<VP>" => :verb_phrase
    },
    sentence_length_weights: [0, 0, 50, 50, 200, 100, 50],
    nouns: {
      "bad" =>        nil,
      "plant" =>      nil,
      "planter" =>    nil,
      "dumpster" =>   nil,
      "fat" =>        nil,
      "kid" =>        nil,
      "garbage" =>    nil,
      "trash" =>      nil,
      "scum" =>       nil,
      "pub" =>        nil,
      "clown" =>      nil,
      "fuck" =>       nil,
      "fag" =>        nil,
      "nerd" =>       nil,
      "tryhard" =>    nil,
      "dump" =>       nil
    },

    verbs: {
      "wrecked" =>    nil,
      "blasted" =>    nil,
      "rolled" =>     nil,
      "stomped" =>    nil
    },
    adjectives: {
      "fucking" =>    nil,
      "planting" =>   nil,
      "typical" =>    nil,
      "public" =>     nil
    },
    noun_phrase_templates: {
      "<N>" =>            nil,
      "<A> <NP>" =>       nil,
      "<N><N>" =>         nil,
      "<NP> <NP>" =>      nil
    },
    verb_phrase_templates: {
      "<V>" =>            nil,
      "fucking <VP>" =>   nil,
      "fucking <VP> on" => nil,
      "<V> on" =>         nil
    },
    insult_templates: {
      "You're a <NP>" =>    nil,
      "Get <VP>" =>         50,
      "Get <VP>, <NP>" =>   50,
      "What a <NP>" =>      nil,
      "Typical <NP>" =>     nil
    }
  }

  COMPLEMENTS = {
    max_length: 200,
    prevent_repeats: true,
    code_meanings: {
      "<N>" => :noun,
      "<V>" => :verb,
      "<A>" => :adjective,
      "<NP>" => :noun_phrase,
      "<NS>" => :noun_single
    },
    sentence_length_weights: [0, 0, 0, 50, 100, 50, 0, 25, 25],
    nouns: {
      "puppy" =>      nil,
      "bunny" =>      nil,
      "angel" =>      nil,
      "cookie" =>     nil,
      "darling" =>    nil,
      "flower" =>     50,
      "star" =>       nil,
      "skunk" =>      1,
      "honey" =>      nil
    },
    adjectives: {
      "wonderful" =>  nil,
      "kind" =>       nil,
      "fluffy" =>     nil,
      "caring" =>     nil,
      "sweet" =>      nil,
      "cuddly" =>     nil,
      "radiant" =>    50,
      "sunny" =>      nil,
      "cheery" =>     nil,
      "beautiful" =>  nil,
      "magical" =>    nil,
      "merry" =>      nil,
      "darling" =>    nil,
      "melodious" =>  nil,
      "gorgeous" =>   nil,
      "marvelous" =>  nil,
      "fabulous" =>   nil,
      "delightful" => nil,
      "blessed" =>    nil,
      "graceful" =>   nil,
      "sparkling" =>  nil
    },
    noun_singles: {
      "sweetiepie" => nil,
      "honeybunny" => nil,
      "songbird" =>   nil,
      "pot roast" =>  1,
      "cupcake" =>    nil,
      "butterfly" =>  50
    },
    noun_phrase_templates: {
      "<N>" =>              nil,
      "<NS>" =>             50,
      "<N><N>" =>           25,
      "<A> <N>" =>          nil,
      "<A> <N><N>" =>       25,
      "<A>, <A> <N>" =>     nil,
      "<A>, <A> <N><N>" =>  25
    },
    insult_templates: {
      "You're a <NP>" =>                        nil,
      "You are a <NP>" =>                       nil,
      "You're always so <A>, <N><N>" =>         50,
      "You're always so <A> and <A>, <N><N>" => 50,
      "You're such a <NP>" =>                   nil,
      "You look <A> today" =>                   nil,
      "Stay <A>, you <NP>" =>                   nil,
      "I hope you have a <A> day" =>            30,
      "I hope you have a <A> day, <N>" =>       30,
      "I hope you have a <A> day, <N><N>" =>    30,
      "You're the most <A> <N> I know" =>       50,
      "You're the most <A> <N><N> I know" =>    50
    }
  }

  def noun(assets)
    weighted_sample(assets[:nouns])
  end

  def noun_single(assets)
    weighted_sample(assets[:noun_singles])
  end

  def verb(assets)
    weighted_sample(assets[:verbs])
  end

  def adjective(assets)
    weighted_sample(assets[:adjectives])
  end

  def noun_phrase(assets)
    sample = evaluate_template(weighted_sample(assets[:noun_phrase_templates]), assets)
    sample.split(' ').length < 3 ? sample : noun_phrase(assets)
  end

  def verb_phrase(assets)
    evaluate_template(weighted_sample(assets[:verb_phrase_templates]), assets)
  end

  def insult(length = nil, assets = default)
    result = evaluate_template(weighted_sample(assets[:insult_templates]), assets)
    until permit_insult?(result, length, assets)
      result = evaluate_template(weighted_sample(assets[:insult_templates]), assets)
    end
    result
  end

  def generate_insult(assets = DEFAULT)
    assets = CLASSIC if assets == "classic"
    assets = COMPLEMENTS if assets == "complement"
    swap_a_for_an(insult(pick_length(assets), assets))
  end

  def evaluate_template(template, assets)
    begin
      return template if no_codes?(template, assets)
      result = template.dup

      assets[:code_meanings].each do |code, method_name|
        result.gsub!(code) { |c| self.send(method_name, assets) } if result.match(code)
      end

      result
    rescue
      return evaluate_template(template, assets)
    end
  end

  def no_codes?(template, assets)
    assets[:code_meanings].keys.none? { |code| template.match(code) }
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

  def permit_insult?(insult, length, assets)
    permit_length?(insult, length) && (assets[:prevent_repeats] && !repeated_words?(insult))
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

  def pick_length(assets)
    probabilities_sum = assets[:sentence_length_weights].inject(&:+)
    assets[:sentence_length_weights].each_with_index do |weight, i|
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
