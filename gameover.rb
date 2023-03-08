require 'dxruby'

def gameover_action
    font = Font.new(32)
    Window.loop do
        Window.draw_font(230,200,"GAME OVER",font)
        Window.draw_font(150,250,"スペースキーを押してください",font)
        break if Input.key_push?(K_SPACE)
    end
end
