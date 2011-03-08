require "action_view/template"
require "rdiscount"

ActionView::Template.register_template_handler :rb, :source.to_proc
ActionView::Template.register_template_handler :string, lambda {|template| "%Q{#{template.source}}"}
ActionView::Template.register_template_handler :md, lambda {|template| "RDiscount.new(#{template.source.inspect}).to_html"}

module Handlers
  
end