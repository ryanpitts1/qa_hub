class AffectedBrowsersData < ActiveRecord::Base
  attr_accessible :browser, :label, :priority, :active
end