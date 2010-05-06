require 'sb_view_helper'
require 'sb_controller_helper'

ActionView::Base.send(:include, SbViewHelper)
ActionController::Base.send(:include, SbContollerHelper)
