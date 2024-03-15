# frozen_string_literal: true

class GenreBlueprint < Blueprinter::Base
    identifier :id

    view :normal do
        fields :genre_type
    end

    view :extended do
        include_view :normal
        fields :created_at, :updated_at
    end
end

