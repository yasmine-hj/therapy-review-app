module ApplicationHelper
    def render_stars(stars)
        output = ''
        if (1..5).include?(stars.to_i)
          stars.to_i.times { output += '⭐'}
        end
        output
      end
end
