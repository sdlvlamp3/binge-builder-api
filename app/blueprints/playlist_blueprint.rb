# frozen_string_literal: true

class PlaylistBlueprint < Blueprinter::Base
    identifier :id

    association :user, blueprint: UserBlueprint, view: :normal

    view :normal do
        fields :title, :description
    end

    view :extended do
        include_view :normal
        fields :description, :updated_at, :created_at
    end
end
