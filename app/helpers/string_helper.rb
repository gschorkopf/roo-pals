module StringHelper
  def camelcased(string)
    string.camelize(:lower).gsub(/\s+/, "")
  end

  def underscored(string)
    string.downcase.gsub(' ', '_')
  end
end
