## Rubyロゴ4分割

require 'dxruby'
ruby_image = Image.load_tiles("images/ruby.png", 2, 2)  # ruby.pngを読込、横2縦2の4分割

#=begin

Window.loop do
    Window.draw(100, 200, ruby_image[0])  # 写真左上
    Window.draw(210, 200, ruby_image[1])  # 写真右上
    Window.draw(100, 310, ruby_image[2])  # 写真左下
    Window.draw(210, 310, ruby_image[3])  # 写真右下
end

#=end