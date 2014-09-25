module ReleaseItemsHelper
  def count_or_zero
    self.any? ? self.count : 0
  end
	
  def build_source_url(source, ref)
    if source == "FogBugz"
      "<a href='https://clickmotive.fogbugz.com/default.asp?#{ref}' target='_blank'>#{ref}</a> - ".html_safe
    elsif source == "VersionOne"
      "<a href='https://www10.v1host.com/ClickMotive/Search.mvc/advanced?q=#{ref}' target='_blank'>#{ref}</a> - ".html_safe
    elsif source == "ZenDesk"
      "<a href='http://clickmotive.zendesk.com/tickets/#{ref}' target='_blank'>#{ref}</a> - ".html_safe
    end
  end
  
  def convert_risk_level_to_words(level)
    if level == "1" || level == 1.0
      "<span class='low-risk'>Low Risk</span>".html_safe
    elsif level == "2" || level == 2.0
      "<span class='medium-risk'>Medium Risk</span>".html_safe
    elsif level == "3" || level == 3.0
      "<span class='high-risk'>High Risk</span>".html_safe
    end
  end
  
  def convert_comfort_level_to_words(level)
    if level == "1" || level == 1.0
      "<span class='low-comfort'>Low Comfort</span>".html_safe
    elsif level == "2" || level == 2.0
      "<span class='medium-comfort'>Medium Comfort</span>".html_safe
    elsif level == "3" || level == 3.0
      "<span class='high-comfort'>High Comfort</span>".html_safe
    end
  end
end