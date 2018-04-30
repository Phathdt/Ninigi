module Owner
  class ReviewSerializer < BaseSerializer
    attributes :content, :point
    set_type :reviews
    set_key_transform :camel_lower

    attribute :user_name do |review|
      review.user.name
    end

    attribute :images do |review|
      review.images.map do |t|
        {
          id: t.id,
          url: t.url(scope[:size] || :medium)
        }
      end
    end
  end
end
