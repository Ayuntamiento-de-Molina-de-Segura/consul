load Rails.root.join("app", "controllers", "budgets", "investments_controller.rb")

module Budgets
    class InvestmentsController < ApplicationController
        
        private
            def allowed_params
                attributes = [:heading_id, :tag_list, :organization_name, :location, :zone,
                              :terms_of_service, :related_sdg_list,
                              image_attributes: image_attributes,
                              documents_attributes: document_attributes,
                              map_location_attributes: map_location_attributes]
            
                [*attributes, translation_params(Budget::Investment)]
            end
    end
end
