module ApplicationHelper

    def slugize(text)
        slug = text.gsub(/\s+/, '-').downcase
    end

    def get_excerpt(text, number_of_words = 54)
        text = strip_tags(text)
        words = text.split
        words[0..number_of_words].join(" ")
    end
end
