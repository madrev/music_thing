module ApplicationHelper

  def auth_token
    html = "<input type = 'hidden' name = 'authenticity_token' value = '#{form_authenticity_token}'>"
    html.html_safe
  end

  def ugly_lyrics(lyrics)
    return nil if lyrics.nil?
    lines = lyrics.split("\n")
    lines.map! {|line| line.chomp("\r")}
    html = "<pre>"

    lines.each do |line|
      html += "&#9835;" unless line.empty?
      html += " #{h(line)}\n"
    end

    html += "</pre>"
    html.html_safe
  end

end
