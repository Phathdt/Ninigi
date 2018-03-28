class String
  def no_unicode
    string = downcase
    string = string.gsub(/[àáạảãâầấậẩẫăằắặẳẵ]/, 'a')
    string = string.gsub(/[èéẹẻẽêềếệểễ]/, 'e')
    string = string.gsub(/[òóọỏõôồốộổỗơờớợởỡ]/, 'o')
    string = string.gsub(/[ìíịỉĩ]/, 'i')
    string = string.gsub(/[ùúụủũưừứựửữ]/, 'u')
    string = string.gsub(/[ỳýỵỷỹ]/, 'y')
    string.gsub(/[đ]/, 'd')
  end
end
