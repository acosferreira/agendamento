class NewslettersController < ApplicationController
 active_scaffold :newsletters do |config|
   config.columns=[:name, :content]
 end
end
