# https://github.com/rails/strong_parameters
# including this in all active record classes ensures we're always protected
# alternative is to include this module in each class individually

ActiveRecord::Base.send(:include, ActiveModel::ForbiddenAttributesProtection)
