module ApplicationHelper
  def troolean(bool, options = {})
    if bool
      options[:true] || "True"
    else
      options[:false] || ""
    end
  end
end
