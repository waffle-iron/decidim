# frozen_string_literal: true
module Decidim
  module Admin
    # Custom helpers, scoped to the admin panel.
    #
    module AttributesDisplayHelper
      def display_for(model, *attrs)
        content_tag(:dl) do
          attrs.map do |attr|
            display_label(model, attr) + display_value(model, attr)
          end.reduce(:+)
        end
      end

      private

      def display_label(model, attr)
        content_tag(:dt, model.class.human_attribute_name(attr))
      end

      def display_value(model, attr)
        association = model.class.reflect_on_all_associations.find{|a| a.name == attr}
        if association.present?
          title = model.send(association.name).try(:name) || model.send(association.name).try(:title)
          content_tag(:dd, title)
        else
          content_tag(:dd, model.send(attr).try(:html_safe))
        end
      end
    end
  end
end
