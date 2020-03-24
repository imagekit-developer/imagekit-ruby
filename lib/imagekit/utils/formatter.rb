def snake_to_camel(word)
  word_list = word.split("_")
  result = []
  word_list&.each { |i|
    if i == word_list[0]
      result.push(i)
    else
      result.push(i.capitalize)
    end
  }
  result.join
end

def camel_to_snake(camel_word)
  # convert camel case to snake case
  camel_word.to_s.gsub(/::/, "/")
    .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
    .gsub(/([a-z\d])([A-Z])/, '\1_\2')
    .tr("-", "_")
    .downcase
end

def request_formatter(data)
  result = {}
  data.each do |key, val|
    result[snake_to_camel(key.to_s)] = val
  end
  result
end
