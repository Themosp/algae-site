module Concerns::TransliteratedFriendlyId
  extend ActiveSupport::Concern

  ALL_TRANSLITERATIONS = [
      :bulgarian,
      :cyrillic,
      :danish,
      :german,
      :latin,
      :macedonian,
      :norwegian,
      :romanian,
      :russian,
      :serbian,
      :spanish,
      :swedish,
      :ukrainian,
      :greek,
      :vietnamese
  ]

  included do
    extend FriendlyId

    def normalize_friendly_id(input)
      input.to_s.to_slug.normalize(transliterations: ALL_TRANSLITERATIONS).to_s
    end
  end
end
