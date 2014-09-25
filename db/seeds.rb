if ReleaseData.count == 0
  puts "Adding tools data to relase data table..."
    ReleaseData.create!(section: "tools", label: "AdminTools")
    ReleaseData.create!(section: "tools", label: "CMAdmin")
    ReleaseData.create!(section: "tools", label: "Fastlane")
    ReleaseData.create!(section: "tools", label: "FusionAdmin")
    ReleaseData.create!(section: "tools", label: "FusionMobile")
    ReleaseData.create!(section: "tools", label: "FusionWeb")
    ReleaseData.create!(section: "tools", label: "ScionTools")
  puts "...done!"
  puts "Adding development checklist data to relase data table..."
    ReleaseData.create!(section: "development", label: "Verify all stories to be relased in this sprint have been checked by QA.")
    ReleaseData.create!(section: "development", label: "Verify Admin Tools is functioning correctly.")
    ReleaseData.create!(section: "development", label: "Verify Fastlane is functioning correctly.")
    ReleaseData.create!(section: "development", label: "Verify all forms on all designs submit successfully.")
    ReleaseData.create!(section: "development", label: "Verify all research pages are showing correct data.")
    ReleaseData.create!(section: "development", label: "Verify all inventory search filters are functioning correctly.")
  puts "...done!"
  puts "Adding stage checklist data to relase data table..."
    ReleaseData.create!(section: "stage", label: "Verify all stories to be relased in this sprint have been checked by QA.")
    ReleaseData.create!(section: "stage", label: "Verify Admin Tools is functioning correctly.")
    ReleaseData.create!(section: "stage", label: "Verify Fastlane is functioning correctly.")
    ReleaseData.create!(section: "stage", label: "Verify all forms on all designs submit successfully.")
    ReleaseData.create!(section: "stage", label: "Verify all research pages are showing correct data.")
    ReleaseData.create!(section: "stage", label: "Verify all inventory search filters are functioning correctly.")
  puts "...done!"
  puts "Adding production checklist data to relase data table..."
    ReleaseData.create!(section: "production", label: "Verify all monitors have been turned off.")
    ReleaseData.create!(section: "production", label: "Verify all stories to be relased in this sprint have been checked by QA.")
    ReleaseData.create!(section: "production", label: "Verify Admin Tools is functioning correctly.")
    ReleaseData.create!(section: "production", label: "Verify Fastlane is functioning correctly.")
    ReleaseData.create!(section: "production", label: "Verify all forms on all designs submit successfully.")
    ReleaseData.create!(section: "production", label: "Verify all research pages are showing correct data.")
    ReleaseData.create!(section: "production", label: "Verify all inventory search filters are functioning correctly.")
    ReleaseData.create!(section: "production", label: "Verify all monitors have been turned back on.")
  puts "...done!"
end

if AffectedBrowsersData.count == 0
  AffectedBrowsersData.create!(browser: "IE 8", label: "IE 8")
  AffectedBrowsersData.create!(browser: "IE 9", label: "IE 9")
  AffectedBrowsersData.create!(browser: "IE 10", label: "IE 10")
  AffectedBrowsersData.create!(browser: "Firefox", label: "Firefox")
  AffectedBrowsersData.create!(browser: "Chrome", label: "Chrome")
  AffectedBrowsersData.create!(browser: "Safari", label: "Safari")
  AffectedBrowsersData.create!(browser: "Mobile", label: "Mobile")
end

if AffectedDesignsData.count == 0
  AffectedDesignsData.create!(category: "Acura", design: "AcuraLight", label: "Acura Light")
  AffectedDesignsData.create!(category: "Acura", design: "AcuraDark", label: "Acura Dark")
  AffectedDesignsData.create!(category: "Chevrolet", design: "ChevroletLight", label: "Chevrolet Light")
  AffectedDesignsData.create!(category: "Chevrolet", design: "ChevroletDark", label: "Chevrolet Dark")
  AffectedDesignsData.create!(category: "General", design: "GeneralLight", label: "General Light")
  AffectedDesignsData.create!(category: "General", design: "GeneralDark", label: "General Dark")
  AffectedDesignsData.create!(category: "GSM", design: "GSMLight", label: "GSM Light")
  AffectedDesignsData.create!(category: "GSM", design: "GSMDark", label: "GSM Dark")
  AffectedDesignsData.create!(category: "Ford", design: "FordLight", label: "Ford Light")
  AffectedDesignsData.create!(category: "Ford", design: "FordDark", label: "Ford Dark")
  AffectedDesignsData.create!(category: "Mazda", design: "MazdaLight", label: "Mazda Light")
  AffectedDesignsData.create!(category: "Mazda", design: "MazdaDark", label: "Mazda Dark")
  AffectedDesignsData.create!(category: "Scion", design: "ScionLight", label: "Scion Light")
  AffectedDesignsData.create!(category: "Scion", design: "ScionDark", label: "Scion Dark")
  AffectedDesignsData.create!(category: "Tools", design: "ScionToolsLight", label: "ScionTools Light")
  AffectedDesignsData.create!(category: "Tools", design: "ScionToolsDark", label: "ScionTools Dark")
end