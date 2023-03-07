#クリア画面
=begin
require 'dxruby'

#Window.width = 600
#Window.height = 400

image = Image.load('5.1.png')

Window.loop dos
    Window.draw(100,100,image)
    
end
=end

require 'dxruby'

font = Font.new(32)

Window.loop do
    Window.draw_font(230,200,"GAME CLEAR",font)

end


