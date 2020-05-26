# require modules here
require "yaml"

def load_library(file)
  empty_hash = {}
  library = YAML.load_file('./lib/emoticons.yml')
  library.each do |key, value|
    empty_hash[key] = {}
    empty_hash[key][:english] = value[0]
    empty_hash[key][:japanese] = value[1]
  end
  empty_hash
end

def get_japanese_emoticon(library, emoticon)
  emoticons = load_library(library)
  emoticons.each do |key, value|
    if emoticons[key][:english] == emoticon
      return emoticons[key][:japanese]
  end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(library, emoticon)
  emoticons = load_library(library)
  emoticons.each do |key, value|
    if emoticons[key][:japanese] == emoticon
      return key
  end
  end
  return "Sorry, that emoticon was not found"
end 