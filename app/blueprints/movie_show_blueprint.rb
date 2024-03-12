# frozen_string_literal: true

class MovieShowBlueprint < Blueprinter::Base
    identifier :id

    view :normal do
        fields :title, :description, :release_date
    end

    view :extended do
        include_view :normal
        fields :created_at, :updated_at
    end
end
