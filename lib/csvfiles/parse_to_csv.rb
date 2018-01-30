require 'csv'

CSV.open("cosing_colorants.csv", "wb") do |csv|
  CSV.foreach("/home/aleksandra/projekty/code_sensei/beautyworld/tmp/COSING_Annex IV_v2.csv") do |row|
    csv << ["#{row[2]}/#{row[1]}/#{row[16]}(#{row[5]})"]
  end
end
