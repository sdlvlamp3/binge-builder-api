# frozen_string_literal: true

class UserBlueprint < Blueprinter::Base
    identifier :id

    view :normal do
        fields :username, :email
    end

    view :extended do
        fields :username, :email, :created_at, :updated_at
    end

    association :playlists, blueprint: PLaylistBlueprint
end
