module TorgApi
  module Api
    # Справочник кодов ОКДП
    class Okdp < TorgApi::Base
      # @param id [Integer] id okdp

      # @return [Integer] id
      attr_accessor :id
      # @return [Integer] Полное наименование
      attr_accessor :fullname
      # @return [Integer] Наименование
      attr_accessor :title
      # @return [Integer] Код
      attr_accessor :code

      class << self
        def find(id)
          responce = JSON.parse(
            torg_resource["okdp/show"].get(
              params: { id: id },
              accept: :json,
              content_type: :json,
              format: :json
            ),
            symbolize_names: true
          )
          new(responce[:okdp])
        end

        def find_old_code(new_value)
          JSON.parse(
            torg_resource["okdp/reform_old_value"].get(
              params: { new_value: new_value },
              accept: :json,
              content_type: :json,
              format: :json
            ),
            symbolize_names: true
          )
        end

      end
    end
  end
end
