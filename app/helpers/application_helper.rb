module ApplicationHelper

    def slugize(text)
        slug = text.gsub(/\s+/, '-').downcase
    end

    def get_excerpt(text)
        text = strip_tags(text)
        words = text.split
        words[0..54].join(" ")
    end
end
