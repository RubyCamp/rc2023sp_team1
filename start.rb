## スタート画面

require 'dxruby'

def start_action
    # 画像ファイル読込
    start_image = Image.load("start_image.png")

    Window.loop do
        Window.draw(0, 0, start_image)
        
        # スペースキーを押してゲーム画面へ
        break if Input.key_push?(K_SPACE)
    end
end
