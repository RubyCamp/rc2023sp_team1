
## クリア画面

require 'dxruby'

def clear_action 
    font = Font.new(32)
    Window.loop do
        Window.draw_font(230,200,"GAME CLEAR",font)
    end
end