require "action_view/template"

ActionView::Template.register_template_handler :rb, lambda{ |template| template.source }

module Handlers
  
end